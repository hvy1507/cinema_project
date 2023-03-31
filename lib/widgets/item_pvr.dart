import 'package:flutter/material.dart';
import 'package:flutter_cinema_app/resource/fonts/app_fonts.dart';
class ItemPVR extends StatelessWidget {
  const ItemPVR({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          gradient: LinearGradient(
            colors: [
              const Color(0xffA4C8FF),
              const Color(0xffA4C8FF).withOpacity(0)
            ],
          ),
          boxShadow: [
            BoxShadow(
                offset: const Offset(0, 2),
                blurRadius: 2,
                spreadRadius: 0,
                color: const Color(0xff000000).withOpacity(0.25))
          ]),
      child: Padding(
        padding: const EdgeInsets.only(top: 17, bottom: 20, left: 24, right: 5),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Flexible(
              flex: 9,
              child: Text(
                title,
                textAlign: TextAlign.center,
                style: AppFonts.roboto500(20, const Color(0xffffffff)),
              ),
            ),
            const Flexible(
              child: Icon(
                Icons.arrow_forward_ios_outlined,
                size: 15,
                color: Color(0xffffffff),
              ),
            )
          ],
        ),
      ),
    );
  }
}
