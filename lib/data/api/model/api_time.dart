class ApiTime {
  final String id;
  final String start;
  final String end;
  final int number;
  final String? createdBy;

  ApiTime.fromApi(Map<String, dynamic> map)
      : id = map['\$id'],
        start = map['start'],
        end = map['end'],
        number = map['number'],
        createdBy = map['createdBy'];
}
