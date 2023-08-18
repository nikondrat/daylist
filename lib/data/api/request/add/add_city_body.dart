import 'package:daylist/domain/model/city.dart';

class AddCityBody {
  final String databaseId;
  final String collectionId;
  final City city;

  AddCityBody(
      {required this.databaseId,
      required this.collectionId,
      required this.city});
}
