import 'package:flutter/material.dart';
import 'package:flutter_cinema_app/app/app_routes.dart';
import 'package:flutter_cinema_app/generated/l10n.dart';
import 'package:flutter_cinema_app/provider/phone_number_provider.dart';
import 'package:flutter_cinema_app/resource/fonts/app_fonts.dart';
import 'package:flutter_cinema_app/resource/images/app_images.dart';
import 'package:flutter_cinema_app/provider/otp_provider.dart';
import 'package:flutter_cinema_app/widgets/app_button.dart';
import 'package:flutter_cinema_app/widgets/back_button.dart';
import 'package:flutter_cinema_app/widgets/item_forgot.dart';
import 'package:provider/provider.dart';

class OTPScreen extends StatefulWidget {
  const OTPScreen({Key? key}) : super(key: key);

  @override
  State<OTPScreen> createState() => _OTPScreenState();
}

class _OTPScreenState extends State<OTPScreen> {
  bool isSelected = false;
  @override
  Widget build(BuildContext context) {
    final phoneNumber = Provider.of<PhoneNumber>(context);

    final otp = Provider.of<OTPService>(context);
    return Scaffold(
      backgroundColor: const Color(0xFF130B2B),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: Container(
            margin: const EdgeInsets.only(left: 15), child: const AppBackButton()),
        title: const Text('Forgot Password'),
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 30, right: 30),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Flexible(
                flex: 7,
                child:
                    AspectRatio(aspectRatio: 1, child: Image.asset(AppImages.imageOTP))),
            Flexible(
                flex: 2,
                child: FittedBox(
                    fit: BoxFit.scaleDown,
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Select which contact details should\nwe use to reset your password',
                      maxLines: 2,
                      style: AppFonts.poppins500(18, Colors.white),
                    ))),
            Flexible(
              flex: 2,
              child: InkWell(
                onTap: (){
                  setState(() {
                    isSelected = true;
                  });
                },
                child: ItemForgot(
                     isSelect: isSelected ,
                      icon: AppImages.iconMessenger,
                      title: 'via SMS',
                      detail: phoneNumber.obscurePhoneNumber),
              ),
            ),
            Flexible(
              flex: 2,
              child: InkWell(
                onTap: (){
                  setState(() {
                  isSelected = false;
                  });
                },
                child: ItemForgot(
                      isSelect: !isSelected ,
                      icon: AppImages.iconEmail,
                      title: 'via Email',
                      detail: '+madday***@gmail.com'),
              ),
            ),
            Flexible(
                flex: 1,
                child: AppButton(
                    onTap: () async {
                      otp.verificationCode = phoneNumber.formattedPhoneNumber;
                      print(otp.verificationCode);
                      otp.verifyPhone(context);
                      await Future.delayed(const Duration(seconds: 10), () {
                        Navigator.pushNamed(context, AppRoutes.forgot);
                      });
                    },
                    titleButton: S.of(context).Continue)),
          ],
        ),
      ),
    );
  }
}
