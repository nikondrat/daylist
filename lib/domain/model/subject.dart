import 'package:daylist/domain/model/teacher.dart';
import 'package:daylist/domain/model/time.dart';

class Subject {
  final String id;
  final Teacher teacher;
  final Time time;
  final String groupId;
  final List<bool> showInWeek;
  final int weekday;

  Subject(
      {required this.id,
      required this.teacher,
      required this.time,
      required this.groupId,
      required this.showInWeek,
      required this.weekday});
}
