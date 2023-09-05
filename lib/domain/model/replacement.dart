import 'package:daylist/domain/model/teacher.dart';
import 'package:daylist/domain/model/time.dart';

enum ReplacementMode { usual, exam, practice, laboratory, test, cancel }

class Replacement {
  final String id;
  final Teacher teacher;
  final Time time;
  // final String timeId;
  // final String teacherId;
  final String groupId;
  final String date;
  final int? undergroup;
  final String? createdBy;
  final ReplacementMode mode;

  Replacement(
      {required this.id,
      required this.teacher,
      required this.time,
      // required this.timeId,
      // required this.teacherId,
      required this.groupId,
      required this.date,
      required this.mode,
      required this.undergroup,
      required this.createdBy});

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'teacher': teacher.toMap(),
      'time': time.toMap(),
      // 'timeId': timeId,
      // 'teacherId': teacherId,
      'groupId': groupId,
      'date': date,
      'mode': mode,
      'undergroup': undergroup,
      'createdBy': createdBy
    };
  }

  factory Replacement.fromMap(Map<String, dynamic> map) {
    return Replacement(
      id: map['id'] as String,
      teacher: Teacher.fromMap(map['teacher']),
      time: Time.fromMap(map['time']),
      // teacherId: map['teacherId'] as String,
      // timeId: map['timeId'] as String,
      groupId: map['groupId'] as String,
      date: map['date'],
      mode: map['mode'] as ReplacementMode,
      undergroup: map['undergroup'] as int?,
      createdBy: map['createdBy'],
    );
  }
}
