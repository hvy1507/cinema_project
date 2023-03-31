import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_cinema_app/app/app_routes.dart';
import 'package:flutter_cinema_app/resource/images/app_images.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 3), () {
      Navigator.pushReplacementNamed(
        context,
        AppRoutes.introScreen,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      AppImages.splashScreen,
      width: MediaQuery.of(context).size.width,
      fit: BoxFit.cover,
    );
  }
}
