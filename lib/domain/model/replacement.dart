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
  final String? createdBy;
  final ReplacementMode mode;

  Replacement(
      {required this.id,
      required this.teacher,
      required this.time,
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
      'groupId': groupId,
      'date': date.toIso8601String(),
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
      groupId: map['groupId'],
      date: DateTime.parse(map['date']),
      mode: map['mode'] as ReplacementMode,
      undergroup: map['undergroup'] as int?,
      createdBy: map['createdBy'],
    );
  }
}
