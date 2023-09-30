import 'package:daylist/data/api/api_util.dart';
import 'package:daylist/data/api/request/add/add_group_body.dart';
import 'package:daylist/data/api/request/get/get_groups_body.dart';
import 'package:daylist/domain/model/group.dart';
import 'package:daylist/domain/repository/group_repository.dart';

class GroupDataRepository extends GroupRepository {
  final ApiUtil _apiUtil;

  GroupDataRepository(this._apiUtil);

  @override
  Future<List<Group>> getGroups({required GetGroupsBody body}) async {
    final List<Group> result = await _apiUtil.getGroups(body: body);

    return result;
  }

  @override
  Future addGroup({required AddGroupBody body}) async {
    return await _apiUtil.addGroup(body: body);
  }

  // @override
  // Future<City?> getCity({required GetCityBody body}) {
  //   return _apiUtil.getCity(body: body);
  // }

  // @override
  // Future<List<City>> getCities({required GetCitiesBody body}) async {
  //   final List<City> cities = await _storageUtil.getCities();

  //   if (cities.isEmpty) {
  //     final List<City> result = await _apiUtil.getCities(body: body);
  //     final List<StorageCity> convertedList =
  //         result.map((e) => StorageCity.fromApi(e)).toList();
  //     _storageUtil.putCities(cities: convertedList);

  //     return result;
  //   } else {
  //     return cities;
  //   }
  // }
}
