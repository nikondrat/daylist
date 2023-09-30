import 'package:daylist/domain/model/classroom.dart';
import 'package:daylist/domain/model/title.dart';

class Teacher {
  final String id;

  final String name;
  final String surname;
  final String patronymic;

  final String institutionId;
  final SubjectTitle title;
  final Classroom classroom;

  Teacher({
    required this.id,
    required this.name,
    required this.surname,
    required this.patronymic,
    required this.institutionId,
    required this.title,
    required this.classroom,
  });

  String shortInitials() {
    return '$name ${surname[0]}. ${patronymic[0]}.';
  }

  String initials() => '$name $surname $patronymic';
}
