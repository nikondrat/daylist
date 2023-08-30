class ApiTeacher {
  final String id;
  final String initials;
  final String institutionId;
  final String titleId;
  final String classroom;
  final String? createdBy;

  ApiTeacher.fromApi(Map<String, dynamic> map)
      : id = map['\$id'],
        initials = map['initials'],
        classroom = map['classroom'],
        institutionId = map['institutionId'],
        titleId = map['titleId'],
        createdBy = map['createdBy'];
}
