import 'package:daylist/data/api/request/add/add_classroom_body.dart';
import 'package:daylist/data/api/request/get/get_classroom_body.dart';
import 'package:daylist/domain/model/classroom.dart';

abstract class ClassroomRepository {
  Future<List<Classroom>?> getClassrooms({required GetClassroomsBody body});
  Future addClassroom({required AddClassroomBody body});
}
