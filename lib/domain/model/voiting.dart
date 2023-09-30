// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:daylist/domain/model/classroom.dart';
import 'package:daylist/domain/model/replacement.dart';
import 'package:daylist/domain/model/subject.dart';
import 'package:daylist/domain/model/teacher.dart';
import 'package:daylist/domain/model/time.dart';
import 'package:daylist/domain/model/title.dart';

enum VoitingType { post, put, delete }

class Voiting {
  final String id;

  final VoitingType type;
  final List pros;
  final List cons;

  final Time? time;
  final SubjectTitle? title;
  final Teacher? teacher;
  final Subject? subject;
  final Classroom? classroom;
  final Replacement? replacement;

  Voiting({
    required this.id,
    required this.type,
    required this.pros,
    required this.cons,
    required this.time,
    required this.title,
    required this.teacher,
    required this.subject,
    required this.classroom,
    required this.replacement,
  });
}
