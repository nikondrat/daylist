import 'package:daylist/domain/model/subject.dart';
import 'package:daylist/domain/model/teacher.dart';
import 'package:daylist/domain/model/time.dart';
import 'package:daylist/domain/model/title.dart';

class PutSubjectBody {
  final Teacher teacher;
  final Time time;
  final Subject? subject;
  final SubjectTitle title;

  PutSubjectBody(
      {required this.teacher,
      required this.time,
      required this.title,
      required this.subject});
}
