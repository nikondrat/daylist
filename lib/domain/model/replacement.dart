import 'package:daylist/domain/model/teacher.dart';
import 'package:daylist/domain/model/time.dart';

enum ReplacementMode { usual, exam, practice, laboratory, test, cancel }

class Replacement {
  final String id;
  final Teacher teacher;
  final Time time;
  final String groupId;
  final DateTime date;
  final int? undergroup;
  final ReplacementMode mode;

  Replacement(
      {required this.id,
      required this.teacher,
      required this.time,
      required this.groupId,
      required this.date,
      required this.mode,
      required this.undergroup});
}
