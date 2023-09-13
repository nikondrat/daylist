import 'package:daylist/domain/model/title.dart';

class AddTitleBody {
  final String databaseId;
  final String collectionId;
  final SubjectTitle title;

  AddTitleBody(
      {required this.databaseId,
      required this.collectionId,
      required this.title});
}
