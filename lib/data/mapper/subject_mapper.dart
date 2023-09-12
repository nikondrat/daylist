import 'package:daylist/data/api/model/api_subject.dart';
import 'package:daylist/data/mapper/teacher_mapper.dart';
import 'package:daylist/data/mapper/time_mapper.dart';
import 'package:daylist/data/storage/model/storage_subject.dart';
import 'package:daylist/domain/model/subject.dart';
import 'package:daylist/domain/model/teacher.dart';
import 'package:daylist/domain/model/time.dart';
import 'package:daylist/domain/model/title.dart';

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

  static Subject fromStorage(StorageSubject subject) {
    return Subject(
        id: subject.id,
        teacher: subject.teacher.value != null
            ? TeacherMapper.fromStorage(subject.teacher.value!)
            : Teacher(
                id: '',
                initials: '',
                institutionId: '',
                title: SubjectTitle(id: '', title: '', createdBy: ''),
                classroom: '',
                createdBy: ''),
        time: subject.time.value != null
            ? TimeMapper.fromStorage(subject.time.value!)
            : Time(id: '', start: '', end: '', number: 1, createdBy: ''),
        isEven: subject.isEven,
        groupId: subject.groupId,
        weekday: subject.weekday,
        createdBy: subject.createdBy);
  }
}
