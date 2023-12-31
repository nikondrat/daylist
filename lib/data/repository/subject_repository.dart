import 'package:daylist/data/api/api_util.dart';
import 'package:daylist/data/api/request/add/add_subject_body.dart';
import 'package:daylist/data/api/request/get/get_subjects_body.dart';
import 'package:daylist/data/api/request/put/put_subject_body.dart';
import 'package:daylist/domain/model/subject.dart';
import 'package:daylist/domain/repository/subject_repository.dart';

class SubjectDataRepository extends SubjectRepository {
  final ApiUtil _apiUtil;
  // final StorageUtil _storageUtil;

  SubjectDataRepository(this._apiUtil
      // , this._storageUtil
      );

  @override
  Future<List<Subject>> getSubjects({required GetSubjectsBody body}) async {
    // final List<Subject> subjects = await _storageUtil.getSubjects();

    // if (body.isDataFromStorage && subjects.isNotEmpty) {
    //   return subjects;
    // } else {
    final List<Subject> result = await _apiUtil.getSubjects(body: body);
    // final List<StorageSubject> convertedList =
    //     result.map((e) => StorageSubject.fromApi(e)).toList();

    // _storageUtil.putSubjects(subjects: convertedList);

    return result;
    // }
  }

  @override
  Future addSubject({required AddSubjectBody body}) async {
    return await _apiUtil.addSubject(body: body);
    // .then((value) async =>
    //     await _storageUtil.addSubject(
    //         subject: StorageSubject.fromApi(body.subject)));
  }

  @override
  Future putSubject({required PutSubjectBody body}) async {
    return null;
    // return await _storageUtil.putSubject(
    //     teacher: StorageTeacher.fromApi(body.teacher),
    //     time: StorageTime.fromApi(body.time),
    //     title: StorageTitle.fromApi(body.title));
  }

  @override
  Future clear() async {
    // return await _storageUtil.clearSubjects();
  }
}
