import 'package:daylist/data/api/request/add/add_voiting_body.dart';
import 'package:daylist/domain/model/subject.dart';

class AddSubjectBody {
  final String databaseId;
  final String collectionId;
  final Subject subject;
  final AddVoitingBody voitingBody;

  AddSubjectBody(
      {required this.databaseId,
      required this.collectionId,
      required this.subject,
      required this.voitingBody});
}
