import 'package:daylist/domain/model/teacher.dart';

class AddTecherBody {
  final String databaseId;
  final String collectionId;
  final String documentId;
  final Teacher teacher;

  AddTecherBody(
      {required this.databaseId,
      required this.collectionId,
      required this.documentId,
      required this.teacher});
}
