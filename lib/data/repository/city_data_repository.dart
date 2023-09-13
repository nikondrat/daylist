import 'package:daylist/data/api/api_util.dart';
import 'package:daylist/data/api/request/add/add_city_body.dart';
import 'package:daylist/data/api/request/get/get_cities_body.dart';
import 'package:daylist/domain/model/city.dart';
import 'package:daylist/domain/repository/city_repository.dart';

class CityDataRepository extends CityRepository {
  final ApiUtil _apiUtil;

  CityDataRepository(this._apiUtil);

  @override
  Future<List<City>> getCities({required GetCitiesBody body}) async {
    final List<City> result = await _apiUtil.getCities(body: body);

    return result;
  }

  @override
  Future addCity({required AddCityBody body}) async {
    return await _apiUtil.addCity(body: body);
  }
}
