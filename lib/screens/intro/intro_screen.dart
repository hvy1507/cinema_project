import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_cinema_app/app/app_routes.dart';
import 'package:flutter_cinema_app/app/app_theme.dart';
import 'package:flutter_cinema_app/screens/intro/page_one.dart';
import 'package:flutter_cinema_app/screens/intro/page_three.dart';
import 'package:flutter_cinema_app/screens/intro/page_two.dart';

class IntroScreen extends StatefulWidget {
  const IntroScreen({Key? key}) : super(key: key);

  @override
  State<IntroScreen> createState() => _IntroScreenState();
}

class _IntroScreenState extends State<IntroScreen> {
  PageController pageController = PageController(initialPage: 0);
  int activePage = 0;
  final List<Widget> pages = [
    const PageOne(),
    const PageTwo(),
    const PageThree(),
  ];
  late Timer timer;

  @override
  void initState() {
    super.initState();
    timer = Timer.periodic(const Duration(seconds: 3), (Timer timer) {
      if (activePage < 2) {
        activePage++;
      } else {
        Navigator.pushReplacementNamed(context, AppRoutes.letsSignIn);
      }

      pageController.animateToPage(
        activePage,
        duration: const Duration(milliseconds: 350),
        curve: Curves.easeIn,
      );
    });
  }

  @override
  void dispose() {
    super.dispose();
    timer.cancel();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        PageView.builder(
          controller: pageController,
          onPageChanged: (int page) {
            setState(() {
              activePage = page;
            });
          },
          itemCount: pages.length,
          itemBuilder: (BuildContext context, int index) {
            return pages[index];
          },
        ),
        Positioned(
          bottom: 95,
          left: 0,
          right: 0,
          height: 49,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List<Widget>.generate(
                pages.length,
                (index) => Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 4),
                      child: Container(
                        width: 10,
                        decoration: BoxDecoration(
                          gradient: (activePage == index)
                              ? AppTheme.purpleGradient
                              : AppTheme.whiteGradient,
                          shape: BoxShape.circle,
                        ),
                      ),
                    )),
          ),
        )
      ],
    ));
  }
}
