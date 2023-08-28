class ApiSubject {
  final String id;
  final String teacherId;
  final String timeId;
  final String groupId;
  final bool? isEven;
  final int weekday;
  final String? createdBy;

  ApiSubject.fromApi(Map<String, dynamic> map)
      : id = map['\$id'],
        teacherId = map['teacherId'],
        timeId = map['timeId'],
        groupId = map['groupId'],
        isEven = map['isEven'],
        weekday = map['weekday'],
        createdBy = map['createdBy'];
}
