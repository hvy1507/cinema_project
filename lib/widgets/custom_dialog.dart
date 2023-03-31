import 'package:flutter/material.dart';
import 'package:flutter_cinema_app/resource/fonts/app_fonts.dart';
import 'package:flutter_cinema_app/widgets/app_button.dart';

Future<void> showMyDialog(BuildContext context,
    {required final String title,
      required final String content,
      final String? titleImage,
      final VoidCallback? onPressButtonOne,
      required final bool noButton,
      final VoidCallback? onPressButtonTwo,
      final String? logoTitle,
      final String? buttonOneText,
      final String? buttonTwoText}) {
  return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          insetPadding: const EdgeInsets.only(left: 27, right: 27),
          contentPadding: const EdgeInsets.only(left: 20, right: 20),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
          title: noButton
              ? SizedBox(
            height: titleImage != null ? MediaQuery.of(context).size.height * 0.4 : MediaQuery.of(context).size.height * 0.2,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              mainAxisSize: MainAxisSize.max,
              children: [
                titleImage != null
                    ? Align(alignment: Alignment.topCenter,child: AspectRatio(aspectRatio: 0.9/0.4, child: Image.asset(titleImage)))
                    : const SizedBox.shrink(),
                Container(
                  margin: const EdgeInsets.only(bottom: 15),
                  child: Text(
                    title,
                    textAlign: TextAlign.center,
                    style: AppFonts.poppins600(20, Colors.black)
                        .copyWith(height: 30 / 20),
                  ),
                ),
                Text(
                  content,
                  textAlign: TextAlign.center,
                  style: AppFonts.poppins500(16, Colors.black),
                )
              ],
            ),
          )
              : FittedBox(
            child: Container(
              width: MediaQuery.of(context).size.width,
              decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(20), topLeft: Radius.circular(20))),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                        style: AppFonts.poppins700(22, Colors.black),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Container(
                    height: 1,
                    color: const Color(0xFFA00D6A),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                    content,
                    textAlign: TextAlign.center,
                    style: AppFonts.poppins500(16, Colors.black)
                        .copyWith(height: 24 / 16),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      buttonOneText != null
                          ? Expanded(
                        child: InkWell(
                          onTap: () {
                            onPressButtonOne;
                            Navigator.of(context).pop();
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
                            Navigator.of(context).pop();
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
          ),
        );
      });
}
