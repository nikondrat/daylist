import 'package:daylist/data/api/model/api_teacher.dart';
import 'package:daylist/data/storage/model/storage_teacher.dart';
import 'package:daylist/domain/model/teacher.dart';

class TeacherMapper {
  static Teacher fromApi(ApiTeacher teacher) {
    return Teacher(
        // id: teacher.id,
        initials: teacher.initials,
        institutionId: teacher.institutionId,
        titleId: teacher.titleId,
        classroom: teacher.classroom,
        createdBy: teacher.createdBy);
  }

  static Teacher fromStorage(StorageTeacher teacher) {
    return Teacher(
        // id: teacher.id,
        initials: teacher.initials,
        institutionId: teacher.institutionId,
        titleId: teacher.titleId,
        classroom: teacher.classroom,
        createdBy: teacher.createdBy);
  }
}
