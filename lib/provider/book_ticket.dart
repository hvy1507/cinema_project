import 'package:flutter/cupertino.dart';

import '../generated/l10n.dart';

class BookTicket extends ChangeNotifier {
  final Map<String, String> _date = {
    '10:30': 'AM',
    '12:30': 'PM',
    '2:30': 'PM',
    '5:00': 'PM',
    '6:45': 'PM',
    '8:00': 'PM',
    '10:00': 'PM'
  };

  Map<String, String> get date => _date;
// date SONG NGU
  List<String> dateBillingual = [
    S.current.mon,
    S.current.tue,
    S.current.wed,
    S.current.thu,
    S.current.fri,
    S.current.sat,
    S.current.sun
  ];
  List<DateTime> day = List.generate(
    7,
        (index) => DateTime.now().add(Duration(days: index)),
  );
  String _timePicked = '';

  String get timePicked => _timePicked;
  String _datePicked= '';

  String get datePicked => _datePicked;

  void getTimeFromIndex(int timeSelectedIndex) {
    List<MapEntry<String, String>> entries = _date.entries.toList();
    _timePicked = '${entries[timeSelectedIndex].key} ${entries[timeSelectedIndex].value}';
    notifyListeners();
  }

  void getDateFromIndex(int dateSelectedIndex) {
    _datePicked = day[dateSelectedIndex].toIso8601String().substring(8, 10);
    notifyListeners();
  }
}
