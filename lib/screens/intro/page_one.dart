import 'package:flutter/material.dart';
import 'package:flutter_cinema_app/app/app_theme.dart';
import 'package:flutter_cinema_app/generated/l10n.dart';
import 'package:flutter_cinema_app/resource/fonts/app_fonts.dart';
import 'package:flutter_cinema_app/resource/images/app_images.dart';
import 'package:flutter_cinema_app/widgets/app_button.dart';
import 'package:flutter_cinema_app/app/app_routes.dart';

class PageOne extends StatelessWidget {
  const PageOne({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 23, right: 23, bottom: 40),
      width: MediaQuery.of(context).size.width,
      decoration: const BoxDecoration(
          color: AppTheme.blackBackground,
          image: DecorationImage(
              image: AssetImage(AppImages.imageMoviesBg), fit: BoxFit.cover)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Text(
            'Welcome to PVR\nCinemas',
            textAlign: TextAlign.center,
            style: AppFonts.roboto700(32,Colors.white).copyWith(height: 38 / 32),
          ),
          const SizedBox(
            height: 15,
          ),
          Text(
              'The best movie ticket booking app of the century to make your days\ngreat! ',
              textAlign: TextAlign.center,
              style: AppFonts.roboto500(20,Colors.white).copyWith(height: 23 / 20)),
          const SizedBox(
            height: 50,
          ),
          AppButton(
              onTap: () {
                Navigator.pushReplacementNamed(context, AppRoutes.letsSignIn);
              },
              titleButton: S.of(context).getStarted)
        ],
      ),
    );
  }
}
