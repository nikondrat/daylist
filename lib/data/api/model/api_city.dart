class ApiCity {
  final String id;
  final String title;

  ApiCity.fromApi(Map<String, dynamic> map)
      : id = map['\$id'],
        title = map['title'];
}
