import 'package:daylist/data/api/api_util.dart';
import 'package:daylist/data/api/request/get/get_subjects_body.dart';
import 'package:daylist/data/storage/model/storage_subject.dart';
import 'package:daylist/data/storage/storage_util.dart';
import 'package:daylist/domain/model/subject.dart';
import 'package:daylist/domain/repository/subject_repository.dart';

class SubjectDataRepository extends SubjectRepository {
  final ApiUtil _apiUtil;
  final StorageUtil _storageUtil;

  SubjectDataRepository(this._apiUtil, this._storageUtil);

  @override
  Future<List<Subject>> getSubjects({required GetSubjectsBody body}) async {
    final List<Subject> subjects = await _storageUtil.getSubjects();

    if (subjects.isEmpty) {
      final List<Subject> result = await _apiUtil.getSubjects(body: body);
      final List<StorageSubject> convertedList =
          result.map((e) => StorageSubject.fromApi(e)).toList();
      _storageUtil.putSubjects(subjects: convertedList);

      return result;
    } else {
      return subjects;
    }
  }
}
