import 'package:daylist/domain/model/institution.dart';

class Group {
  final String id;
  final String title;
  final Institution institution;
  final String? createdBy;

  Group(
      {required this.id,
      required this.title,
      required this.institution,
      this.createdBy});

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'title': title,
      'institution': institution.toMap(),
      'userId': createdBy
    };
  }

  factory Group.fromMap(Map<String, dynamic> map) {
    return Group(
      id: map['id'] as String,
      title: map['title'] as String,
      institution: Institution.fromMap(map['institution']),
    );
  }
}
