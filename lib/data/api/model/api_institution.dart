class ApiInstitution {
  final String id;
  final String title;
  final String shortTitle;
  final String cityId;
  final String? createdBy;

  ApiInstitution.fromApi(Map<String, dynamic> map)
      : id = map['\$id'],
        title = map['title'],
        shortTitle = map['shortTitle'],
        cityId = map['cityId'],
        createdBy = map['createdBy'];
}
