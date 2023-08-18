import 'package:daylist/domain/model/city.dart';
import 'package:isar/isar.dart';

part 'storage_city.g.dart';

@collection
class StorageCity {
  final Id localId = Isar.autoIncrement;
  final String id;
  final String title;

  StorageCity({
    required this.id,
    required this.title,
  });

  StorageCity.fromApi(City city)
      : id = city.id,
        title = city.title;
}
