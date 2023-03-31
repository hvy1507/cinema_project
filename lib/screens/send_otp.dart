import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cinema_app/app/app_theme.dart';
import 'package:flutter_cinema_app/provider/otp_provider.dart';
import 'package:flutter_cinema_app/provider/phone_number_provider.dart';
import 'package:flutter_cinema_app/resource/fonts/app_fonts.dart';
import 'package:flutter_cinema_app/screens/reset_password.dart';
import 'package:flutter_cinema_app/widgets/app_button.dart';
import 'package:flutter_cinema_app/widgets/back_button.dart';
import 'package:flutter_cinema_app/widgets/custom_dialog.dart';
import 'package:gradient_borders/box_borders/gradient_box_border.dart';
import 'package:pinput/pinput.dart';

import 'package:provider/provider.dart';

class SendOTPScreen extends StatefulWidget {
  const SendOTPScreen({super.key});

  @override
  State<SendOTPScreen> createState() => _SendOTPScreenState();
}

class _SendOTPScreenState extends State<SendOTPScreen> {
  final defaultPinTheme = PinTheme(
    width: 56,
    height: 56,
    textStyle: const TextStyle(
        fontSize: 20, color: Colors.white, fontWeight: FontWeight.w600),
    decoration: BoxDecoration(
        border: GradientBoxBorder(gradient: AppTheme.greenGradient2),
        borderRadius: BorderRadius.circular(10)),
  );
  int countDown = 60;
  Timer? timer;

  @override
  void initState() {
    super.initState();
    startCountDown();
  }

  void startCountDown() {
    const oneSec = Duration(seconds: 1);
    timer = Timer.periodic(oneSec, (timer) {
      setState(() {
        if (countDown == 0) {
          timer.cancel();
        } else {
          countDown--;
        }
      });
    });
  }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }

  final TextEditingController _pinPutController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final phoneNumber = Provider.of<PhoneNumber>(context);
    return Consumer<OTPService>(
      builder: (context, otpp, child) {
        return Scaffold(
          backgroundColor: const Color(0xFF130B2B),
          appBar: AppBar(
            elevation: 0,
            backgroundColor: Colors.transparent,
            leading: Container(
                margin: const EdgeInsets.only(left: 15),
                child: const AppBackButton()),
            title: const Text('Forgot Password'),
          ),
          body: Padding(
            padding: const EdgeInsets.only(left: 30, right: 30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Spacer(
                  flex: 5,
                ),
                Expanded(
                    flex: 1,
                    child: FittedBox(
                      fit: BoxFit.none,
                      clipBehavior: Clip.none,
                      child: Text(
                        'Code has been send to\n${phoneNumber.obscurePhoneNumber}',
                        textAlign: TextAlign.center,
                        style: AppFonts.poppins600(18, Colors.white),
                      ),
                    )),
                const Spacer(
                  flex: 1,
                ),
                Expanded(
                  flex: 1,
                  child: Pinput(
                    length: 6,
                    defaultPinTheme: defaultPinTheme,
                    controller: _pinPutController,
                    pinAnimationType: PinAnimationType.fade,
                  ),
                ),
                const Spacer(
                  flex: 1,
                ),
                Expanded(
                    flex: 1,
                    child: FittedBox(
                      fit: BoxFit.none,
                      child: RichText(
                        text: TextSpan(
                          children: [
                            TextSpan(
                                text: 'Resend code in ',
                                style: AppFonts.poppins700(19, Colors.white)),
                            TextSpan(
                                text: '$countDown',
                                style: AppFonts.poppins700(
                                    19, const Color(0xFFDF1893))),
                            TextSpan(
                                text: ' s',
                                style: AppFonts.poppins700(19, Colors.white)),
                          ],
                        ),
                      ),
                    )),
                const Spacer(
                  flex: 3,
                ),
                Expanded(
                    flex: 2,
                    child: Align(
                      alignment: Alignment.topCenter,
                      child: SizedBox(
                        height: 55,
                        child: AppButton(
                          onTap: () async {
                            try {
                              await FirebaseAuth.instance
                                  .signInWithCredential(
                                      PhoneAuthProvider.credential(
                                          verificationId: otpp.verificationCode,
                                          smsCode: _pinPutController.text))
                                  .then((value) async {
                                if (value.user != null) {
                                  Navigator.pushAndRemoveUntil(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              const ResetPasswordScreen()),
                                      (route) => false);
                                }
                              });
                            } catch (e) {
                              showMyDialog(context,
                                  title: 'Thông báo',
                                  noButton: false,
                                  content:
                                      'Mã OTP bạn vừa nhập không chính xác\n vui lòng nhập lại',
                                  buttonOneText: 'Nhập lại mã');
                            }
                          },
                          titleButton: 'Verify',
                        ),
                      ),
                    )),
                const Spacer(
                  flex: 1,
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
