import 'package:daylist/domain/model/title.dart';

class GetTeachersBody {
  final String databaseId;
  final String collectionId;
  final String institutionId;
  final SubjectTitle? title;

  GetTeachersBody(
      {required this.databaseId,
      required this.collectionId,
      required this.institutionId,
      required this.title});
}
