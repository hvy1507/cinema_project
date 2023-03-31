import 'package:flutter/material.dart';
import 'package:flutter_cinema_app/app/app_theme.dart';
import 'package:flutter_cinema_app/resource/fonts/app_fonts.dart';

class ItemTopsearch extends StatelessWidget {
  const ItemTopsearch(
      {super.key,
      required this.movie,
      required this.name,
      required this.time,
      required this.category});

  final String movie;
  final String name;
  final String time;
  final String category;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16),
      height: 72,
      color: const Color(0xff111928),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            flex: 1,
            child: Image(
              image: NetworkImage(
                movie,
              ),
              height: 72,
              width: 144,
              fit: BoxFit.fill,
            ),
          ),
          const SizedBox(
            width: 15,
          ),
          Expanded(
            flex: 5,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 9,
                ),
                Expanded(
                  child: Text(
                    name.toUpperCase(),
                    style: AppFonts.poppins600(12, AppTheme.white),
                    overflow: TextOverflow.visible,
                  ),
                ),
                Expanded(
                    child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      time,
                      style: AppFonts.poppins500(10, AppTheme.white),
                    ),
                    Text(
                      category.toUpperCase(),
                      style: AppFonts.poppins500(10, AppTheme.white),
                    ),
                  ],
                )),
              ],
            ),
          )
        ],
      ),
    );
  }
}
