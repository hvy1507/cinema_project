import 'package:flutter/material.dart';
import 'package:flutter_cinema_app/resource/fonts/app_fonts.dart';
class ItemDate extends StatelessWidget {
  ItemDate(
      {super.key,
        this.isSelected = false,
        required this.day,
        required this.date,
        required this.padding});

  bool isSelected;
  final String day;
  final String date;
  final EdgeInsetsGeometry padding;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 20),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          gradient: isSelected
              ? LinearGradient(colors: [
            const Color(0xffFE53BB),
            const Color(0xffFE53BB).withOpacity(0)
          ], begin: Alignment.topLeft, end: Alignment.bottomRight)
              : LinearGradient(colors: [
            const Color(0xff09FBD3),
            const Color(0xff09fbd3).withOpacity(0)
          ], begin: Alignment.topLeft, end: Alignment.bottomRight)),
      child: Padding(
        padding: const EdgeInsets.all(2),
        child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              gradient: isSelected
                  ? const LinearGradient(
                  colors: [Color(0xffB6116B), Color(0xff2E1371)],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight)
                  : const LinearGradient(
                  colors: [Color(0xff2E1371), Color(0x0ff1232f)],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight)),
          child: Padding(
            padding: padding,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  day,
                  style: AppFonts.poppins500(12, const Color(0xffffffff).withOpacity(0.87)),
                ),
                Text(
                  date,
                  style:AppFonts.poppins700(15, const Color(0xffffffff).withOpacity(0.87)),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
