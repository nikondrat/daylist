class Teacher {
  final String id;
  final String initials;
  final String institutionId;
  final String titleId;
  final int classroom;

  Teacher(
      {required this.id,
      required this.initials,
      required this.institutionId,
      required this.titleId,
      required this.classroom});

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'documentId': id,
      'initials': initials,
      'institutionId': institutionId,
      'titleId': titleId,
      'classroom': classroom
    };
  }

  factory Teacher.fromMap(Map<String, dynamic> map) {
    return Teacher(
        id: map['documentId'] as String,
        initials: map['initials'] as String,
        institutionId: map['institutionId'] as String,
        titleId: map['titleId'] as String,
        classroom: map['classroom'] as int);
  }
}
