import 'package:flutter/material.dart';
import 'package:flutter_cinema_app/app/app_theme.dart';
import 'package:flutter_cinema_app/resource/fonts/app_fonts.dart';

class ItemForgot extends StatefulWidget {
  ItemForgot(
      {super.key,
      this.isSelect = false,
      required this.icon,
      required this.title,
      required this.detail});

  bool isSelect;
  final String icon;
  final String title;
  final String detail;

  @override
  State<ItemForgot> createState() => _ItemForgotState();
}

class _ItemForgotState extends State<ItemForgot> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        gradient: !widget.isSelect
            ? AppTheme.greenGradient3
            : AppTheme.pinkGradient3,
      ),
      child: Padding(
        padding: const EdgeInsets.all(2),
        child: DecoratedBox(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              color: AppTheme.blackBackground),
          child: Padding(
            padding: const EdgeInsets.only(left: 23),
            child: Row(
              children: [
                Expanded(
                  flex: 1,
                  child: Container(
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: AppTheme.green.withOpacity(0.1)),
                      child: Padding(
                        padding: const EdgeInsets.all(15),
                        child: Image.asset(
                          widget.icon,
                          height: 18,
                          width: 20,
                        ),
                      )),
                ),
                SizedBox(width: 15,),
                Expanded(
                  flex: 5,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 5),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Spacer(flex: 1,),
                        Expanded(
                          flex: 1,
                          child: FittedBox(
                            fit: BoxFit.contain,
                            child: Text(
                              widget.title,
                              style: AppFonts.poppins500(17,AppTheme.gray),
                            ),
                          ),
                        ),
                        Spacer(flex: 1,),
                        Expanded(
                          flex: 1,
                          child: FittedBox(
                            fit: BoxFit.contain,
                            child: Text(
                              widget.detail,
                              maxLines: 1,
                              style: AppFonts.poppins500(17, AppTheme.white),
                            ),
                          ),
                        ),
                        Spacer(flex: 1,)
                      ],
                    ),
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
