import 'package:daylist/data/api/model/api_teacher.dart';
import 'package:daylist/data/mapper/title_mapper.dart';
import 'package:daylist/domain/model/teacher.dart';

class TeacherMapper {
  static Teacher fromApi(ApiTeacher teacher) {
    return Teacher(
        id: teacher.id,
        initials: teacher.initials,
        institutionId: teacher.institutionId,
        title: TitleMapper.fromApi(teacher.title),
        classroom: teacher.classroom,
        createdBy: teacher.createdBy);
  }

  // static Teacher fromStorage(StorageTeacher teacher) {
  //   return Teacher(
  //       id: teacher.id,
  //       initials: teacher.initials,
  //       institutionId: teacher.institutionId,
  //       title: TitleMapper.fromStorage(teacher.title.value!),
  //       classroom: teacher.classroom,
  //       createdBy: teacher.createdBy);
  // }
}
