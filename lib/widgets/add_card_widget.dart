import 'package:flutter/material.dart';
import 'package:flutter_cinema_app/app/app_theme.dart';
import 'package:flutter_cinema_app/resource/fonts/app_fonts.dart';
import 'package:provider/provider.dart';

import '../provider/user.dart';

class AddCard extends StatelessWidget {
  const AddCard(
      {super.key,
      required this.title,
      required this.textController,
      required this.flex,
      this.isNumber,
      this.isName,
      this.isDate});

  final String title;
  final TextEditingController textController;

  final double flex;
  final bool? isNumber;

  final bool? isName;

  final bool? isDate;

  @override
  Widget build(BuildContext context) {
    return Consumer<User>(builder: (context, userData, child) {
      return Container(
        width: flex * MediaQuery.of(context).size.width,
        height: 39,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                const Color(0xffffffff).withOpacity(0.2),
                // const Color(0xffffffff).withOpacity(0),
                const Color(0xff2E1371).withOpacity(0.5),
                const Color(0xff2E1371).withOpacity(1),
              ]),
          border: Border.all(width: 1, color: const Color(0xFF5C5C5C).withOpacity(0.77)),
          boxShadow: [
            BoxShadow(
                color: const Color(0xff000000).withOpacity(0.25),
                offset: const Offset(18, 15),
                blurRadius: 19.0,
                spreadRadius: -5)
          ],
        ),
        alignment: Alignment.centerLeft,
        padding: const EdgeInsets.only(left: 13),
        child: TextFormField(
          decoration: InputDecoration(
            border: InputBorder.none,
            hintText: title,
            hintStyle: const TextStyle(
              color: Color(0xffFFFFFF),
            ),
          ),
          style: AppFonts.poppins400(15, AppTheme.white).copyWith(height: 15 / 15),
          controller: textController,
          onChanged: (value) {
            if (isNumber == true) {
              userData.updateNumberOnCard(value);
            } else if (isName == true) {
              userData.updateNameOfUserOnCard(value);
            } else if (isDate == true) {
              userData.updateExpiryDateOnCard(value);
            }
          },
        ),
      );
    });
  }
}
