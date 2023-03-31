import 'package:flutter/material.dart';
import 'package:flutter_cinema_app/app/app_routes.dart';
import 'package:flutter_cinema_app/app/app_theme.dart';
import 'package:flutter_cinema_app/generated/l10n.dart';
import 'package:flutter_cinema_app/provider/provider.dart';
import 'package:flutter_cinema_app/resource/fonts/app_fonts.dart';
import 'package:flutter_cinema_app/resource/images/app_images.dart';
import 'package:flutter_cinema_app/widgets/app_button.dart';
import 'package:flutter_cinema_app/widgets/app_button_continue.dart';
import 'package:flutter_cinema_app/widgets/app_button_text.dart';
import 'package:provider/provider.dart';

class LetSignIn extends StatelessWidget {
  const LetSignIn({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final languageProvider = Provider.of<LanguageProvider>(context);
    return Scaffold(
      backgroundColor: AppTheme.blackBackground,
      body: Container(
        margin: const EdgeInsets.symmetric(horizontal: 23),
        padding: const EdgeInsets.symmetric(horizontal: 23),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              children: [
                InkWell(
                  onTap: () {
                    languageProvider.setLocale(const Locale('vi'));
                  },
                  child: Container(
                    margin: const EdgeInsets.symmetric(horizontal: 30),
                    child: Image.asset(
                      AppImages.imageSignIn,
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
                Text(S.of(context).letSignIn,
                    style: AppFonts.roboto600(36, Colors.white)
                        .copyWith(height: 42 / 36)),
                const SizedBox(height: 15),
                const AppButtonContinue(
                    logo: AppImages.iconFacebook, continueWith: 'Facebook'),
                const SizedBox(height: 14),
                const AppButtonContinue(
                    logo: AppImages.iconGoogle, continueWith: 'Google'),
                const SizedBox(height: 14),
                const AppButtonContinue(
                    logo: AppImages.iconApple, continueWith: 'Apple'),
                const SizedBox(height: 16),
                Row(
                  children: [
                    const Expanded(
                      child: Divider(
                        thickness: 1,
                        color: AppTheme.pinkOther,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Text(
                        S.of(context).or,
                        style: AppFonts.poppins500(17, AppTheme.colorTextBtn)
                            .copyWith(
                          height: 26 / 17,
                        ),
                      ),
                    ),
                    const Expanded(
                      child: Divider(
                        thickness: 1,
                        color: AppTheme.pinkOther,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 17),
                AppButton(
                    onTap: () {
                      Navigator.pushNamed(context, AppRoutes.loginScreen);
                    },
                    titleButton: S.of(context).signInWithPass),
                const SizedBox(height: 22),
                AppButtonText(
                    onTap: () {
                      Navigator.pushNamed(context, AppRoutes.registerScreen);
                    },
                    text: S.of(context).dont,
                    textColor: S.of(context).signup)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
