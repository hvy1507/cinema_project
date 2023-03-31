import 'package:flutter/foundation.dart';

class PhoneNumber extends ChangeNotifier {
  String _phone = '0337421311';

  String get phone => _phone;

  String get formattedPhoneNumber => "+84 " + _phone.replaceRange(0, 1, "");

  String get obscurePhoneNumber {
    const hidden = '******';
    return formattedPhoneNumber.replaceRange(3, 9, hidden);
  }

  set phone(String value) {
    _phone = value;
    notifyListeners();
  }
}
