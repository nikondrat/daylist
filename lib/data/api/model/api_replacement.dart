class ApiReplacement {
  final String id;
  final String teacherId;
  final String groupId;
  final String timeId;
  final String date;
  final String mode;
  final int? undergroup;
  final String? createdBy;

  ApiReplacement.fromApi(Map<String, dynamic> map)
      : id = map['\$id'],
        teacherId = map['teacherId'],
        groupId = map['groupId'],
        timeId = map['timeId'],
        date = map['date'],
        mode = map['mode'],
        undergroup = map['undergroup'],
        createdBy = map['createdBy'];
}
