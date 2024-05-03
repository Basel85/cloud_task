import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quran_app/business_logic/cubits/auth/auth_cubit.dart';
import 'package:quran_app/business_logic/cubits/last_read/last_read_cubit.dart';
import 'package:quran_app/business_logic/cubits/my_bloc_observer.dart';
import 'package:quran_app/business_logic/cubits/surah/surah_cubit.dart';
import 'package:quran_app/business_logic/cubits/ayah_selection/ayah_selection_cubit.dart';
import 'package:quran_app/di/dependency_injection.dart';
import 'package:quran_app/firebase_options.dart';
import 'package:quran_app/helpers/fcm_helper.dart';
import 'package:quran_app/helpers/rtdb_helper.dart';
import 'package:quran_app/presentation/cubits/bottom_navigation_bar/bottom_navigation_bar_cubit.dart';
import 'package:quran_app/presentation/cubits/calendar/calendar_cubit.dart';
import 'package:quran_app/presentation/cubits/localization/localization_cubit.dart';
import 'package:quran_app/presentation/cubits/password_visibility/password_visibility_cubit.dart';
import 'package:quran_app/presentation/cubits/radio_button/radio_button_cubit.dart';
import 'package:quran_app/quran_app.dart';
import 'package:quran_app/utils/cache_helper.dart';

@pragma('vm:entry-point')
Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  RTDBHelper.init();
  RTDBHelper.writeNotification(message.notification!);
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
  await initDependency();
  final langueageCode = getIt<CacheHelperImplementation>().get(key: 'language_code');
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
    BlocProvider<LastReadCubit>(create: ((context) => LastReadCubit())),
    BlocProvider<LocalizationCubit>(create: (context) => LocalizationCubit()),
    BlocProvider<RadioButtonCubit>(create: (context) => RadioButtonCubit())
  ], child: const QuranApp()));
}
