import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:quran_app/business_logic/cubits/last_read/last_read_cubit.dart';
import 'package:quran_app/business_logic/cubits/last_read/last_read_states.dart';
import 'package:quran_app/business_logic/cubits/surah/surah_cubit.dart';
import 'package:quran_app/business_logic/cubits/surah/surah_states.dart';
import 'package:quran_app/presentation/widgets/shared/api_error_message_component.dart';
import 'package:quran_app/presentation/widgets/shared/custom_circluar_progress_indicator.dart';
import 'package:quran_app/presentation/widgets/shared/custom_refresh_indicator.dart';
import 'package:quran_app/presentation/widgets/shared/quran_meta_data_component.dart';
import 'package:quran_app/utils/app_assets.dart';
import 'package:quran_app/utils/app_themes.dart';
import 'package:quran_app/utils/size_config.dart';

class UserMainBody extends StatefulWidget {
  final String displayName;
  const UserMainBody({super.key, required this.displayName});

  @override
  State<UserMainBody> createState() => _UserMainBodyState();
}

class _UserMainBodyState extends State<UserMainBody> {
  late String surahEnglishNameText = "Loading...";
  late String ayahNumberText = "Loading...";
  String surahEnglishName = "Al-Faatiha";
  int ayahNumber = 1;
  @override
  initState() {
    LastReadCubit.get(context).getValues();
    super.initState();
  }

