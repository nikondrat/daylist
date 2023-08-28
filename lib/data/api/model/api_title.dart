class ApiTitle {
  final String id;
  final String title;
  final String? createdBy;

  ApiTitle.fromApi(Map<String, dynamic> map)
      : id = map['\$id'],
        title = map['title'],
        createdBy = map['createdBy'];
}
