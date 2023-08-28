import 'package:daylist/domain/model/time.dart';

class AddTimeBody {
  final String databaseId;
  final String collectionId;
  final Time time;

  AddTimeBody(
      {required this.databaseId,
      required this.collectionId,
      required this.time});
}
