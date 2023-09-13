import 'package:daylist/data/api/model/api_subject.dart';
import 'package:daylist/data/mapper/teacher_mapper.dart';
import 'package:daylist/data/mapper/time_mapper.dart';
import 'package:daylist/domain/model/subject.dart';

class SubjectMapper {
  static Subject fromApi(ApiSubject subject) {
    return Subject(
        id: subject.id,
        teacher: TeacherMapper.fromApi(subject.teacher),
        time: TimeMapper.fromApi(subject.time),
        isEven: subject.isEven,
        groupId: subject.groupId,
        weekday: subject.weekday,
        createdBy: subject.createdBy);
  }

  // static Subject fromStorage(StorageSubject subject) {
  //   return Subject(
  //       id: subject.id,
  //       teacher: TeacherMapper.fromStorage(subject.teacher.value!),
  //       time: TimeMapper.fromStorage(subject.time.value!),
  //       isEven: subject.isEven,
  //       groupId: subject.groupId,
  //       weekday: subject.weekday,
  //       createdBy: subject.createdBy);
  // }
}
