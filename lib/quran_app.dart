import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:quran_app/cloud_tasks.dart';
import 'package:quran_app/generated/l10n.dart';
import 'package:quran_app/presentation/cubits/localization/localization_cubit.dart';
import 'package:quran_app/presentation/cubits/localization/localization_states.dart';
import 'package:quran_app/presentation/screens/home_screen.dart';
import 'package:quran_app/utils/app_themes.dart';
import 'package:quran_app/utils/keys.dart';
import 'package:quran_app/utils/route_generator.dart';
import 'package:quran_app/utils/screen_width_getter.dart';
import 'package:quran_app/utils/size_config.dart';

class QuranApp extends StatelessWidget with ScreenWidthGetter {
  final String languageCode;
  const QuranApp({super.key, this.languageCode = 'en'});

  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);
    AppThemes.init(SizeConfig.textRatio);
    return FutureBuilder(
        future: getScreenWidth(Stream<double>.periodic(
            const Duration(milliseconds: 50),
            (x) => MediaQuery.of(context).size.width)),
        builder: (context, snapShot) {
          if (snapShot.hasData) {
            if (snapShot.data! > 0) {
              return BlocProvider<LocalizationCubit>(
                create: (context) => LocalizationCubit(),
                child: BlocBuilder<LocalizationCubit, LocalizationState>(
                  builder: (context, state) => MaterialApp(
                    debugShowCheckedModeBanner: false,
                    locale: Locale(state is LocalizationChanged
                        ? state.languageCode
                        : languageCode),
                    localizationsDelegates: const [
                      S.delegate,
                      GlobalMaterialLocalizations.delegate,
                      GlobalWidgetsLocalizations.delegate,
                      GlobalCupertinoLocalizations.delegate
                    ],
                    supportedLocales: S.delegate.supportedLocales,
                    title: 'Quran App',
                    onGenerateRoute: RouteGenerator.generateRoute,
                    navigatorKey: Keys.navigatorKey,
                    theme: ThemeData(
                        scaffoldBackgroundColor: AppThemes.color0xFFDAD0E1,
                        useMaterial3: true),
                    home: const CloudTasks(),
                  ),
                ),
              );
            }
          }
          return Container();
        });
  }
}
