 import 'package:flutter/material.dart';
import 'package:flutter_cinema_app/app/app_theme.dart';
import 'package:flutter_cinema_app/resource/fonts/app_fonts.dart';

class AppButtonText extends StatelessWidget {
  const AppButtonText(
      {super.key, required this.text, required this.textColor, this.onTap});

  final String text;
  final String textColor;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return Row(
     mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(text,
            textAlign: TextAlign.center,
            style:  AppFonts.poppins500(14,AppTheme.colorTextBtn,).copyWith(

                height: 21 / 14
            )),
        GestureDetector(
          onTap: onTap,
          child: Text(textColor,
              textAlign: TextAlign.center,
              style: AppFonts.poppins700(14,AppTheme.pinkText,).copyWith(
                height: 21 / 14
              )),
        ),
      ],
    );
  }
}
