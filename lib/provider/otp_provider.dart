import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cinema_app/screens/send_otp.dart';

class OTPService extends ChangeNotifier {
  String _verificationCode = '+84 337421311';

  set verificationCode(String value) {
    _verificationCode = value;
  }

  String get verificationCode => _verificationCode;

  void verifyPhone(BuildContext context) async {
    await FirebaseAuth.instance.verifyPhoneNumber(
        phoneNumber: _verificationCode,
        verificationCompleted: (PhoneAuthCredential credential) async {
          await FirebaseAuth.instance
              .signInWithCredential(credential)
              .then((value) async {
            if (value.user != null) {
              Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (context) => const SendOTPScreen()),
                  (route) => false);
            }
          });
        },
        verificationFailed: (FirebaseAuthException e) {},
        codeSent: (String verficationID, int? resendToken) {
          _verificationCode = verficationID;
        },
        codeAutoRetrievalTimeout: (String verificationID) {
          _verificationCode = verificationID;
        },
        timeout: const Duration(seconds: 120));
    notifyListeners();
  }
}
