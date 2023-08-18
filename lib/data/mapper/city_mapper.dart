import 'package:daylist/data/api/model/api_city.dart';
import 'package:daylist/data/storage/model/storage_city.dart';
import 'package:daylist/domain/model/city.dart';

class CityMapper {
  static City fromApi(ApiCity city) {
    return City(id: city.id, title: city.title);
  }

  static City fromStorage(StorageCity city) {
    return City(id: city.id, title: city.title);
  }
}
