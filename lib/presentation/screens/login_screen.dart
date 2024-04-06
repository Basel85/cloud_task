import 'package:flutter/material.dart';
import 'package:quran_app/presentation/widgets/auth/auth_component.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: AuthComponent(),
    );
  }
}
