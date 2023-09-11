import 'package:daylist/domain/model/teacher.dart';
import 'package:daylist/domain/model/time.dart';

class Subject {
  final String id;
  final Teacher teacher;
  final Time time;
  final String groupId;
  final bool? isEven;
  final int weekday;
  final String? createdBy;

  Subject(
      {required this.id,
      required this.teacher,
      required this.time,
      required this.groupId,
      required this.isEven,
      required this.weekday,
      required this.createdBy});

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'teacher': teacher.toMap(),
      'timeId': time.toMap(),
      'groupId': groupId,
      'isEven': isEven,
      'weekday': weekday,
      'createdBy': createdBy
    };
  }

  factory Subject.fromMap(Map<String, dynamic> map) {
    return Subject(
        id: map['documentId'] as String,
        teacher: Teacher.fromMap(map['teacher']),
        time: Time.fromMap(map['time']),
        groupId: map['groupId'] as String,
        isEven: map['isEven'] != null ? map['isEven'] as bool : null,
        weekday: map['weekday'] as int,
        createdBy: map['createdBy'] as String?);
  }
}
