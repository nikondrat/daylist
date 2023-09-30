import 'package:daylist/data/api/request/add/add_voiting_body.dart';
import 'package:daylist/domain/model/teacher.dart';

class AddTecherBody {
  final String databaseId;
  final String collectionId;
  final Teacher teacher;
  final AddVoitingBody voitingBody;

  AddTecherBody(
      {required this.databaseId,
      required this.collectionId,
      required this.teacher,
      required this.voitingBody});
}
