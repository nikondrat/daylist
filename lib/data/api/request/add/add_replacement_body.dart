import 'package:daylist/data/api/request/add/add_voiting_body.dart';
import 'package:daylist/domain/model/replacement.dart';

class AddReplacementBody {
  final String databaseId;
  final String collectionId;
  final Replacement replacement;
  final AddVoitingBody voitingBody;

  AddReplacementBody(
      {required this.databaseId,
      required this.collectionId,
      required this.replacement,
      required this.voitingBody});
}
