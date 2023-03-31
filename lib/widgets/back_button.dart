import 'dart:math';

import 'package:flutter/material.dart';
import 'package:gradient_borders/box_borders/gradient_box_border.dart';


class AppBackButton extends StatelessWidget {
  const AppBackButton({super.key});


  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        Navigator.pop(context);
      },
      child: Container(
        height: 40,
        width: 40,
        alignment: Alignment.center,
        decoration: BoxDecoration(
            color: const Color(0xffFFFFFF).withOpacity(0.3),
            shape: BoxShape.circle,
            border: const GradientBoxBorder(
                width: 2,
                gradient: LinearGradient(
                    begin: FractionalOffset.topLeft,
                    end: FractionalOffset.bottomRight,
                    colors: [
                      Color(0xff60FFCA),
                      Color.fromRGBO(96, 255, 202, 0),
                      Color.fromRGBO(96, 255, 202, 0),
                      Colors.transparent
                    ],
                    stops: [0.3, 0.55, 0.8, 1],
                    transform: GradientRotation(pi / 6)))),
        child: (
            const Icon(Icons.arrow_back_rounded, color: Colors.white, size: 20,)
        ),
      ),
    );
  }
}
