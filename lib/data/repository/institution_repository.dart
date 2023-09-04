import 'package:daylist/data/api/api_util.dart';
import 'package:daylist/data/api/request/add/add_institution_body.dart';
import 'package:daylist/data/api/request/get/get_institutions_body.dart';
import 'package:daylist/data/storage/model/storage_institution.dart';
import 'package:daylist/data/storage/storage_util.dart';
import 'package:daylist/domain/model/institution.dart';
import 'package:daylist/domain/repository/institution_repository.dart';

class InstitutionDataRepository extends InstitutionRepository {
  final ApiUtil _apiUtil;
  final StorageUtil _storageUtil;

  InstitutionDataRepository(
    this._apiUtil,
    this._storageUtil,
  );

  @override
  Future<List<Institution>> getInstitutions(
      {required GetInstitutionsBody body}) async {
    // final List<Institution> institutions = await _storageUtil.getInstitutions();

    // if (institutions.isEmpty) {
    final List<Institution> result = await _apiUtil.getInstitutions(body: body);
    final List<StorageInstitution> convertedList =
        result.map((e) => StorageInstitution.fromApi(e)).toList();
    _storageUtil.putInstitutions(institutions: convertedList);

    return result;
    // } else {
    //   return institutions;
    // }
  }

  @override
  Future addInstitution({required AddInstitutionBody body}) async {
    return await _apiUtil.addInstitution(body: body).then((value) async =>
        await _storageUtil.addInstitution(
            institution: StorageInstitution(
                id: body.institution.id,
                title: body.institution.title,
                shortTitle: body.institution.shortTitle,
                cityId: body.institution.cityId)));
  }
}
