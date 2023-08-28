import 'package:daylist/data/api/model/api_subject.dart';
import 'package:daylist/data/storage/model/storage_subject.dart';
import 'package:daylist/domain/model/subject.dart';

class SubjectMapper {
  static Subject fromApi(ApiSubject subject) {
    return Subject(
        id: subject.id,
        teacherId: subject.teacherId,
        timeId: subject.timeId,
        isEven: subject.isEven,
        groupId: subject.groupId,
        weekday: subject.weekday,
        createdBy: subject.createdBy);
  }

  static Subject fromStorage(StorageSubject subject) {
    return Subject(
        id: subject.id,
        teacherId: subject.teacherId,
        timeId: subject.timeId,
        isEven: subject.isEven,
        groupId: subject.groupId,
        weekday: subject.weekday,
        createdBy: subject.createdBy);
  }
}
