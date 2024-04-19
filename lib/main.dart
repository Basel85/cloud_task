import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:quran_app/business_logic/cubits/auth/auth_cubit.dart';
import 'package:quran_app/business_logic/cubits/last_read/last_read_cubit.dart';
import 'package:quran_app/business_logic/cubits/my_bloc_observer.dart';
import 'package:quran_app/business_logic/cubits/surah/surah_cubit.dart';
import 'package:quran_app/business_logic/cubits/ayah_selection/ayah_selection_cubit.dart';
import 'package:quran_app/firebase_options.dart';
import 'package:quran_app/generated/l10n.dart';
import 'package:quran_app/helpers/fcm_helper.dart';
import 'package:quran_app/helpers/rtdb_helper.dart';
import 'package:quran_app/presentation/cubits/bottom_navigation_bar/bottom_navigation_bar_cubit.dart';
import 'package:quran_app/presentation/cubits/calendar/calendar_cubit.dart';
import 'package:quran_app/presentation/cubits/password_visibility/password_visibility_cubit.dart';
import 'package:quran_app/utils/app_themes.dart';
import 'package:quran_app/utils/keys.dart';
import 'package:quran_app/utils/route_generator.dart';
import 'package:quran_app/utils/size_config.dart';

@pragma('vm:entry-point')
Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  // If you're going to use other Firebase services in the background, such as Firestore,
  // make sure you call `initializeApp` before using other Firebase services.

  print("Handling a background message: ${message.messageId}");
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  RTDBHelper.init();
  RTDBHelper.writeNotification(message.notification!);
  print("Notification written to RTDB successfully");
  print(message.data);
  print(message.notification!.title);
  print(message.notification!.body);
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  FCMHelper.init();
  FCMHelper.requestPermission();
  RTDBHelper.init();
  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
  FCMHelper.handleForegroundMessage();
  String? token = await FCMHelper.getFCMToken();
  debugPrint("Token: ${token ?? "No Token"}");
  Bloc.observer = MyBlocObserver();
  runApp(MultiBlocProvider(providers: [
    BlocProvider<PasswordVisibilityCubit>(
      create: (context) => PasswordVisibilityCubit(),
    ),
    BlocProvider<AuthCubit>(
      create: (context) => AuthCubit(),
    ),
    BlocProvider<BottomNavigationBarCubit>(
        create: (context) => BottomNavigationBarCubit()),
    BlocProvider<CalendarCubit>(create: (context) => CalendarCubit()),
    BlocProvider<SurahCubit>(
      create: (context) => SurahCubit(),
    ),
    BlocProvider<AyahSelectionCubit>(create: (context) => AyahSelectionCubit()),
    BlocProvider<LastReadCubit>(create: ((context) => LastReadCubit()))
  ], child: const MyApp()));
}

Future<double> _whenNotZero(Stream<double> source) async {
  await for (double value in source) {
    // print("Width:$value");
    if (value > 0) {
      // print("Width > 0: $value");
      return value;
    }
  }
  return 0;
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);
    AppThemes.init(SizeConfig.textRatio);
    return FutureBuilder(
        future: _whenNotZero(
          Stream<double>.periodic(const Duration(milliseconds: 50),
              (x) => MediaQuery.of(context).size.width),
        ),
        builder: (context, snapShot) {
          if (snapShot.hasData) {
            if (snapShot.data! > 0) {
              return MaterialApp(
                debugShowCheckedModeBanner: false,
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
                initialRoute: '/',
              );
            }
          }
          return Container();
        });
  }
}
