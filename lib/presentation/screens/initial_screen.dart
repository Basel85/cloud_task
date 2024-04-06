import 'package:flutter/material.dart';
import 'package:quran_app/business_logic/non_cubits/auth_non_cubit.dart';
import 'package:quran_app/presentation/screens/home_screen.dart';
import 'package:quran_app/presentation/screens/login_screen.dart';

class InitialScreen extends StatelessWidget {
  const InitialScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: AuthNonCubit.authStateChanges(),
        builder: (_, snapShot) {
          if (snapShot.hasData) {
           
            return  HomeScreen(
                displayName: snapShot.data!.displayName,
            );
          }
          return const LoginScreen();
        });
  }
}
