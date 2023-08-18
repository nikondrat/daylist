import 'package:daylist/data/api/api_util.dart';
import 'package:daylist/data/api/request/add/add_city_body.dart';
import 'package:daylist/data/api/request/get/get_cities_body.dart';
import 'package:daylist/data/storage/model/storage_city.dart';
import 'package:daylist/data/storage/storage_util.dart';
import 'package:daylist/domain/model/city.dart';
import 'package:daylist/domain/repository/city_repository.dart';

class CityDataRepository extends CityRepository {
  final ApiUtil _apiUtil;
  final StorageUtil _storageUtil;

  CityDataRepository(this._apiUtil, this._storageUtil);

  @override
  Future<List<City>> getCities({required GetCitiesBody body}) async {
    final List<City> cities = await _storageUtil.getCities();

    if (cities.isEmpty) {
      final List<City> result = await _apiUtil.getCities(body: body);
      final List<StorageCity> convertedList =
          result.map((e) => StorageCity.fromApi(e)).toList();
      _storageUtil.putCities(cities: convertedList);

      return result;
    } else {
      return cities;
    }
  }

  @override
  Future addCity({required AddCityBody body}) async {
    return await _apiUtil.addCity(body: body).then((value) async =>
        await _storageUtil.addCity(
            city: StorageCity(id: body.city.id, title: body.city.title)));
  }
}
