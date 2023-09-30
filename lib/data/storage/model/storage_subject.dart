import 'package:isar/isar.dart';

import 'package:daylist/data/storage/model/storage_teacher.dart';
import 'package:daylist/data/storage/model/storage_time.dart';
import 'package:daylist/domain/model/subject.dart';
import 'package:daylist/presentation/utils/generator.dart';

part 'storage_subject.g.dart';

@collection
class StorageSubject {
  Id get isarId => Generator.fastHash(id);

  String id = '';
  IsarLink<StorageTeacher> teacher = IsarLink<StorageTeacher>();
  IsarLink<StorageTime> time = IsarLink<StorageTime>();
  String groupId = '';
  List<bool> showInWeek = [];
  int weekday = 1;

  StorageSubject({
    required this.id,
    required this.groupId,
    required this.showInWeek,
    required this.weekday,
  });

  StorageSubject.fromApi(Subject subject) {
    teacher.value = StorageTeacher.fromApi(subject.teacher);
    time.value = StorageTime.fromApi(subject.time);

    id = subject.id;
    groupId = subject.groupId;
    showInWeek = subject.showInWeek;
    weekday = subject.weekday;
  }
}
