import 'package:daylist/data/api/request/add/add_voiting_body.dart';
import 'package:daylist/domain/model/classroom.dart';

class AddClassroomBody {
  final String databaseId;
  final String collectionId;
  final Classroom classroom;

  final AddVoitingBody voitingBody;

  AddClassroomBody(
      {required this.databaseId,
      required this.collectionId,
      required this.classroom,
      required this.voitingBody});
}
