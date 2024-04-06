import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:quran_app/business_logic/cubits/auth/auth_cubit.dart';
import 'package:quran_app/business_logic/cubits/auth/auth_states.dart';
import 'package:quran_app/presentation/cubits/password_visibility/password_visibility_cubit.dart';
import 'package:quran_app/presentation/cubits/password_visibility/password_visibility_states.dart';
import 'package:quran_app/presentation/widgets/auth/custom_text_field.dart';
import 'package:quran_app/utils/app_assets.dart';
import 'package:quran_app/utils/app_themes.dart';
import 'package:quran_app/utils/keys.dart';
import 'package:quran_app/utils/size_config.dart';
import 'package:quran_app/utils/snackbar_viewer.dart';

class AuthComponent extends StatefulWidget {
  final bool isThisLoginScreen;
  const AuthComponent({super.key, this.isThisLoginScreen = true});

  @override
  State<AuthComponent> createState() => _AuthComponentState();
}

class _AuthComponentState extends State<AuthComponent> with SnackBarViewer {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  
  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthCubit, AuthState>(
      listenWhen: (previous, current) =>
          current is AuthSuccessState ||
          current is AuthErrorState ||
          current is AuthLoadingState,
      listener: (_, state) {
        if (state is AuthLoadingState) {
          showDialog(
            context: context,
            barrierDismissible: false,
            builder: (_) => const Center(
              child: CircularProgressIndicator(
                color: AppThemes.color0xFF300759,
              ),
            ),
          );
        }
        if (state is AuthSuccessState) {
          showSnackBar(context: Keys.navigatorKey.currentContext!, backgroundColor: Colors.green, message: state.successMessage);
        }
        if (state is AuthErrorState) {
          showSnackBar(context: Keys.navigatorKey.currentContext!, backgroundColor: Colors.red, message: state.errorMessage);
        }
      },
      child: Stack(
        children: [
          const SizedBox(
            height: double.infinity,
          ),
          Positioned(
            left: 10 * SizeConfig.horizontalBlock,
            right: 9 * SizeConfig.horizontalBlock,
            bottom: 12 * SizeConfig.verticalBlock,
            child: Image.asset(
              AppAssets.mosqueImage2,
              fit: BoxFit.fill,
            ),
          ),
          SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: 113 * SizeConfig.verticalBlock,
                ),
                Text(
                  "Quran App",
                  style: AppThemes.fontFamilyPoppinsColor0xFF300759FontSize24FontWeightW700,
                ),
                SizedBox(
                  height: 6 * SizeConfig.verticalBlock,
                ),
                Text(
                  "Asalamu Alaikum !!!",
                  style: AppThemes.fontFamilyPoppinsColor0xFF9D1DF2FontSize13FontWeightW700,
                  textAlign: TextAlign.center,
                ),
                SizedBox(
                  height: 53 * SizeConfig.verticalBlock,
                ),
                Container(
                  width: double.infinity,
                  margin:
                      EdgeInsets.only(left: 32 * SizeConfig.horizontalBlock),
                  child: Text(
                    widget.isThisLoginScreen ? "Sign In" : "Register",
                    style: AppThemes.fontFamilyPoppinsColor0xFF9D1DF2FontSize14FontWeightW700,
                  ),
                ),
                SizedBox(
                  height: 22 * SizeConfig.verticalBlock,
                ),
                Container(
                  margin: EdgeInsets.only(
                      left: 36 * SizeConfig.horizontalBlock,
                      right: 32 * SizeConfig.horizontalBlock),
                  decoration: AppThemes.color0xFFE5B6F2BorderRadius10,
                  child: CustomTextField(
                    hintText: "email",
                    controller: _emailController,
                  ),
                ),
                SizedBox(
                  height: 31 * SizeConfig.verticalBlock,
                ),
                Container(
                  margin: EdgeInsets.only(
                      left: 36 * SizeConfig.horizontalBlock,
                      right: 32 * SizeConfig.horizontalBlock),
                  decoration: AppThemes.color0xFFE5B6F2BorderRadius10,
                  child: BlocBuilder<PasswordVisibilityCubit,
                      PasswordVisibilityState>(
                    buildWhen: (_, current) =>
                        current is PasswordVisibilityChangedState,
                    builder: (_, state) => CustomTextField(
                        hintText: "Password",
                        controller: _passwordController,
                        obscureText: state is PasswordVisibilityChangedState
                            ? state.mustBeVisible
                            : true,
                        suffixIcon: IconButton(
                            icon: Icon(
                              state is PasswordVisibilityChangedState &&
                                      !state.mustBeVisible
                                  ? Icons.visibility_off
                                  : Icons.visibility,
                              color: AppThemes.color0xCC300759,
                            ),
                            onPressed: () {
                              PasswordVisibilityCubit.get(context)
                                  .togglePasswordVisibility(
                                      state is PasswordVisibilityChangedState
                                          ? !state.mustBeVisible
                                          : false);
                            })),
                  ),
                ),
                SizedBox(
                  height: 44 * SizeConfig.verticalBlock,
                ),
                Container(
                  padding: EdgeInsets.symmetric(
                      horizontal: 10 * SizeConfig.horizontalBlock,
                      vertical: 10 * SizeConfig.verticalBlock),
                  decoration: AppThemes.color0xFFE5B6F2BorderRadius10,
                  child: Text(
                    widget.isThisLoginScreen ? "Sign in" : "Register",
                    style: AppThemes.fontFamilyPoppinsColor0xFF300759FontSize13FontWeightW600,
                    textAlign: TextAlign.center,
                  ),
                ),
                SizedBox(
                  height: 36 * SizeConfig.verticalBlock,
                ),
                Text(
                  "Or",
                  textAlign: TextAlign.center,
                  style: AppThemes.fontFamilyPoppinsColor0xFF300759FontSize13FontWeightW400,
                ),
                SizedBox(
                  height: 25 * SizeConfig.verticalBlock,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    GestureDetector(onTap: ()=>AuthCubit.get(context).signInWithGoogle(),child: SvgPicture.asset(AppAssets.googleIcon)),
                    GestureDetector(onTap: (){},child: SvgPicture.asset(AppAssets.facebookIcon))
                  ]
                ),
                SizedBox(height: 31 * SizeConfig.verticalBlock),
                Text.rich(TextSpan(children: [
                  TextSpan(
                    text: widget.isThisLoginScreen
                        ? "Don't have an account ? "
                        : "Already have an account ? ",
                    style: AppThemes.fontFamilyPoppinsColor0xFF300759FontSize11FontWeightW400,
                  ),
                  TextSpan(
                    text: widget.isThisLoginScreen
                        ? 'Register here'
                        : 'Sign in here',
                    style: AppThemes.fontFamilyPoppinsColor0xFF0E17F6FontSize11FontWeightW400,
                    recognizer: TapGestureRecognizer()
                      ..onTap = () {
                        Navigator.pushNamed(
                            context,
                            widget.isThisLoginScreen
                                ? '/register'
                                : '/login');
                      },
                  )
                ]))
              ],
            ),
          ),
        ],
      ),
    );
  }
}
