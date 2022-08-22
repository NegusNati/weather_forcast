import 'package:intl/intl.dart';

String gg =
    "https://api.openweathermap.org/data/2.5/forecast/daily?q=London&cnt=7&appid=ed60fcfbd110ee65c7150605ea8aceea&units=metric";

class Util {
  static String appId = "ed60fcfbd110ee65c7150605ea8aceea";

  static String getFormatedDate(DateTime dateTime) {
    return DateFormat('EEEE, MMM d, ' 'y').format(dateTime);
  }
}
