import 'package:flutter/material.dart';
import 'package:quran_app/presentation/widgets/auth/auth_component.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: AuthComponent(isThisLoginScreen: false),
    );
  }
}
