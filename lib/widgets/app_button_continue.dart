import 'package:flutter/material.dart';
import 'package:flutter_cinema_app/app/app_theme.dart';
import 'package:flutter_cinema_app/generated/l10n.dart';
import 'package:flutter_cinema_app/resource/fonts/app_fonts.dart';
import 'package:gradient_borders/box_borders/gradient_box_border.dart';


class AppButtonContinue extends StatelessWidget {
  const AppButtonContinue(
      {super.key, required this.logo, required this.continueWith, this.onTap});

  final String logo;
  final String continueWith;

  final Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(50),
            border:
                GradientBoxBorder(gradient: AppTheme.pinkGradient1, width: 2),
            color: AppTheme.black),
        child: Padding(
          padding:
              const EdgeInsets.only(left: 50, right: 43, top: 14, bottom: 14),
          child: Row(children: [
            Expanded(flex: 1, child: Image.asset(logo)),
            const SizedBox(
              width: 23,
            ),
            Expanded(
              flex: 8,
              child: Text(
                S.of(context).continuewith + continueWith,
                style: AppFonts.poppins500(17,AppTheme.white.withOpacity(0.9)),
              ),
            )
          ]),
        ),
      ),
    );
  }
}
