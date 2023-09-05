class Teacher {
  final String initials;
  final String institutionId;
  final String titleId;
  final String classroom;
  final String? createdBy;

  Teacher(
      {required this.initials,
      required this.institutionId,
      required this.titleId,
      required this.classroom,
      required this.createdBy});

  String shortInitials() {
    final List<String> i = initials.split(' ');

    return '${i.first} ${i[1][0]}. ${i[2][0]}.';
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'initials': initials,
      'institutionId': institutionId,
      'titleId': titleId,
      'classroom': classroom,
      'createdBy': createdBy
    };
  }

  factory Teacher.fromMap(Map<String, dynamic> map) {
    return Teacher(
        initials: map['initials'] as String,
        institutionId: map['institutionId'] as String,
        titleId: map['titleId'] as String,
        classroom: map['classroom'] as String,
        createdBy: map['createdBy']);
  }
}
