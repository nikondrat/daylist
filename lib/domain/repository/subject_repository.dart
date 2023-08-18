import 'package:daylist/data/api/request/get/get_subjects_body.dart';
import 'package:daylist/domain/model/subject.dart';

abstract class SubjectRepository {
  Future<List<Subject>?> getSubjects({required GetSubjectsBody body});
}
