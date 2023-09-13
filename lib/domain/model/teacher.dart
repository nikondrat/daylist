import 'package:daylist/domain/model/title.dart';

class Teacher {
  final String id;
  final String initials;
  final String institutionId;
  final SubjectTitle title;
  final String classroom;
  final String? createdBy;

  Teacher(
      {required this.id,
      required this.initials,
      required this.institutionId,
      required this.title,
      required this.classroom,
      required this.createdBy});

  String shortInitials() {
    final List<String> i = initials.split(' ');

    return '${i.first} ${i[1][0]}. ${i[2][0]}.';
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'initials': initials,
      'institutionId': institutionId,
      'title': title.toMap(),
      'classroom': classroom,
      'createdBy': createdBy
    };
  }

  factory Teacher.fromMap(Map<String, dynamic> map) {
    return Teacher(
        id: map['id'],
        initials: map['initials'] as String,
        institutionId: map['institutionId'] as String,
        title: SubjectTitle.fromMap(map['title']),
        classroom: map['classroom'] as String,
        createdBy: map['createdBy']);
  }
}
