import 'package:flutter/material.dart';
import 'package:quran_app/presentation/screens/initial_screen.dart';
import 'package:quran_app/presentation/screens/login_screen.dart';
import 'package:quran_app/presentation/screens/notification_screen.dart';
import 'package:quran_app/presentation/screens/register_screen.dart';
import 'package:quran_app/presentation/screens/settings_screen.dart';
import 'package:quran_app/presentation/screens/surah_screen.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/login':
        return MaterialPageRoute(builder: (_) => const LoginScreen());
      case '/register':
        return MaterialPageRoute(builder: (_) => const RegisterScreen());
      case '/notification':
        return MaterialPageRoute(builder: (_) => const NotificationScreen());
      case '/settings':
        return MaterialPageRoute(builder: (_) => const SettingsScreen());
      case '/surah':
        final args = settings.arguments as Map<String, dynamic>;
        return MaterialPageRoute(
            builder: (_) {
              return SurahScreen(
                surahNumber: args['surahNumber'],
                surahEnglishName: args['surahEnglishName'],
                surahEnglishNameTranslation:
                    args['surahEnglishNameTranslation'],
                numberOfAyahs: args['numberOfAyahs'],
                startingAyahNumber: args['startingAyahNumber'],
              );
            },
            settings: settings);
      default:
        return MaterialPageRoute(builder: (_) => const InitialScreen());
    }
  }
}
