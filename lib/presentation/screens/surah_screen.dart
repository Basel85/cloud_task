import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quran_app/business_logic/cubits/last_read/last_read_cubit.dart';
import 'package:quran_app/business_logic/cubits/surah/surah_cubit.dart';
import 'package:quran_app/business_logic/cubits/surah/surah_states.dart';
import 'package:quran_app/business_logic/cubits/ayah_selection/ayah_selection_cubit.dart';
import 'package:quran_app/business_logic/cubits/ayah_selection/ayah_selection_states.dart';
import 'package:quran_app/presentation/widgets/shared/api_error_message_component.dart';
import 'package:quran_app/presentation/widgets/shared/column_located_on_the_first_body.dart';
import 'package:quran_app/presentation/widgets/shared/custom_app_bar.dart';
import 'package:quran_app/presentation/widgets/shared/custom_circluar_progress_indicator.dart';
import 'package:quran_app/presentation/widgets/shared/quran_meta_data_component.dart';
import 'package:quran_app/utils/app_themes.dart';
import 'package:quran_app/utils/size_config.dart';
import 'package:quran_app/utils/snackbar_viewer.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

class SurahScreen extends StatefulWidget {
  final int surahNumber;
  final String surahEnglishName;
  final String surahEnglishNameTranslation;
  final int numberOfAyahs;
  final int startingAyahNumber;
  const SurahScreen(
      {super.key,
      required this.surahNumber,
      required this.surahEnglishName,
      required this.surahEnglishNameTranslation,
      required this.numberOfAyahs,
      required this.startingAyahNumber});

  @override
  State<SurahScreen> createState() => _SurahScreenState();
}

class _SurahScreenState extends State<SurahScreen> with SnackBarViewer {
  int _previousAyahNumber = -1;
  late int _ayahNumber;
  late String _surahEnglishName;
  final ItemScrollController _itemScrollController = ItemScrollController();
  final GlobalKey _lastItemKey = GlobalKey();

  @override
  void initState() {
    _ayahNumber = widget.startingAyahNumber;
    _surahEnglishName = widget.surahEnglishName;
    SurahCubit.get(context).getSurahAyahs(surahNumber: widget.surahNumber);
    super.initState();
  }

