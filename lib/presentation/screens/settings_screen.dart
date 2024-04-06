import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:quran_app/presentation/widgets/settings/settings_component.dart';
import 'package:quran_app/presentation/widgets/shared/custom_app_bar.dart';
import 'package:quran_app/utils/app_themes.dart';
import 'package:quran_app/utils/keys.dart';
import 'package:quran_app/utils/size_config.dart';
import 'package:quran_app/utils/snackbar_viewer.dart';
import 'package:url_launcher/url_launcher.dart';

class SettingsScreen extends StatelessWidget with SnackBarViewer {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(92*SizeConfig.verticalBlock),
          child: const CustomAppBar(
            title: "Settings",
            actionsIcon: Icons.settings,
            isHome: false,
          ),
        ),
        body: ListView(
          children: [
            SizedBox(
              height: 29 * SizeConfig.verticalBlock,
            ),
            const SettingsComponent(
              settingsComponentName: "Notification",
              contents: [],
            ),
            const SettingsComponent(
              settingsComponentName: "Language",
              contents: [],
            ),
            SettingsComponent(
              settingsComponentName: "Privacy & Security",
              contents: [
                Text(
                  "'Privacy Policy\nLast updated: January 11, 2022\nThis Privacy Policy describes Our policies and procedures on the collection, use and disclosure of Your information when You use the Service and tells You about Your privacy rights and how the law protects You.\nWe use Your Personal data to provide and improve the Service. By using the Service, You agree to the collection and use of information in accordance with this Privacy Policy. This Privacy Policy has been created with the help of the Privacy Policy Template.\nInterpretation and Definitions\nInterpretation\nThe words of which the initial letter is capitalized have meanings defined under the following conditions. The following definitions shall have the same meaning regardless of whether they appear in singular or in plural.\nDefinitions\nFor the purposes of this Privacy Policy:\nAccount means a unique account created for You to access our Service or parts of our Service.\nAffiliate means an entity that controls, is controlled by or is under common control with a party, where control means ownership of 50% or more of the shares, equity interest or other securities entitled to vote for election of directors or other managing authority.\nApplication means the software program provided by the Company downloaded by You on any electronic device, named Quran App\nCompany (referred to as either the Company, We, Us or Our in this Agreement) refers to Quran App.\nCountry refers to: Tamil Nadu, India'",
                  textAlign: TextAlign.center,
                  style: AppThemes.fontFamilyPoppinsColor0xFF484848FontSize11FontWeightW500,
                ),
              ],
            ),
            SettingsComponent(
              settingsComponentName: "Help & Support",
              contents: [
                Text.rich(
                  TextSpan(
                    children: [
                      TextSpan(
                          text:
                              'For further information about this app\n\nCONTACT: ',
                          style: AppThemes
                              .fontFamilyPoppinsColor0xFF484848FontSize11FontWeightW500),
                      TextSpan(
                          recognizer: TapGestureRecognizer()
                            ..onTap = () async {
                              final Uri emailUri = Uri(
                                scheme: 'mailto',
                                path: 'basel.mohamed20200@gmail.com',
                              );
                              if (await canLaunchUrl(emailUri)) {
                                await launchUrl(emailUri);
                              } else {
                                showSnackBar(
                                    backgroundColor: Colors.red,
                                    message: "Can't launch email",
                                    context: Keys.navigatorKey.currentContext!);
                              }
                            },
                          text: 'basel.mohamed20200@gmail.com',
                          style: AppThemes
                              .fontFamilyPoppinsColor0xE00E17F6FontSize11FontWeightW500),
                    ],
                  ),
                  textAlign: TextAlign.justify,
                ),
              ],
            ),
            SettingsComponent(
              settingsComponentName: "About",
              contents: [
                Text(
                  "Welcome to Quran App, your number one source for all good things. We're dedicated to providing you\nthe best of agirah, with a focus on agirah.\n\n\nWe're working to turn our mission towards agirah. We hope you get the\ngood information as much as we gather offering them to you.\n\n\nSincerely,\n\nMohamed Ibrahim J",
                  textAlign: TextAlign.center,
                  style: AppThemes.fontFamilyPoppinsColor0xFF484848FontSize11FontWeightW500,
                )
              ],
            ),
          ],
        ));
  }
}
