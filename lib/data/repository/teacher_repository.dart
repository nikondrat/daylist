import 'package:daylist/data/api/api_util.dart';
import 'package:daylist/data/api/request/add/add_teacher_body.dart';
import 'package:daylist/data/api/request/get/get_teachers_body.dart';
import 'package:daylist/data/storage/model/storage_teacher.dart';
import 'package:daylist/data/storage/storage_util.dart';
import 'package:daylist/domain/model/teacher.dart';
import 'package:daylist/domain/repository/teacher_repository.dart';

class TeacherDataRepository extends TeacherRepository {
  final ApiUtil _apiUtil;
  final StorageUtil _storageUtil;

  TeacherDataRepository(this._apiUtil, this._storageUtil);

  @override
  Future<List<Teacher>> getTeachers({required GetTeachersBody body}) async {
    final List<Teacher> teachers = await _storageUtil.getTeachers();

    if (teachers.isEmpty) {
      final List<Teacher> result = await _apiUtil.getTeachers(body: body);
      final List<StorageTeacher> convertedList =
          result.map((e) => StorageTeacher.fromApi(e)).toList();
      _storageUtil.putTeachers(teachers: convertedList);

      return result;
    } else {
      return teachers;
    }
  }

  @override
  Future addTeacher({required AddTecherBody body}) async {
    return await _apiUtil.addTeacher(body: body).then((value) async =>
        await _storageUtil.addTeacher(
            teacher: StorageTeacher(
                initials: body.teacher.initials,
                institutionId: body.teacher.institutionId,
                titleId: body.teacher.titleId,
                classroom: body.teacher.classroom,
                createdBy: body.teacher.createdBy)));
  }
}
