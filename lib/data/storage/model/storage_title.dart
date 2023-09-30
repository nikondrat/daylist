import 'package:daylist/domain/model/title.dart';
import 'package:daylist/presentation/utils/generator.dart';
import 'package:isar/isar.dart';

part 'storage_title.g.dart';

@collection
class StorageTitle {
  Id get isarId => Generator.fastHash(id);
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
