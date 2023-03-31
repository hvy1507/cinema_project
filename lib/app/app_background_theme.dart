import 'package:flutter/material.dart';
import 'package:flutter_cinema_app/resource/images/app_images.dart';

class AppBackGroundTheme {
  static final homeTheme = BoxDecoration(
      image: const DecorationImage(
          image: AssetImage(AppImages.homeBackground), fit: BoxFit.cover),
      gradient: LinearGradient(
        transform: const GradientRotation(170.9 * 3.1416 / 180),
        begin: Alignment.centerLeft,
        end: Alignment.bottomRight,
        colors: <Color>[
          const Color(0xFF170641).withOpacity(0.9),
          const Color(0xFF2E1371).withOpacity(0.95),
          const Color(0xFF00021B).withOpacity(0.9),
        ],
        stops: const [0.0099, 0.3614, 1.0984],
      ));
  static final searchTheme = BoxDecoration(
      image: const DecorationImage(
          image: AssetImage(AppImages.searchBackground), fit: BoxFit.cover),
      gradient: LinearGradient(
        transform: const GradientRotation(170.9 * 3.1416 / 180),
        begin: Alignment.centerLeft,
        end: Alignment.bottomRight,
        colors: <Color>[
          const Color(0xFF170641).withOpacity(0.9),
          const Color(0xFF2E1371).withOpacity(0.95),
          const Color(0xFF00021B).withOpacity(0.9),
        ],
        stops: const [0.0099, 0.3614, 1.0984],
      ));
}
