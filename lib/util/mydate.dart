import 'package:intl/intl.dart';

class MyDate {
  static String myDate(String d) {
    String timestampString = d;
    DateTime timestamp = DateTime.parse(timestampString);

    String formattedDate = DateFormat('dd/MM/yy').format(timestamp);

    return formattedDate;
  }
}
