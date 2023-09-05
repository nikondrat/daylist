import 'package:daylist/data/api/model/api_institution.dart';

class ApiGroup {
  final String id;
  final String title;
  final ApiInstitution institution;

  ApiGroup.fromApi(Map<String, dynamic> map)
      : id = map['\$id'],
        title = map['title'],
        institution = map['institution'];
}
