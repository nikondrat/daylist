import 'package:daylist/data/api/model/api_teacher.dart';
import 'package:daylist/data/mapper/classroom_mapper.dart';
import 'package:daylist/data/mapper/title_mapper.dart';
import 'package:daylist/data/storage/model/storage_teacher.dart';
import 'package:daylist/domain/model/teacher.dart';

class TeacherMapper {
  static Teacher fromApi(ApiTeacher teacher) {
    return Teacher(
        id: teacher.id,
        name: teacher.name,
        surname: teacher.surname,
        patronymic: teacher.patronymic,
        institutionId: teacher.institutionId,
        title: TitleMapper.fromApi(teacher.title),
        classroom: ClassroomMapper.fromApi(teacher.classroom));
  }

  static Teacher fromStorage(StorageTeacher teacher) {
    return Teacher(
        id: teacher.id,
        name: teacher.name,
        surname: teacher.surname,
        patronymic: teacher.patronymic,
        institutionId: teacher.institutionId,
        title: TitleMapper.fromStorage(teacher.title.value!),
        classroom: ClassroomMapper.fromStorage(teacher.classroom.value!));
  }
}
