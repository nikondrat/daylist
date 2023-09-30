import 'package:daylist/data/api/request/add/add_voiting_body.dart';
import 'package:daylist/domain/model/time.dart';

class AddTimeBody {
  final String databaseId;
  final String collectionId;
  final Time time;

  final AddVoitingBody voitingBody;

  AddTimeBody(
      {required this.databaseId,
      required this.collectionId,
      required this.time,
      required this.voitingBody});
}
