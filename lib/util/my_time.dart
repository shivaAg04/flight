import 'package:intl/intl.dart';

class MyTime {
  static String mytime(String d) {
    String timestampString = d;
    DateTime timestamp = DateTime.parse(timestampString);

    String formattedTime = DateFormat('HH:mm').format(timestamp);
    return formattedTime;
  }
}