  void navigateToSurahScreen(
      {required int surahNumber,
      required String surahEnglishName,
      required String surahEnglishNameTranslation,
      required int numberOfAyahs,
      required int startingAyahNumber}) {
    Navigator.pushNamed(context, '/surah', arguments: {
      "surahNumber": surahNumber,
      "surahEnglishName": surahEnglishName,
      "surahEnglishNameTranslation": surahEnglishNameTranslation,
      "numberOfAyahs": numberOfAyahs,
      "startingAyahNumber": startingAyahNumber
    });
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            height: 35 * SizeConfig.verticalBlock,
          ),
          Expanded(
            child: DefaultTabController(
              length: 1,
              child: NestedScrollView(
                  headerSliverBuilder: (context, innerBoxIsScrolled) => [
                        SliverPadding(
                          padding: EdgeInsets.only(
                              left: 32 * SizeConfig.horizontalBlock),
                          sliver: SliverToBoxAdapter(
                              child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                Text(
                                  "Asalamu Alaikum !!!",
                                  style: AppThemes
                                      .fontFamilyPoppinsColor0xFF9D1DF2FontSize13FontWeightW700,
                                  textAlign: TextAlign.center,
                                ),
                                Text(
                                  widget.displayName,
                                  style: AppThemes
                                      .fontFamilyPoppinsColor0xFF300759FontSize18FontWeightW700,
                                  textAlign: TextAlign.center,
                                )
                              ])),
                        ),
                        SliverToBoxAdapter(
                          child: SizedBox(
                            height: 29 * SizeConfig.verticalBlock,
                          ),
                        ),
                        SliverToBoxAdapter(
                          child: BlocConsumer<LastReadCubit, LastReadState>(
                            listener: (context, state) {
                              if (state is LastReadSuccessState) {
                                surahEnglishName = state.surahEnglishName;
                                ayahNumber = state.ayahNumber;
                                surahEnglishNameText = state.surahEnglishName;
                                ayahNumberText = "Ayah no. ${state.ayahNumber}";
                                SurahCubit.get(context).getListOfSurahs();
                              } else if (state is LastReadErrorState) {
                                surahEnglishNameText = state.errorMessage;
                                ayahNumberText = state.errorMessage;
                                SurahCubit.get(context).getListOfSurahs();
                              } else {
                                surahEnglishNameText = "Loading...";
                                ayahNumberText = "Loading...";
                              }
                            },
                            builder: (_, state) => GestureDetector(
                              onTap: () {
                                if (state is LastReadSuccessState) {
                                  navigateToSurahScreen(
                                      surahNumber: state.surahNumber,
                                      surahEnglishName: state.surahEnglishName,
                                      surahEnglishNameTranslation:
                                          state.surahEnglishNameTranslation,
                                      numberOfAyahs: state.numberOfAyahs,
                                      startingAyahNumber: state.ayahNumber);
                                }
                              },
                              child: Container(
                                margin: EdgeInsets.symmetric(
                                    horizontal:
                                        32 * SizeConfig.horizontalBlock),
                                padding: EdgeInsets.only(
                                  left: 21 * SizeConfig.horizontalBlock,
                                  right: 18 * SizeConfig.horizontalBlock,
                                  top: 17 * SizeConfig.verticalBlock,
                                  bottom: 27 * SizeConfig.verticalBlock,
                                ),
                                decoration: ShapeDecoration(
                                  color: AppThemes.color0xFFE5B6F2,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                ),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          children: [
                                            SvgPicture.asset(
                                              AppAssets.readIcon,
                                              width: 16 *
                                                  SizeConfig.horizontalBlock,
                                              height: 13.1 *
                                                  SizeConfig.verticalBlock,
                                            ),
                                            SizedBox(
                                              width: 13 *
                                                  SizeConfig.horizontalBlock,
                                            ),
                                            Text(
                                              "Last Read",
                                              style: AppThemes
                                                  .fontFamilyPoppinsColor0xFF300759FontSize13FontWeightW500,
                                              textAlign: TextAlign.center,
                                            ),
                                          ],
                                        ),
                                        SizedBox(
                                          height: 12 * SizeConfig.verticalBlock,
                                        ),
                                        Text.rich(TextSpan(children: [
                                          TextSpan(
                                            text: "$surahEnglishNameText\n",
                                            style: AppThemes
                                                .fontFamilyPoppinsColor0xFF300759FontSize13FontWeightW700,
                                          ),
                                          TextSpan(
                                            text: ayahNumberText,
                                            style: AppThemes
                                                .fontFamilyPoppinsColor0xFF300759FontSize10FontWeightW500,
                                          )
                                        ]))
                                      ],
                                    ),
                                    SvgPicture.asset(
                                      AppAssets.bookIcon,
                                      width: 74 * SizeConfig.horizontalBlock,
                                      height: 84 * SizeConfig.verticalBlock,
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                        SliverPadding(
                          padding: EdgeInsets.only(
                              left: 35 * SizeConfig.horizontalBlock,
                              right: 33 * SizeConfig.horizontalBlock),
                          sliver: SliverAppBar(
                            pinned: true,
                            floating: false,
                            elevation: 0.0,
                            expandedHeight: 0,
                            backgroundColor: AppThemes.color0xFFDAD0E1,
                            automaticallyImplyLeading: false,
                            shape: Border(
                                bottom: BorderSide(
                                    color: AppThemes.color0xFF9D1DF2
                                        .withOpacity(0.1))),
                            bottom: PreferredSize(
                                preferredSize: const Size.fromHeight(0.0),
                                child: TabBar(
                                  tabs: const [
                                    Tab(text: "Surah"),
                                  ],
                                  unselectedLabelStyle: AppThemes
                                      .fontFamilyPoppinsColor0xFF9D1DF2FontSize13FontWeightW500,
                                  labelStyle: AppThemes
                                      .fontFamilyPoppinsColor0xFF300759FontSize13FontWeightW700,
                                  labelColor: AppThemes.color0xFF300759,
                                  unselectedLabelColor:
                                      AppThemes.color0xFF9D1DF2,
                                  indicatorColor: AppThemes.color0xFF300759,
                                )),
                          ),
                        )
                      ],
                  body: Container(
                    margin: EdgeInsets.only(
                        left: 35 * SizeConfig.horizontalBlock,
                        right: 33 * SizeConfig.horizontalBlock),
                    padding:
                        EdgeInsets.only(top: 12 * SizeConfig.verticalBlock),
                    child: TabBarView(
                      children: [
                        BlocBuilder<SurahCubit, SurahState>(
                            buildWhen: (previous, current) =>
                                current is SurahGetListOfSurahsLoadingState ||
                                current is SurahGetListOfSurahsSuccessState ||
                                current is SurahGetListOfSurahsErrorState,
                            builder: (_, state) {
                              if (state is SurahGetListOfSurahsSuccessState) {
                                return CustomRefreshIndicator(
                                  onRefresh: () =>
                                      SurahCubit.get(context).getListOfSurahs(),
                                  itemBuilder: (_, index) => GestureDetector(
                                    onTap: () => navigateToSurahScreen(
                                        surahNumber:
                                            state.surahs[index].surahNumber,
                                        surahEnglishName: state
                                            .surahs[index].surahEnglishName,
                                        surahEnglishNameTranslation: state
                                            .surahs[index]
                                            .surahEnglishNameTranslation,
                                        numberOfAyahs:
                                            state.surahs[index].numberOfAyahs,
                                        startingAyahNumber: surahEnglishName ==
                                                state.surahs[index]
                                                    .surahEnglishName
                                            ? ayahNumber
                                            : -1),
                                    child: Container(
                                        padding: EdgeInsets.only(
                                            left:
                                                43 * SizeConfig.horizontalBlock,
                                            right:
                                                10 * SizeConfig.horizontalBlock,
                                            top: 12 * SizeConfig.verticalBlock,
                                            bottom:
                                                20 * SizeConfig.verticalBlock),
                                        decoration: BoxDecoration(
                                            border: Border(
                                                bottom: BorderSide(
                                                    color: AppThemes
                                                        .color0xFF9D1DF2
                                                        .withOpacity(0.1),
                                                    width: 1 *
                                                        SizeConfig.textRatio))),
                                        child: QuranMetaDataComponent(
                                          surahEnglishName: state
                                              .surahs[index].surahEnglishName,
                                          surahEnglishNameTranslation: state
                                              .surahs[index]
                                              .surahEnglishNameTranslation,
                                          numberOfAyahs:
                                              state.surahs[index].numberOfAyahs,
                                          trailing: Text(
                                            state.surahs[index].surahName,
                                            textAlign: TextAlign.center,
                                            style: AppThemes
                                                .fontFamilyLateefColor0xFF300759FontSize24FontWeightW400,
                                          ),
                                        )),
                                  ),
                                  itemCount: state.surahs.length,
                                );
                              } else if (state
                                  is SurahGetListOfSurahsErrorState) {
                                return ApiErrorMessageComponent(
                                    errorMessage: state.errorMessage,
                                    onTap: () => SurahCubit.get(context)
                                        .getListOfSurahs());
                              } else {
                                return const CustomCircularProgressIndicator();
                              }
                            })
                      ],
                    ),
                  )),
            ),
          ),
        ],
      ),
    );
  }
}
