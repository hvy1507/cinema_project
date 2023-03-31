import 'package:flutter/material.dart';
import 'package:flutter_cinema_app/resource/fonts/app_fonts.dart';

class ItemLocation extends StatelessWidget {
  ItemLocation(
      {super.key, required this.image, required this.location, this.onTap});

  final String image;
  final String location;
  void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(22),
              gradient: LinearGradient(colors: [
                const Color(0xff0CE4C9),
                const Color(0xff0DD8C4).withOpacity(0)
              ])),
          child: Padding(
            padding: const EdgeInsets.all(2),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(22),
              child: Image.asset(
                image,
                height: 75,
                width: 70,
              ),
            ),
          ),
        ),
        const SizedBox(
          height: 14,
        ),
        InkWell(
          onTap: onTap,
          child: Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                gradient: LinearGradient(colors: [
                  const Color(0xff60FFCA),
                  const Color(0xff194234).withOpacity(0)
                ])),
            child: Padding(
              padding: const EdgeInsets.all(2),
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: Colors.blue),
                child: Padding(
                  padding: const EdgeInsets.only(
                      top: 4, bottom: 1, right: 15, left: 16),
                  child: Text(
                    location,
                    textAlign: TextAlign.center,
                    style: AppFonts.roboto800(12,const Color(0xffffffff).withOpacity(0.95)),
                  ),
                ),
              ),
            ),
          ),
        )
      ],
    );
  }
}
