import 'package:daylist/data/api/model/api_classroom.dart';
import 'package:daylist/data/api/model/api_replacement.dart';
import 'package:daylist/data/api/model/api_subject.dart';
import 'package:daylist/data/api/model/api_teacher.dart';
import 'package:daylist/data/api/model/api_time.dart';
import 'package:daylist/data/api/model/api_title.dart';

class ApiVoiting {
  final String id;

  final String type;
  final List pros;
  final List cons;

  final ApiTime? time;
  final ApiTitle? title;
  final ApiTeacher? teacher;
  final ApiSubject? subject;
  final ApiClassroom? classroom;
  final ApiReplacement? replacement;

  ApiVoiting.fromApi(Map<String, dynamic> map)
      : id = map['\$id'],
        type = map['type'],
        pros = map['pros'],
        cons = map['cons'],
        time = map['time'] != null ? ApiTime.fromApi(map['time']) : null,
        title = map['title'] != null ? ApiTitle.fromApi(map['title']) : null,
        teacher =
            map['teacher'] != null ? ApiTeacher.fromApi(map['teacher']) : null,
        subject =
            map['subject'] != null ? ApiSubject.fromApi(map['subject']) : null,
        classroom = map['classroom'] != null
            ? ApiClassroom.fromApi(map['classroom'])
            : null,
        replacement = map['replacement'] != null
            ? ApiReplacement.fromApi(map['replacement'])
            : null;
}
