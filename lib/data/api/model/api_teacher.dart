import 'package:daylist/data/api/model/api_classroom.dart';
import 'package:daylist/data/api/model/api_title.dart';

class ApiTeacher {
  final String id;

  // initials
  final String name;
  final String surname;
  final String patronymic;

  // other data
  final ApiTitle title;
  final ApiClassroom classroom;
  final String institutionId;

  ApiTeacher.fromApi(Map<String, dynamic> map)
      : id = map['\$id'],
        name = map['name'],
        surname = map['surname'],
        patronymic = map['patronymic'],
        classroom = ApiClassroom.fromApi(map['classroom']),
        institutionId = map['institutionId'],
        title = ApiTitle.fromApi(map['title']);
}
