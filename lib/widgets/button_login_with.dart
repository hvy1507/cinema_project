import 'package:flutter/material.dart';
import 'package:flutter_cinema_app/app/app_theme.dart';
import 'package:flutter_cinema_app/generated/l10n.dart';
import 'package:flutter_cinema_app/resource/fonts/app_fonts.dart';
class ButtonLoginWith extends StatelessWidget {
  const ButtonLoginWith({Key? key, required this.title, required this.urlIcon}) : super(key: key);
  final String title;
  final String urlIcon;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      padding: const EdgeInsets.all(2),
      decoration: BoxDecoration(
        gradient: AppTheme.colorBorder,
        borderRadius: BorderRadius.circular(20)
      ),
      child: Container(
        padding: const EdgeInsets.only(top: 12, bottom: 12,  left: 41),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: const Color(0xff130B2B),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
              SizedBox(
                width: 22,
                  height: 22,
                  child: Image.asset(urlIcon)),
             const SizedBox(width: 23),
             Text(S.of(context).continuewith + '' + title, style:
             AppFonts.poppins500(17,AppTheme.colorWhite09))
          ],
        ),
      ),
    );
  }
}
