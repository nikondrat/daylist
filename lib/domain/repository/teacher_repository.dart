import 'package:daylist/data/api/request/add/add_teacher_body.dart';
import 'package:daylist/data/api/request/get/get_teachers_body.dart';
import 'package:daylist/domain/model/teacher.dart';

abstract class TeacherRepository {
  Future<List<Teacher>?> getTeachers({required GetTeachersBody body});

  Future addTeacher({required AddTecherBody body});
}
