import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_cinema_app/app/app_theme.dart';
import 'package:flutter_cinema_app/resource/fonts/app_fonts.dart';
import 'package:flutter_cinema_app/resource/images/app_images.dart';
import 'package:flutter_cinema_app/widgets/back_button.dart';
import 'package:flutter_cinema_app/widgets/card_parking.dart';
import 'package:flutter_cinema_app/widgets/right_button.dart';
import 'package:gradient_borders/box_borders/gradient_box_border.dart';

class ParkingCharge extends StatelessWidget {
  const ParkingCharge({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 1, //optional, starts from 0, select the tab by default
      length: 3,
      child: Container(
        padding: EdgeInsets.all(12),
        decoration: const BoxDecoration(gradient: AppTheme.backgroundColor),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          body: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                flex: 2,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const AppBackButton(),
                    Text("Parking Charges ",
                        style: AppFonts.roboto700(20, Colors.white)),
                    const rightButton(icon: AppImages.iconNoti, size: 15)
                  ],
                ),
              ),
              Expanded(
                flex: 4,
                child: TabBarView(
                    children: [
                  Image(image: AssetImage(AppImages.biCycle)),
                  Image(image: AssetImage(AppImages.bike)),
                  Image(image: AssetImage(AppImages.car)),
                ]),
              ),
              Expanded(
                flex: 1,
                child: TabBar(
                  padding: EdgeInsets.only(top: 15),
                    indicator: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      border: GradientBoxBorder(
                          width: 2,
                          gradient: LinearGradient(
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                              colors: [
                                Color(0xff5FFFCA),
                                Color.fromRGBO(96, 255, 202, 0.07),
                                Color.fromRGBO(96, 255, 202, 0.07),
                                Color(0xff5FFFCA),
                              ],
                              stops: [0.32, 0.5, 0.61, 0.81],
                              transform: GradientRotation(pi / 4))
                      )
                    ),
                    tabs: [
                  Tab(
                    child: (Text(
                      "Bi-Cycle",
                      style: AppFonts.roboto700(17, Colors.white),
                    )),
                  ),
                  Tab(
                    child: (Text("Bike",
                        style: AppFonts.roboto700(17, Colors.white))),
                  ),
                  Tab(
                    child: (Text("Car",
                        style: AppFonts.roboto700(17, Colors.white))),
                  )
                ]),
              ),
              Expanded(
                flex: 8,
                child: TabBarView(children: [
                  CardParking(price: "10/Bi-cyc"),
                  CardParking(price: "20/Bike"),
                  CardParking(price: "40/Car"),
                ]),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
