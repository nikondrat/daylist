import 'package:daylist/domain/model/replacement.dart';
import 'package:daylist/domain/model/teacher.dart';

class AddReplacementBody {
  final String databaseId;
  final String collectionId;
  final Replacement replacement;

  AddReplacementBody(
      {required this.databaseId,
      required this.collectionId,
      required this.replacement});
}
