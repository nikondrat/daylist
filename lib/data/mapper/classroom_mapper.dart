import 'package:daylist/data/api/model/api_classroom.dart';
import 'package:daylist/data/storage/model/storage_classroom.dart';
import 'package:daylist/domain/model/classroom.dart';

class ClassroomMapper {
  static Classroom fromApi(ApiClassroom classroom) {
    return Classroom(id: classroom.id, title: classroom.title);
  }

  static Classroom fromStorage(StorageClassroom classroom) {
    return Classroom(id: classroom.id, title: classroom.title);
  }
}
