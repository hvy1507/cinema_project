import 'dart:math';

import 'package:flutter/cupertino.dart';

class AppTheme {
  //color
  static const Color white = Color(0xffffffff);
  static const Color black = Color(0xff000000);
  static const Color pink = Color(0xffFF53C0);
  static const Color blackBackground = Color(0xff130B2B);
  static const Color pinkOther = Color(0xffA00D6A);
  static const Color pinkText = Color(0xffDF1893);
  static const Color gray = Color(0xffC8C8C8);
  static const Color green = Color(0xff60FFCA);
  static const Color yellow = Color(0xffFFCE31);
  static const Color colorTextBtn = Color.fromRGBO(255, 255, 255, 0.9);


  //gradient
  static const colorBorder = LinearGradient(colors: [
    Color(0xffFF53C0),
    Color(0xffA00D6A),
  ]);

  static const primaryColor = LinearGradient(
      begin: Alignment(0.6086246371269226, 0.347439169883728),
      end: Alignment(-0.347439169883728, 0.23021462559700012),
      colors: [
        Color.fromRGBO(63, 19, 113, 1),
        Color.fromRGBO(142, 0, 84, 0.9800000190734863)
      ]
  );

  static const backgroundColor = LinearGradient(
      begin: FractionalOffset.topLeft,
      end: FractionalOffset.bottomRight,
      colors: [
        Color(0xff170641),
        Color(0xff2E1371),
        Color(0xff323559),
      ],
      stops: [0.09, 0.36, 1.09],
      transform: GradientRotation(pi/4)
  );
  static const colorWhite09 = Color.fromRGBO(255, 255, 255, 0.9);

  static Gradient purpleGradient =  const LinearGradient(
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
      colors: [
        Color(0xffB6116B),
        Color(0xff3B1578),
      ],
      stops: [0.15, 0.8],
      transform: GradientRotation(pi/4)
  );

  static Gradient whiteGradient = LinearGradient(
      colors: [white.withOpacity(0.2), white],
      begin: Alignment.topLeft,
      end: Alignment.bottomRight);

  static Gradient borderGradient = const LinearGradient(
      begin: FractionalOffset.topLeft,
      end: FractionalOffset.bottomRight,
      colors: [
        Color(0xffFF53C0),
        Color.fromRGBO(255, 83, 192, 0.59115),
        Color.fromRGBO(96, 255, 202, 0),
      ],
      stops: [0.24, 0.36, 0.52],
      transform: GradientRotation(pi / 2.7)
  );

  static Gradient inputGradientFocus = const LinearGradient(
      begin: FractionalOffset.topLeft,
      end: FractionalOffset.bottomRight,
      colors: [
        Color(0xffFF53C0),
        Color.fromRGBO(255, 83, 192, 0),
        Color.fromRGBO(96, 255, 202, 0),
      ],
      stops: [0.45, 0.52, 0.67],
      transform: GradientRotation(pi / 2.5)
  );

  static Gradient inputGradient = const LinearGradient(
      begin: FractionalOffset.topLeft,
      end: FractionalOffset.bottomRight,
      colors: [
        Color(0xff60FFCA),
        Color.fromRGBO(96, 255, 202, 0),
        Color.fromRGBO(96, 255, 202, 0),
      ],
      stops: [0.45, 0.52, 0.67],
      transform: GradientRotation(pi / 2.5)
  );

  static Gradient pinkGradient = LinearGradient(colors: [
    pink,
    pink.withOpacity(0),
  ], begin: Alignment.topLeft, end: Alignment.bottomRight);

  static Gradient pinkGradientBorder = LinearGradient(
      colors: [pink, pink.withOpacity(0.5911), pink.withOpacity(0)],
      begin: Alignment.topLeft,
      end: Alignment.bottomRight);

  static Gradient pinkGradient1 = const LinearGradient(colors: [pink, pinkOther]);

  static Gradient pinkGradient2 = LinearGradient(
    colors: [
      pink,
      pink.withOpacity(0),
      pink,
    ],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    stops: const [0.3346, 0.463, 0.5768, 0.7111],
  );

  static Gradient pinkGradient3 = LinearGradient(
    colors: [
      pink,
      pink.withOpacity(0),
      pink.withOpacity(0),
      pink,
    ],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    stops: const [0.3346, 0.463, 0.5768, 0.7111],
  );

  static Gradient greenGradient = LinearGradient(colors: [
    green,
    green.withOpacity(0),
  ], begin: Alignment.topLeft, end: Alignment.bottomRight);
  static Gradient greenGradient1 = LinearGradient(colors: [
    green.withOpacity(0.5),
    green.withOpacity(0),
    green.withOpacity(0),
    green.withOpacity(0.5),
  ], begin: Alignment.topLeft, end: Alignment.bottomRight);
  static Gradient greenGradient2 = LinearGradient(colors: [
    green,
    green.withOpacity(0),
    green,
  ], begin: Alignment.topLeft, end: Alignment.bottomRight);
  static Gradient greenGradient3 = LinearGradient(colors: [
    green,
    green.withOpacity(0),
    green.withOpacity(0),
    green,
  ], begin: Alignment.topLeft, end: Alignment.bottomRight);

  static Gradient blackGradient = const LinearGradient(colors: [
    Color(0xff00010C),
    Color(0xff23114f),
    Color(0xff15073E),
    Color(0xff160433)
  ], begin: Alignment.topCenter, end: Alignment.bottomCenter);

  static Gradient voucherGradient = LinearGradient(colors: [
    const Color(0xff8E0054).withOpacity(0.98),
    const Color(0xff3F1371),
  ], begin: Alignment.centerLeft, end: Alignment.centerRight);

  static Gradient yellowGradient = const LinearGradient(colors: [
    Color(0xffF2C94C),
    Color(0xffFFE184),
  ]);

  static Gradient searchGradient = LinearGradient(colors: [
    const Color(0xffA4C8FF).withOpacity(0.1),
    const Color(0xffA4C8FF),
  ]);
}
