import 'package:daylist/domain/model/classroom.dart';
import 'package:daylist/presentation/utils/generator.dart';
import 'package:isar/isar.dart';

part 'storage_classroom.g.dart';

@collection
class StorageClassroom {
  Id get isarId => Generator.fastHash(id);
  final String id;
  final String title;

  StorageClassroom({
    required this.id,
    required this.title,
  });

  StorageClassroom.fromApi(Classroom classroom)
      : id = classroom.id,
        title = classroom.title;
}
