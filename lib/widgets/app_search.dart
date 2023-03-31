import 'package:flutter/material.dart';
import 'package:flutter_cinema_app/app/app_theme.dart';
import 'package:flutter_cinema_app/generated/l10n.dart';
import 'package:flutter_cinema_app/resource/fonts/app_fonts.dart';
import 'package:flutter_cinema_app/resource/images/app_images.dart';

class AppSearch extends StatelessWidget {
  const AppSearch({super.key, this.controller, this.onFieldSubmitted});

  final TextEditingController? controller;
  final Function(String)? onFieldSubmitted;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          gradient: AppTheme.searchGradient,
          boxShadow: [
            BoxShadow(
                offset: const Offset(0, 2),
                blurRadius: 2,
                spreadRadius: 0,
                color: AppTheme.black.withOpacity(0.25))
          ]),
      child: TextFormField(
        style: const TextStyle(color: AppTheme.white),
        controller: controller,
        onFieldSubmitted: onFieldSubmitted,
        decoration: InputDecoration(
            border: InputBorder.none,
            hintText: S.of(context).tapToSearch,
            hintStyle: AppFonts.roboto500(14, AppTheme.white),
            icon: Padding(
              padding: const EdgeInsets.only(top: 8, bottom: 13, left: 14),
              child: Image.asset(
                AppImages.iconSearch,
                height: 20,
              ),
            )),
      ),
    );
  }
}
