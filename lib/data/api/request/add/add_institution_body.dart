import 'package:daylist/domain/model/institution.dart';

class AddInstitutionBody {
  final String databaseId;
  final String collectionId;
  final Institution institution;

  AddInstitutionBody(
      {required this.databaseId,
      required this.collectionId,
      required this.institution});
}
