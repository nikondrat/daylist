// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:daylist/presentation/utils/generator.dart';
import 'package:isar/isar.dart';

import 'package:daylist/data/storage/model/storage_title.dart';
import 'package:daylist/domain/model/teacher.dart';

part 'storage_teacher.g.dart';

@collection
class StorageTeacher {
  Id get isarId => Generator.fastHash(id);
  String id = '';
  String initials = '';
  String institutionId = '';
  IsarLink<StorageTitle> title = IsarLink<StorageTitle>();
  String classroom = '';
  String? createdBy;

  StorageTeacher({
    required this.id,
    required this.initials,
    required this.institutionId,
    required this.classroom,
    required this.createdBy,
  });

  StorageTeacher.fromApi(Teacher teacher) {
    title.value = StorageTitle.fromApi(teacher.title);

    id = teacher.id;
    initials = teacher.initials;
    institutionId = teacher.institutionId;
    classroom = teacher.classroom;
    createdBy = teacher.createdBy;
  }
}
