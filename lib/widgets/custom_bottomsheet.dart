import 'package:flutter/material.dart';
import 'package:flutter_cinema_app/resource/fonts/app_fonts.dart';
import 'package:flutter_cinema_app/widgets/app_button.dart';

Future<void> showMyBottommSheet(BuildContext context,
    {required final String title,
      required final String content,
      final Function()? onPressButtonOne,
      final Function()? onPressButtonTwo,
      final String? logoTitle,
      final String? buttonOneText,
      final String? buttonTwoText}) {
  return showModalBottomSheet(
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(30),
          )),
      context: context,
      builder: (BuildContext context) {
        return SizedBox(
          height: MediaQuery.of(context).size.height * 1 / 3,
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    logoTitle != null
                        ? SizedBox(
                        width: 10,
                        height: 10,
                        child: Image.asset(
                          logoTitle,
                          color: Colors.black,
                        ))
                        : const SizedBox.shrink(),
                    const SizedBox(
                      width: 15,
                    ),
                    Text(
                      title,
                      textAlign: TextAlign.center,
                      style: AppFonts.poppins500(22, Colors.black),
                    )
                  ],
                ),
                Container(
                  margin: const EdgeInsets.only(bottom: 20),
                  height: 1,
                  color: const Color(0xFFA00D6A),
                ),
                Container(
                  margin: const EdgeInsets.only(bottom: 20),
                  child: Text(
                    content,
                    textAlign: TextAlign.center,
                    style: AppFonts.poppins600(16, Colors.black).copyWith(height: 24 / 16),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    buttonOneText != null
                        ? Expanded(
                      child: InkWell(
                        onTap: () {
                          onPressButtonOne;
                        },
                        child: AppButton(titleButton: buttonOneText),
                      ),
                    )
                        : const SizedBox.shrink(),
                    const SizedBox(
                      width: 20,
                    ),
                    buttonTwoText != null
                        ? Expanded(
                      child: InkWell(
                        onTap: () {
                          onPressButtonTwo;
                        },
                        child: AppButton(titleButton: buttonTwoText),
                      ),
                    )
                        : const SizedBox.shrink(),
                  ],
                )
              ],
            ),
          ),
        );
      });
}

