import 'package:daylist/data/api/model/api_city.dart';

class ApiInstitution {
  final String id;
  final String title;
  final String shortTitle;
  final ApiCity city;
  final String? createdBy;

  ApiInstitution.fromApi(Map<String, dynamic> map)
      : id = map['\$id'],
        title = map['title'],
        shortTitle = map['shortTitle'],
        city = ApiCity.fromApi(map['city']),
        createdBy = map['createdBy'];
}
