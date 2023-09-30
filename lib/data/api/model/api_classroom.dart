class ApiClassroom {
  final String id;
  final String title;

  ApiClassroom.fromApi(Map<String, dynamic> map)
      : id = map['\$id'],
        title = map['title'];
}
