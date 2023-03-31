import 'package:flutter/material.dart';
import 'package:flutter_cinema_app/model/model_moives.dart';

class WidgetBanner extends StatelessWidget {
  const WidgetBanner({
    super.key,
    required this.items,
  });
  final Items items;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 10),
      height: 200,
      width: MediaQuery.of(context).size.width,
      margin: const EdgeInsets.only(right: 20),
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(8)),
      alignment: Alignment.center,
      child: Image(
        image: NetworkImage(items.thumbnail ?? ""),
        fit: BoxFit.cover,
      ),
    );
  }
}
