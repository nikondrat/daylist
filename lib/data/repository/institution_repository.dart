import 'package:daylist/data/api/api_util.dart';
import 'package:daylist/data/api/request/add/add_institution_body.dart';
import 'package:daylist/data/api/request/get/get_institutions_body.dart';
import 'package:daylist/domain/model/institution.dart';
import 'package:daylist/domain/repository/institution_repository.dart';

class InstitutionDataRepository extends InstitutionRepository {
  final ApiUtil _apiUtil;

  InstitutionDataRepository(
    this._apiUtil,
  );

  @override
  Future<List<Institution>> getInstitutions(
      {required GetInstitutionsBody body}) async {
    final List<Institution> result = await _apiUtil.getInstitutions(body: body);
    return result;
  }

  @override
  Future addInstitution({required AddInstitutionBody body}) async {
    return await _apiUtil.addInstitution(body: body);
  }
}
