import 'package:daylist/data/api/model/api_title.dart';

class ApiTeacher {
  final String id;
  final String initials;
  final String institutionId;
  final ApiTitle title;
  final String classroom;
  final String? createdBy;

  ApiTeacher.fromApi(Map<String, dynamic> map)
      : id = map['\$id'],
        initials = map['initials'],
        classroom = map['classroom'],
        institutionId = map['institutionId'],
        title = ApiTitle.fromApi(map['title']),
        createdBy = map['createdBy'];
}
