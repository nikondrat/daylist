import 'package:daylist/data/api/model/api_institution.dart';
import 'package:daylist/data/mapper/city_mapper.dart';
import 'package:daylist/domain/model/institution.dart';

class InstitutionMapper {
  static Institution fromApi(ApiInstitution institution) {
    return Institution(
        id: institution.id,
        title: institution.title,
        shortTitle: institution.shortTitle,
        createdBy: institution.createdBy,
        city: CityMapper.fromApi(institution.city));
  }

  // static Institution fromStorage(StorageInstitution institution) {
  //   return Institution(
  //       id: institution.id,
  //       title: institution.title,
  //       shortTitle: institution.shortTitle,
  //       cityId: institution.cityId);
  // }
}
