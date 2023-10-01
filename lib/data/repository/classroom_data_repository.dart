import 'package:daylist/data/api/api_util.dart';
import 'package:daylist/data/api/request/add/add_classroom_body.dart';
import 'package:daylist/data/api/request/get/get_classroom_body.dart';
import 'package:daylist/data/storage/model/storage_classroom.dart';
import 'package:daylist/data/storage/storage_util.dart';
import 'package:daylist/domain/model/classroom.dart';
import 'package:daylist/domain/repository/classroom_repository.dart';

class ClassroomDataRepository extends ClassroomRepository {
  final ApiUtil _apiUtil;
  final StorageUtil _storageUtil;

  ClassroomDataRepository(this._apiUtil, this._storageUtil);

  @override
  Future<List<Classroom>> getClassrooms(
      {required GetClassroomsBody body}) async {
    final List<Classroom> classrooms = await _storageUtil.getClassrooms();

    if (classrooms.isEmpty) {
      final List<Classroom> result = await _apiUtil.getClassrooms(body: body);
      final List<StorageClassroom> convertedList =
          result.map((e) => StorageClassroom.fromApi(e)).toList();
      _storageUtil.putClassrooms(classrooms: convertedList);

      return result;
    } else {
      return classrooms;
    }
  }

  @override
  Future addClassroom({required AddClassroomBody body}) async {
    return await _apiUtil.addClassroom(body: body);
    // .then(
    //     (value) => VoitingDataRepository(_apiUtil).add(body: body.voitingBody));
  }
}
