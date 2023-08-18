import 'package:intl/intl.dart';

class WeekUtil {
  static int numOfWeeks(int year) {
    DateTime dec28 = DateTime(year, 12, 28);
    int dayOfDec28 = int.parse(DateFormat("D").format(dec28));
    return ((dayOfDec28 - dec28.weekday + 10) / 7).floor();
  }

  static int weekNumber(DateTime date) {
    int dayOfYear = int.parse(DateFormat("D").format(date));
    int woy = ((dayOfYear - date.weekday + 10) / 7).floor();
    if (woy < 1) {
      return numOfWeeks(date.year - 1);
    } else if (woy > numOfWeeks(date.year)) {
      return 1;
    }
    return woy;
  }

  static int daysBetween(DateTime from, DateTime to) {
    from = DateTime(from.year, from.month, from.day);
    to = DateTime(to.year, to.month, to.day);
    return (to.difference(from).inHours / 24).round();
  }

  // static List<Subject> subjectsAtDay(
  //     List<Subject> subjects, int weekday, DateTime date) {
  //   return subjects
  //       .where((e) =>
  //           e.weekday == weekday &&
  //           (e.isEven == null || e.isEven == weekNumber(date).isEven))
  //       .toList();
  // }

  // static String dayToString(int day, int weekday) {
  //   return '$day ${t.days.short[weekday - 1]}';
  // }
}
