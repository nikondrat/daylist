import 'package:daylist/domain/model/teacher.dart';

class AddTecherBody {
  final String databaseId;
  final String collectionId;
  final Teacher teacher;

  AddTecherBody(
      {required this.databaseId,
      required this.collectionId,
      required this.teacher});
}