  Future<void> updateLastReadWidget() async {
    debugPrint(
        "$_ayahNumber ${widget.startingAyahNumber} $_surahEnglishName ${widget.surahEnglishName}");
    if (!(_ayahNumber == widget.startingAyahNumber &&
        _surahEnglishName == widget.surahEnglishName)) {
      await LastReadCubit.get(context).getValues();
      debugPrint("Hello my friend");
    }
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        await updateLastReadWidget();
        return true;
      },
      child: Scaffold(
          appBar: PreferredSize(
            preferredSize: Size.fromHeight(92 * SizeConfig.verticalBlock),
            child: CustomAppBar(
              asyncFunctionInvokeInBackButtonOnTap: () =>
                  updateLastReadWidget(),
              title: "Surah",
              isHome: false,
            ),
          ),
          body: ColumnLocatedOnTheFirstBody(
            widgets: [
              SizedBox(
                height: 18 * SizeConfig.verticalBlock,
              ),
              Container(
                width: double.infinity,
                margin: EdgeInsets.only(
                    left: 32 * SizeConfig.horizontalBlock,
                    right: 35 * SizeConfig.horizontalBlock),
                child: QuranMetaDataComponent(
                  surahEnglishName: widget.surahEnglishName,
                  surahEnglishNameTranslation:
                      widget.surahEnglishNameTranslation,
                  numberOfAyahs: widget.numberOfAyahs,
                  isHome: false,
                ),
              ),
              SizedBox(
                height: 18 * SizeConfig.verticalBlock,
              ),
              Expanded(
                child: BlocBuilder<SurahCubit, SurahState>(
                  buildWhen: (previous, current) =>
                      current is SurahGetSurahAyahsLoadingState ||
                      current is SurahGetSurahAyahsSuccessState ||
                      current is SurahGetSurahAyahsErrorState,
                  builder: (_, state) {
                    if (state is SurahGetSurahAyahsSuccessState) {
                      try {
                        return RefreshIndicator(
                          backgroundColor: AppThemes.color0xFFDAD0E1,
                          color: AppThemes.color0xFF300759,
                          strokeWidth: 2 * SizeConfig.horizontalBlock,
                          displacement: 40 * SizeConfig.verticalBlock,
                          onRefresh: () => SurahCubit.get(context)
                              .getSurahAyahs(surahNumber: widget.surahNumber),
                          child: ScrollablePositionedList.builder(
                            itemScrollController: _itemScrollController,
                            padding: EdgeInsets.only(
                              left: 6 * SizeConfig.horizontalBlock,
                              right: 25 * SizeConfig.horizontalBlock,
                            ),
                            itemBuilder: (_, index) => BlocConsumer<
                                AyahSelectionCubit, AyahSelectionState>(
                              listenWhen: (previous, current) =>
                                  current is AyahSelectionSuccessState &&
                                      (current.currentAyahNumber == index + 1 ||
                                          _previousAyahNumber == index + 1) ||
                                  current is AyahSelectionErrorState,
                              listener: (_, state) {
                                if (state is AyahSelectionSuccessState) {
                                  debugPrint(
                                      "$_previousAyahNumber ${state.currentAyahNumber}");
                                  _ayahNumber = state.currentAyahNumber;
                                  debugPrint("ayahNumber: $_ayahNumber");
                                } else if (state is AyahSelectionErrorState) {
                                  showSnackBar(
                                      context: context,
                                      backgroundColor: Colors.red,
                                      message: state.errorMessage);
                                }
                              },
                              buildWhen: (previous, current) {
                                return current is AyahSelectionSuccessState &&
                                    (current.currentAyahNumber == index + 1 ||
                                        _previousAyahNumber == index + 1);
                              },
                              builder: (_, ayahSelectionState) {
                                debugPrint("index: $index");
                                return GestureDetector(
                                  key: index == widget.numberOfAyahs - 1
                                      ? _lastItemKey
                                      : null,
                                  onTap: () {
                                    _previousAyahNumber = _ayahNumber;
                                    debugPrint(
                                        "previousAyahNumber: $_previousAyahNumber");
                                    AyahSelectionCubit.get(context).selectAyah(
                                        ayahNumber: index + 1,
                                        surahEnglishName:
                                            widget.surahEnglishName,
                                        surahNumber: widget.surahNumber,
                                        surahEnglishNameTranslation:
                                            widget.surahEnglishNameTranslation,
                                        numberOfAyahs: widget.numberOfAyahs);
                                  },
                                  child: Container(
                                    color: ayahSelectionState
                                            is AyahSelectionSuccessState
                                        ? ayahSelectionState
                                                        .currentAyahNumber ==
                                                    index + 1 &&
                                                ayahSelectionState
                                                        .currentSurahEnglishName ==
                                                    widget.surahEnglishName
                                            ? AppThemes.pureWhite
                                            : Colors.transparent
                                        : _ayahNumber == index + 1
                                            ? AppThemes.pureWhite
                                            : Colors.transparent,
                                    margin: EdgeInsets.only(
                                        bottom: 39 * SizeConfig.verticalBlock),
                                    child: Text(
                                      state.surahAyahs[index].ayahText,
                                      style: AppThemes
                                          .fontFamilyLateefColor0xFF300759FontSize24FontWeightW400,
                                      textDirection: TextDirection.rtl,
                                    ),
                                  ),
                                );
                              },
                            ),
                            itemCount: state.surahAyahs.length,
                          ),
                        );
                      } finally {
                        WidgetsBinding.instance.addPostFrameCallback((_) {
                          // debugPrint("Hssss");
                          // if (_ayahNumber != -1 &&
                          //     _numberOfFirstBuiltComponents !=
                          //         widget.numberOfAyahs) {
                          //   _itemScrollController.scrollTo(
                          //     index: _ayahNumber - 1,
                          //     duration: const Duration(milliseconds: 500),
                          //     curve: Curves.easeInOutCubic,
                          //   );
                          // }
                          final RenderBox box = _lastItemKey.currentContext!
                              .findRenderObject() as RenderBox;

                          debugPrint(
                              "height : ${box.size.height}  width: ${box.size.width}");
                          debugPrint(
                              "dx : ${box.localToGlobal(Offset.zero).dx}  dy: ${box.localToGlobal(Offset.zero).dy}");
                        });
                      }
                    } else if (state is SurahGetSurahAyahsErrorState) {
                      return ApiErrorMessageComponent(
                        errorMessage: state.errorMessage,
                        onTap: () => SurahCubit.get(context)
                            .getSurahAyahs(surahNumber: widget.surahNumber),
                      );
                    } else {
                      return const CustomCircularProgressIndicator();
                    }
                  },
                ),
              )
            ],
          )),
    );
  }
}
