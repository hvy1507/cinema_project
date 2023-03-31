import 'package:flutter/material.dart';
import 'package:flutter_cinema_app/app/app_theme.dart';
import 'package:flutter_cinema_app/model/model_moives.dart';
import 'package:flutter_cinema_app/resource/fonts/app_fonts.dart';

class WidgetMovie extends StatelessWidget {
  const WidgetMovie({
    super.key,
    required this.items,
  });
  final Items items;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      width: 100,
      margin: const EdgeInsets.only(right: 20),
      decoration: BoxDecoration(
          color: AppTheme.black, borderRadius: BorderRadius.circular(8)),
      child: Column(
        children: [
          Expanded(
            flex: 6,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image(
                image: NetworkImage(items.thumbnailMobile ?? ""),
                height: 160,
                width: 100,
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(
            height: 5,
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
              child: Text(
                items.title!.toUpperCase(),
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.center,
                style: AppFonts.poppins600(10, AppTheme.white),
              ),
            ),
          )
        ],
      ),
    );
  }
}
