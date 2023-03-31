import 'dart:math';
import 'package:flutter_cinema_app/app/app_routes.dart';
import 'package:flutter_cinema_app/services/getfood.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cinema_app/app/app_theme.dart';
import 'package:flutter_cinema_app/model/food/get_data.dart';
import 'package:flutter_cinema_app/resource/fonts/app_fonts.dart';
import 'package:flutter_cinema_app/widgets/back_button.dart';
import 'package:flutter_cinema_app/widgets/food_menu.dart';
import 'package:gradient_borders/gradient_borders.dart';

class OrderfoodScreen extends StatelessWidget {
  const OrderfoodScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 1,  //optional, starts from 0, select the tab by default
      length:3,
      child: Container(
        decoration: const BoxDecoration(gradient: AppTheme.backgroundColor),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          body: Container(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            margin: const EdgeInsets.only(top: 25),
            child: Column(
              children: [
                Expanded(
                  flex: 1,
                  child: Row(
                    children: [
                      const Expanded(
                        flex: 1,
                        child: AppBackButton(),
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
                      Expanded(
                        flex: 1,
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
                          child: (Text(
                            "Skip",
                            style: AppFonts.roboto600(12, Colors.white),
                          )),
                        ),
                      )
                    ],
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Container(
                    margin: const EdgeInsets.only(top: 30),
                    child: (Text(
                      "Give yourself a little Taste!!",
                      style: AppFonts.roboto600(24, Colors.white),
                    )),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: TabBar(
                    tabs: [
                      Tab(
                        child: Row(
                          children: [
                            Container(
                              height: 6,
                              width: 6,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                gradient: AppTheme.purpleGradient,
                              ),
                            ),
                            SizedBox(
                              child: Text(
                                " Combo",
                                style: AppFonts.roboto600(16, Colors.white), textAlign: TextAlign.start,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          (Text(
                            "Food/Snacks",
                            style: AppFonts.poppins700(13, Colors.white),textAlign: TextAlign.left,
                          )),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            "Beverages",
                            style: AppFonts.poppins700(13, Colors.white),
                          ),
                          Container(
                            child: (const Icon(Icons.bar_chart_rounded,
                                color: Colors.white)),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),// tabbar
                Expanded(
                  flex: 9,
                  child: SizedBox(
                    child: Container(
                      padding: const EdgeInsets.only(right: 20, left: 20),
                      child: Column(
                        children: [
                          Flexible(
                            child: FutureBuilder<List<getFood>>(
                                future: FoodService.orderFood(),
                                builder: (context, snapshot) {
                                  if (snapshot.hasError) {
                                    return const CircularProgressIndicator();
                                  } else if (snapshot.hasData) {
                                    List<getFood> foodDetail = snapshot.data!;
                                    List<getFood> Drink = foodDetail.where((e) => e.type == 'Drink').toList();
                                    List<getFood> Food = foodDetail.where((e) => e.type == 'Food').toList();
                                    return TabBarView(
                                      children: [
                                            Container(
                                              child: GridView.builder(
                                              itemCount: foodDetail.length,
                                              gridDelegate:
                                                  const SliverGridDelegateWithFixedCrossAxisCount(
                                                      crossAxisCount: 2,
                                                    crossAxisSpacing: 20,
                                                    childAspectRatio: 1/1.75,
                                                  ),
                                              itemBuilder: (BuildContext context, index) {
                                                return InkWell(
                                                  onTap: ()  {
                                                     Navigator.pushNamed(context, AppRoutes.foodDetails, arguments: {
                                                      'image':foodDetail[index].image,
                                                      'description':foodDetail[index].description,
                                                      'comboName':foodDetail[index].name,
                                                      'price':foodDetail[index].price
                                                    });
                                                  },
                                                  child: FoodMenu(
                                                      image: foodDetail[index].image??"",
                                                      comboName: foodDetail[index].name??"",
                                                      description:
                                                      foodDetail[index].description??"",
                                                      price: foodDetail[index].price??""),
                                                );
                                              }),
                                            ),
                                        Container(
                                          child: GridView.builder(
                                              itemCount: Food.length,
                                              gridDelegate:
                                              const SliverGridDelegateWithFixedCrossAxisCount(
                                                crossAxisCount: 2,
                                                crossAxisSpacing: 20,
                                                childAspectRatio: 1/1.75,
                                              ),
                                              itemBuilder: (BuildContext context, index) {
                                                return InkWell(
                                                  onTap: ()  {
                                                    Navigator.pushNamed(context, AppRoutes.foodDetails, arguments: {
                                                      'image':Food[index].image,
                                                      'description':Food[index].description,
                                                      'comboName':Food[index].name,
                                                      'price':Food[index].price

                                                    });
                                                  },
                                                  child: FoodMenu(
                                                      image: Food[index].image!,
                                                      comboName: Food[index].name!,
                                                      description:
                                                      Food[index].description!,
                                                      price: Food[index].price!),
                                                );
                                              }),
                                        ),
                                        Container(
                                          child: GridView.builder(
                                              itemCount: Drink.length,
                                              gridDelegate:
                                              const SliverGridDelegateWithFixedCrossAxisCount(
                                                crossAxisCount: 2,
                                                crossAxisSpacing: 20,
                                                childAspectRatio: 1/1.75,
                                              ),
                                              itemBuilder: (BuildContext context, index) {
                                                return InkWell(
                                                  onTap: ()  {
                                                    Navigator.pushNamed(context, AppRoutes.foodDetails, arguments: {
                                                      'image':Drink[index].image,
                                                      'description':Drink[index].description,
                                                      'comboName':Drink[index].name,
                                                      'price':Drink[index].price

                                                    });
                                                  },
                                                  child: FoodMenu(
                                                      image: Drink[index].image!,
                                                      comboName: Drink[index].name!,
                                                      description:
                                                      Drink[index].description!,
                                                      price: Drink[index].price!),
                                                );
                                              }),
                                        ),
                                          ],
                                    );
                                  }
                                  return const Text("Data list");
                                }),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Container(
                    margin: const EdgeInsets.only(top: 20, bottom: 20),
                    width: MediaQuery.of(context).size.width * 0.7,
                    alignment: Alignment.center,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          child: (const Icon(
                            Icons.location_on_outlined,
                            color: Colors.white,
                            size: 25,
                          )),
                        ),
                        Container(
                          width: 52,
                          height: 52,
                          decoration: const BoxDecoration(
                              gradient: LinearGradient(
                                  begin: Alignment.topLeft,
                                  end: Alignment.bottomRight,
                                  colors: [
                                    Color(0xffB6116B),
                                    Color(0xff3B1578),
                                  ],
                                  stops: [0.15, 1.04],
                                  transform: GradientRotation(pi / -12)),
                              shape: BoxShape.circle,
                              border: GradientBoxBorder(
                                  width: 2,
                                  gradient: LinearGradient(
                                      begin: FractionalOffset.topLeft,
                                      end: FractionalOffset.bottomRight,
                                      colors: [
                                        Color(0xffFF53C0),
                                        Color.fromRGBO(255, 83, 192, 0.59115),
                                        Color.fromRGBO(96, 255, 202, 0),
                                      ],
                                      stops: [0.24, 0.35, 0.52],
                                      transform: GradientRotation(pi / -12)))),
                          child: (const Icon(
                            Icons.shopping_basket_outlined,
                            color: Colors.white,
                            size: 25,
                          )),
                        ),
                        Container(
                          child: (const Icon(
                            Icons.calendar_month_outlined,
                            color: Colors.white,
                            size: 25,
                          )),
                        )
                      ],
                    ),
                  ),
                ) // footer
              ],
            ),
          ),
        ),
      ),
    );
  }
}
