import 'package:flutter/material.dart';
import 'package:flutter_cinema_app/app/app_theme.dart';
import 'package:flutter_cinema_app/widgets/back_button.dart';
import 'package:flutter_cinema_app/widgets/food_menu.dart';
import 'package:gradient_borders/gradient_borders.dart';

import 'package:flutter_cinema_app/resource/fonts/app_fonts.dart';

class FoodDetails extends StatelessWidget {
  const FoodDetails({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Map data = ModalRoute.of(context)?.settings.arguments as Map;
    return Container(
      decoration: const BoxDecoration(gradient: AppTheme.backgroundColor),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: SingleChildScrollView(
          child: Container(
            margin: EdgeInsets.only(top: 35),
            child: Column(
              children: [
                Container(
                  child: Row(
                    children: [
                      Expanded(
                        flex: 1,
                        child: Container(
                          child: const AppBackButton(),
                        ),
                      ),
                      Expanded(
                        flex: 4,
                        child: Container(
                          alignment: Alignment.center,
                          child: (Text(
                            "Food & Beverages",
                            style: AppFonts.roboto700(20, Colors.white),
                          )),
                        ),
                      ),
                      const Expanded(
                        flex: 1,
                        child: SizedBox.shrink(),
                      )
                    ],
                  ),
                ),
                OrderFood(
                    image: data['image'],
                    comboName: data['comboName'],
                    description: data['description'],
                    price: data['price']),
                Container(
                  height: 50,
                  margin: EdgeInsets.only(bottom: 20),
                  width: MediaQuery.of(context).size.width * 0.8,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      gradient: AppTheme.purpleGradient,
                      border: GradientBoxBorder(
                          width: 2,
                          gradient: AppTheme.borderGradient
                      )
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        child: (Icon(
                          Icons.shopping_basket_outlined,
                          color: Colors.white,
                          size: 25,
                        )),
                      ),
                      Container(
                        margin: EdgeInsets.only(left: 20),
                        child: (Text(
                          "Add to cart",
                          style: TextStyle(color: Colors.white, fontSize: 20),
                        )),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
