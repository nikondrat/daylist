import 'package:daylist/data/api/request/add/add_institution_body.dart';
import 'package:daylist/data/api/request/get/get_institutions_body.dart';
import 'package:daylist/domain/model/institution.dart';

abstract class InstitutionRepository {
  Future<List<Institution>> getInstitutions(
      {required GetInstitutionsBody body});
  Future addInstitution({required AddInstitutionBody body});
}
