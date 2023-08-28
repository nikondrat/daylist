import 'package:daylist/domain/model/subject.dart';

class AddSubjectBody {
  final String databaseId;
  final String collectionId;
  final Subject subject;

  AddSubjectBody(
      {required this.databaseId,
      required this.collectionId,
      required this.subject});
}
