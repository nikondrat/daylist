import 'package:daylist/domain/model/group.dart';
import 'package:isar/isar.dart';

part 'storage_group.g.dart';

@collection
class StorageGroup {
  final Id localId = Isar.autoIncrement;
  final String id;
  final String title;
  final String institutionId;

  StorageGroup(
      {required this.id, required this.title, required this.institutionId});

  StorageGroup.fromApi(Group group)
      : id = group.id,
        title = group.title,
        institutionId = group.institutionId;
}
