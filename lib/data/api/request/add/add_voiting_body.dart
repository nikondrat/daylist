// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:daylist/domain/model/classroom.dart';
import 'package:daylist/domain/model/replacement.dart';
import 'package:daylist/domain/model/subject.dart';
import 'package:daylist/domain/model/teacher.dart';
import 'package:daylist/domain/model/time.dart';
import 'package:daylist/domain/model/title.dart';
import 'package:daylist/domain/model/voiting.dart';

class AddVoitingBody {
  final String databaseId;
  final String collectionId;
  final String groupId;

  final VoitingType? type;

  final Classroom? classroom;
  final Replacement? replacement;
  final Subject? subject;
  final Teacher? teacher;
  final SubjectTitle? title;
  final Time? time;

  AddVoitingBody(
      {required this.databaseId,
      required this.collectionId,
      required this.groupId,
      this.classroom,
      this.replacement,
      this.subject,
      this.teacher,
      this.time,
      this.title,
      this.type});

  AddVoitingBody copyWith({final VoitingType? type}) {
    return AddVoitingBody(
        type: type,
        databaseId: databaseId,
        collectionId: collectionId,
        groupId: groupId,
        classroom: classroom,
        replacement: replacement,
        title: title,
        subject: subject,
        teacher: teacher,
        time: time);
  }
}
