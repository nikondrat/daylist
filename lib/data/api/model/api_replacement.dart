import 'package:daylist/data/api/model/api_teacher.dart';
import 'package:daylist/data/api/model/api_time.dart';

class ApiReplacement {
  final String id;

  final ApiTeacher teacher;
  final ApiTime time;
  final String groupId;

  final DateTime date;
  final String mode;
  final int? undergroup;

  ApiReplacement.fromApi(Map<String, dynamic> map)
      : id = map['\$id'],
        teacher = ApiTeacher.fromApi(map['teacher']),
        time = ApiTime.fromApi(map['time']),
        groupId = map['groupId'],
        date = DateTime.parse(map['date']),
        mode = map['mode'],
        undergroup = map['undergroup'];
}
