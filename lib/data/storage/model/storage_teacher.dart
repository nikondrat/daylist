import 'package:isar/isar.dart';

import 'package:daylist/data/storage/model/storage_classroom.dart';
import 'package:daylist/data/storage/model/storage_title.dart';
import 'package:daylist/domain/model/teacher.dart';
import 'package:daylist/presentation/utils/generator.dart';

part 'storage_teacher.g.dart';

@collection
class StorageTeacher {
  Id get isarId => Generator.fastHash(id);
  String id = '';

  String name = '';
  String surname = '';
  String patronymic = '';

  String institutionId = '';
  IsarLink<StorageTitle> title = IsarLink<StorageTitle>();
  IsarLink<StorageClassroom> classroom = IsarLink<StorageClassroom>();

  StorageTeacher({
    required this.id,
    required this.name,
    required this.surname,
    required this.patronymic,
    required this.institutionId,
  });

  StorageTeacher.fromApi(Teacher teacher) {
    title.value = StorageTitle.fromApi(teacher.title);
    classroom.value = StorageClassroom.fromApi(teacher.classroom);

    id = teacher.id;
    name = teacher.name;
    surname = teacher.surname;
    patronymic = teacher.patronymic;
    institutionId = teacher.institutionId;
  }
}
