import 'package:flutter/material.dart';
import 'package:flutter_cinema_app/generated/l10n.dart';


class LanguageProvider extends ChangeNotifier {
  Locale _locale = const Locale('vi');

  Locale get locale => _locale;

  Future<void> setLocale(Locale locale) async {
    _locale = locale;
    await S.load(locale);
    notifyListeners();
  }
}
