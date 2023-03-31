import 'package:flutter/material.dart';
import 'package:flutter_cinema_app/resource/images/app_images.dart';

class PageThree extends StatelessWidget {
  const PageThree({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Image.asset(AppImages.bannerArcane,
        width: MediaQuery.of(context).size.width, fit: BoxFit.cover);
  }
}
