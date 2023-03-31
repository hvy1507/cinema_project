import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_cinema_app/app/app_theme.dart';
import 'package:flutter_cinema_app/resource/fonts/app_fonts.dart';
import 'package:gradient_borders/box_borders/gradient_box_border.dart';

class CardParking extends StatelessWidget {
  const CardParking({Key? key, required this.price}) : super(key: key);

  final String price ;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 15),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          border: Border.all(
            color: const Color(0xff5FFFCA).withOpacity(0.92),
          )),
      child: Container(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              "PVR VR Chennai Anna Nagar",
              style: AppFonts.roboto700(17, Colors.white),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    const Icon(
                      Icons.place_outlined,
                      size: 12,
                      color: Colors.white,
                    ),
                    Text(
                      "Anna Nagar, Chennai",
                      style: AppFonts.roboto500(14, Colors.white),
                    )
                  ],
                ),
                Row(
                  children: [
                    const Icon(
                      Icons.calendar_month,
                      size: 12,
                      color: Colors.white,
                    ),
                    Text(
                      "23 Apr/2:30 PM",
                      style: AppFonts.roboto500(14, Colors.white),
                    )
                  ],
                )
              ],
            ),
            Container(
              height: 100,
              width: MediaQuery.of(context).size.width * 0.9,
              decoration: BoxDecoration(
                  gradient: AppTheme.purpleGradient,
                  border: GradientBoxBorder(
                      gradient: AppTheme.borderGradient),
                  borderRadius: BorderRadius.circular(20)),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    "Parking Charges :  + $price",
                    style: AppFonts.roboto700(20, Colors.white),
                  ),
                  Text("Duration : 2 hrs",
                      style: AppFonts.roboto700(20, Colors.white))
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  children: [
                    Text("No's : ",
                        style: AppFonts.roboto600(16, Colors.white)),
                    Container(
                        decoration: BoxDecoration(
                            gradient: AppTheme.purpleGradient,
                            border: GradientBoxBorder(
                                gradient: AppTheme.borderGradient),
                            borderRadius: BorderRadius.circular(10)),
                        child: DropdownButton(items: const [
                          DropdownMenuItem(
                            value: "1",
                            child: Text("1"),
                          ),
                          DropdownMenuItem(
                            value: "2",
                            child: Text("2"),
                          ),
                          DropdownMenuItem(
                            value: "3",
                            child: Text("3"),
                          ),
                          DropdownMenuItem(
                            value: "4",
                            child: Text("4"),
                          )
                        ], onChanged: null))
                  ],
                ),
                Container(
                  padding:
                      const EdgeInsets.only(top: 5, bottom: 5, left: 15, right: 15),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      border: const GradientBoxBorder(
                          width: 2,
                          gradient: LinearGradient(
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                              colors: [
                                Color(0xffFF53C0),
                                Color.fromRGBO(255, 83, 192, 0),
                                Color(0xffFF53C0),
                              ],
                              stops: [0.33, 0.46, 0.71],
                              transform: GradientRotation(pi / 4)))),
                  child: (Text(
                    "Add to pay",
                    style: AppFonts.poppins600(12, Colors.white),
                  )),
                ),
              ],
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width*0.9,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Instructions:",
                    style: AppFonts.roboto600(15, Colors.white),
                  ),
                  Text("1. Avoid keeping valuable things in the vehicle.",
                      style: AppFonts.roboto600(13, const Color(0xffBCBCBC))),
                  Text("2. For Every additional hour 10 Rs extra will be charged",
                      style: AppFonts.roboto600(13, const Color(0xffBCBCBC))),
                  Text("3. Ensure that ou have parked the two-wheeler on the",
                      style: AppFonts.roboto600(13, const Color(0xffBCBCBC))),
                  Text("4. Parking Charge May vary theaters to theaters",
                      style: AppFonts.roboto600(13, const Color(0xffBCBCBC)))
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
