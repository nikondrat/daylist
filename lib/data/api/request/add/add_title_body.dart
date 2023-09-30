import 'package:daylist/data/api/request/add/add_voiting_body.dart';
import 'package:daylist/domain/model/title.dart';

class AddTitleBody {
  final String databaseId;
  final String collectionId;
  final SubjectTitle title;

  final AddVoitingBody voitingBody;

  AddTitleBody(
      {required this.databaseId,
      required this.collectionId,
      required this.title,
      required this.voitingBody});
}
