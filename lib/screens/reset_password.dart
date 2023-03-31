import 'package:flutter/material.dart';
import 'package:flutter_cinema_app/app/app_routes.dart';
import 'package:flutter_cinema_app/generated/l10n.dart';
import 'package:flutter_cinema_app/resource/fonts/app_fonts.dart';
import 'package:flutter_cinema_app/resource/images/app_images.dart';
import 'package:flutter_cinema_app/widgets/app_textfield.dart';
import 'package:flutter_cinema_app/widgets/back_button.dart';
import 'package:flutter_cinema_app/widgets/custom_dialog.dart';

import '../widgets/app_button.dart';

class ResetPasswordScreen extends StatefulWidget {
  const ResetPasswordScreen({Key? key}) : super(key: key);

  @override
  State<ResetPasswordScreen> createState() => _ResetPasswordScreenState();
}

class _ResetPasswordScreenState extends State<ResetPasswordScreen> {

  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _reEnterPasswordController = TextEditingController();
  bool isChecked = false;
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _passwordController.dispose();
    _reEnterPasswordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: const Color(0xFF130B2B),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: Container(
            margin: const EdgeInsets.only(left: 15), child: const AppBackButton()),
        title: Text(
          'Create New Password',
          style: AppFonts.poppins500(22, Colors.white),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 25, right: 25),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Flexible(
                flex: 1,
                child: Text(
                  'Create Your New Password',
                  style: AppFonts.poppins600(18, Colors.white),
                )),
            Flexible(
                flex: 2,
                child: Text(
                    'Choose a password that must have at least\n8 characters with at least one Capital\nletter, lower letter and at least 1 digit.',
                    textAlign: TextAlign.center,
                    maxLines: 3,
                    style: AppFonts.poppins600(14, const Color(0xFFBDBDBD)))),
            Align(
                alignment: Alignment.centerLeft,
                child: Flexible(
                    flex: 1,
                    child: Text(
                      'New Password',
                      style: AppFonts.poppins600(18, Colors.white),
                    ))),
            Flexible(
                flex: 2,
                child: AppTextField(
                  controller: _passwordController,
                  hintText: 'Nhập mật khẩu',
                  icon: AppImages.iconPassword,
                  isIcon: true,
                  isPassword: true,
                )),
            Align(
                alignment: Alignment.centerLeft,
                child: Flexible(
                    flex: 1,
                    child: Text(
                      'Re-enter New Password',
                      style: AppFonts.poppins600(18, Colors.white),
                    ))),
            Flexible(
                flex: 2,
                child: AppTextField(
                  controller: _reEnterPasswordController,
                  hintText: 'Nhập lại mật khẩu',
                  icon: AppImages.iconPassword,
                  isIcon: true,
                  isPassword: true,
                )),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Checkbox(
                  fillColor:
                      MaterialStateColor.resolveWith((states) => const Color(0xffB6116B)),
                  checkColor: Colors.white,
                  activeColor: const Color(0xffB6116B),
                  value: isChecked,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
                  onChanged: (bool? value) {
                    setState(() {
                      isChecked = value!;
                    });
                  },
                ),
                Text(
                  S.of(context).remember,
                  style: AppFonts.poppins500(14, Colors.white),
                )
              ],
            ),
            Flexible(
                fit: FlexFit.loose,
                flex: 1,
                child: FractionallySizedBox(
                  heightFactor: 2 / 3,
                  child: AppButton(
                    onTap: () {
                      if (_passwordController.text.trim() == _reEnterPasswordController.text.trim()) {
                        showMyDialog(context,
                            title: S.of(context).congrat,
                            content: S.of(context).accountReady,
                            noButton: true);
                        Future.delayed(const Duration(seconds: 3), () {
                          Navigator.pushNamed(context, AppRoutes.homePage);
                        });
                      } else {
                        showMyDialog(context,
                            title: S.of(context).wrong,
                            content: S.of(context).noti,
                            noButton: false,
                            buttonOneText: S.of(context).reEnter);
                      }
                    },
                    titleButton: 'Submit',
                  ),
                )),
            Text(
              'To make sure your account is secure, you’ll be logged\nout from other devices once you set the new password.',
              maxLines: 2,
              style: AppFonts.poppins500(12, const Color(0xFFBDBDBD)),
            )
          ],
        ),
      ),
    );
  }
}
