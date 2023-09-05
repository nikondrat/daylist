import 'package:daylist/domain/model/teacher.dart';
import 'package:daylist/domain/model/time.dart';

class ApiReplacement {
  final String id;
  // final String teacherId;
  // final String timeId;
  final Teacher teacher;
  final Time time;

  final String groupId;
  final String date;
  final String mode;
  final int? undergroup;
  final String? createdBy;

  ApiReplacement.fromApi(Map<String, dynamic> map)
      : id = map['\$id'],
        teacher = Teacher.fromMap(map['teacher']),
        time = Time.fromMap(map['time']),
        // teacherId = map['teacherId'],
        // timeId = map['timeId'],
        groupId = map['groupId'],
        date = map['date'],
        mode = map['mode'],
        undergroup = map['undergroup'],
        createdBy = map['createdBy'];
}
