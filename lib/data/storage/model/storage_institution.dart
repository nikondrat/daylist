import 'package:daylist/domain/model/institution.dart';
import 'package:isar/isar.dart';

part 'storage_institution.g.dart';

@collection
class StorageInstitution {
  final Id localId = Isar.autoIncrement;
  final String id;
  final String title;
  final String shortTitle;
  final String cityId;

  StorageInstitution(
      {required this.id,
      required this.title,
      required this.shortTitle,
      required this.cityId});

  StorageInstitution.fromApi(Institution institution)
      : id = institution.id,
        title = institution.title,
        shortTitle = institution.shortTitle,
        cityId = institution.cityId;
}
