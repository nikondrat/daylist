class ApiTitle {
  final String id;
  final String title;

  ApiTitle.fromApi(Map<String, dynamic> map)
      : id = map['\$id'],
        title = map['title'];
}
