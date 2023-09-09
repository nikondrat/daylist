class ApiGroup {
  final String id;
  final String title;
  final String institutionId;

  ApiGroup.fromApi(Map<String, dynamic> map)
      : id = map['\$id'],
        title = map['title'],
        institutionId = map['institutionId'];
}
