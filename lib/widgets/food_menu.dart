

import 'package:flutter/material.dart';
import 'package:flutter_cinema_app/resource/fonts/app_fonts.dart';

class FoodMenu extends StatelessWidget {
  const FoodMenu(
      {Key? key,
      required this.image,
      required this.comboName,
      required this.description,
      required this.price})
      : super(key: key);
  final String image;
  final String comboName;
  final String description;
  final String price;
  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.only(top: 25),
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Flexible(
                flex: 5,
                child: FractionallySizedBox(
                  widthFactor: 1,
                  heightFactor: 1,
                  child: (
                  Image.network(image)
                  ),
                ),
              ),
              Flexible(
                flex: 1,
                child: (Text(comboName,
                    textAlign: TextAlign.left,
                    style: AppFonts.poppins600(16, Colors.white))),
              ),
              Flexible(
                flex: 2,
                child: (Text(
                  description,
                  maxLines: 3,
                  style: AppFonts.poppins400(10, Colors.white),
                )),
              ),
              Flexible(
                flex: 2,
                child: Row(
                  crossAxisAlignment:  CrossAxisAlignment.end,
                  children: [
                    Text(
                      price,
                      style: AppFonts.poppins600(16, Colors.white),
                    ),
                    const Spacer(),
                    Container(
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: const Color(0xff000000).withOpacity(0.3)),
                      child: (const Icon(
                        Icons.add,
                        color: Colors.white,
                        size: 20,
                      )),
                    )
                  ],
                ),
              )
            ]
        )
    );
  }
}

class OrderFood extends StatelessWidget {
  const OrderFood(
      {Key? key,
      required this.image,
      required this.comboName,
      required this.description,
      required this.price})
      : super(key: key);
  final String image;
  final String comboName;
  final String description;
  final String price;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                child: (Image.network(image)),
              ),
              Container(
                margin: const EdgeInsets.only(top: 10),
                child: (Text(
                  comboName,
                  style: AppFonts.poppins600(24, Colors.white),
                )),
              ),
              Container(
                margin: const EdgeInsets.only(top: 10),
                child: (Text(
                  description,
                  style: AppFonts.poppins400(14, Colors.white),
                )),
              ),
            ],
          ),
          Container(
            margin: const EdgeInsets.only(top: 10),
            width: MediaQuery.of(context).size.width * 0.65,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                      color: const Color(0xffFFFFFF).withOpacity(0.05),
                      borderRadius: BorderRadius.circular(30)),
                  child: Row(
                    children: [
                      Container(
                        height: 32,
                        width: 32,
                        alignment: Alignment.center,
                        decoration: const BoxDecoration(
                            shape: BoxShape.circle, color: Color(0xff151543)),
                        child: (const Icon(
                          Icons.add,
                          color: Colors.white,
                        )),
                      ),
                      Container(
                        margin: const EdgeInsets.only(left: 15, right: 15),
                        child: (const Text(
                          "1",
                          style: TextStyle(color: Colors.white, fontSize: 20),
                        )),
                      ),
                      Container(
                        height: 32,
                        width: 32,
                        alignment: Alignment.center,
                        decoration: const BoxDecoration(
                            shape: BoxShape.circle, color: Color(0xff151543)),
                        child: Container(
                          height: 2,
                          width: 14,
                          decoration: const BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.all(Radius.circular(5)),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Column(
                  children: [
                    Container(
                      child: (Text(
                        "Total price",
                        style: AppFonts.poppins500(16, Colors.white),
                      )),
                    ),
                    Container(
                        child: (Text(price,
                            style: AppFonts.poppins500(24, Colors.white)))),
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
