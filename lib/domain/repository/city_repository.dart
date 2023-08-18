import 'package:daylist/data/api/request/add/add_city_body.dart';
import 'package:daylist/data/api/request/get/get_cities_body.dart';
import 'package:daylist/domain/model/city.dart';

abstract class CityRepository {
  Future<List<City>?> getCities({required GetCitiesBody body});
  Future addCity({required AddCityBody body});
}
