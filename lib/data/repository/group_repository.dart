import 'package:daylist/data/api/api_util.dart';
import 'package:daylist/data/api/request/add/add_group_body.dart';
import 'package:daylist/data/api/request/get/get_groups_body.dart';
import 'package:daylist/data/storage/model/storage_group.dart';
import 'package:daylist/data/storage/storage_util.dart';
import 'package:daylist/domain/model/group.dart';
import 'package:daylist/domain/repository/group_repository.dart';

class GroupDataRepository extends GroupRepository {
  final ApiUtil _apiUtil;
  final StorageUtil _storageUtil;

  GroupDataRepository(this._apiUtil, this._storageUtil);

  @override
  Future<List<Group>> getGroups({required GetGroupsBody body}) async {
    final List<Group> groups = await _storageUtil.getGroups();

    if (groups.isEmpty) {
      final List<Group> result = await _apiUtil.getGroups(body: body);
      final List<StorageGroup> convertedList =
          result.map((e) => StorageGroup.fromApi(e)).toList();
      _storageUtil.putGroups(groups: convertedList);

      return result;
    } else {
      return groups;
    }
  }

  @override
  Future addGroup({required AddGroupBody body}) async {
    return await _apiUtil.addGroup(body: body).then((value) async =>
        await _storageUtil.addGroup(
            group: StorageGroup(
                id: body.group.id,
                title: body.group.title,
                institutionId: body.group.institutionId)));
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
