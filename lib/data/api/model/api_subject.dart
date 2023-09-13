import 'package:daylist/data/api/model/api_teacher.dart';
import 'package:daylist/data/api/model/api_time.dart';

class ApiSubject {
  final String id;
  final ApiTeacher teacher;
  final ApiTime time;
  final String groupId;
  final bool? isEven;
  final int weekday;
  final String? createdBy;

  ApiSubject.fromApi(Map<String, dynamic> map)
      : id = map['\$id'],
        teacher = ApiTeacher.fromApi(map['teacher']),
        time = ApiTime.fromApi(map['time']),
        groupId = map['groupId'],
        isEven = map['isEven'],
        weekday = map['weekday'],
        createdBy = map['createdBy'];
}
