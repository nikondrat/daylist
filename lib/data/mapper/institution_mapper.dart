import 'package:daylist/data/api/model/api_institution.dart';
import 'package:daylist/domain/model/institution.dart';

class InstitutionMapper {
  static Institution fromApi(ApiInstitution institution) {
    return Institution(
        id: institution.id,
        title: institution.title,
        shortTitle: institution.shortTitle,
        createdBy: institution.createdBy,
        cityId: institution.cityId);
  }

  // static Institution fromStorage(StorageInstitution institution) {
  //   return Institution(
  //       id: institution.id,
  //       title: institution.title,
  //       shortTitle: institution.shortTitle,
  //       cityId: institution.cityId);
  // }
}
