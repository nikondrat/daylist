import 'package:daylist/data/api/model/api_teacher.dart';
import 'package:daylist/data/api/model/api_time.dart';

class ApiSubject {
  final String id;

  final int weekday;
  final List<bool> showInWeek;

  final ApiTeacher teacher;
  final ApiTime time;
  final String groupId;

  ApiSubject.fromApi(Map<String, dynamic> map)
      : id = map['\$id'],
        teacher = ApiTeacher.fromApi(map['teacher']),
        time = ApiTime.fromApi(map['time']),
        groupId = map['groupId'],
        showInWeek = map['showInWeek'],
        weekday = map['weekday'];
}
