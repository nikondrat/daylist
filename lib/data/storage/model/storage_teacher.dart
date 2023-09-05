import 'package:daylist/domain/model/teacher.dart';
import 'package:isar/isar.dart';

part 'storage_teacher.g.dart';

@collection
class StorageTeacher {
  final Id localId = Isar.autoIncrement;
  final String initials;
  final String institutionId;
  final String titleId;
  final String classroom;
  final String? createdBy;

  StorageTeacher(
      {required this.initials,
      required this.institutionId,
      required this.titleId,
      required this.classroom,
      required this.createdBy});

  StorageTeacher.fromApi(Teacher teacher)
      : initials = teacher.initials,
        institutionId = teacher.institutionId,
        titleId = teacher.titleId,
        classroom = teacher.classroom,
        createdBy = teacher.createdBy;
}
