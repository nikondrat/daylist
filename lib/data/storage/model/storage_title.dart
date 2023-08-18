import 'package:daylist/domain/model/title.dart';
import 'package:isar/isar.dart';

part 'storage_title.g.dart';

@collection
class StorageTitle {
  final Id localId = Isar.autoIncrement;
  final String id;
  final String title;

  StorageTitle({
    required this.id,
    required this.title,
  });

  StorageTitle.fromApi(SubjectTitle title)
      : id = title.id,
        title = title.title;
}
