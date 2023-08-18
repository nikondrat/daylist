class ApiReplacement {
  final String teacherId;
  final String groupId;
  final String timeId;
  final String date;
  final String mode;

  ApiReplacement.fromApi(Map<String, dynamic> map)
      : teacherId = map['teacherId'],
        groupId = map['groupId'],
        timeId = map['timeId'],
        date = map['date'],
        mode = map['mode'];
}
