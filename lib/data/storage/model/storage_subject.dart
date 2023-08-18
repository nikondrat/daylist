import 'package:daylist/domain/model/subject.dart';
import 'package:isar/isar.dart';

part 'storage_subject.g.dart';

@collection
class StorageSubject {
  final Id localId = Isar.autoIncrement;

  final String id;
  final String teacherId;
  final String timeId;
  final String groupId;
  final bool? isEven;
  final int weekday;
  StorageSubject({
    required this.id,
    required this.teacherId,
    required this.timeId,
    required this.groupId,
    this.isEven,
    required this.weekday,
  });

  StorageSubject.fromApi(Subject subject)
      : id = subject.id,
        teacherId = subject.teacherId,
        timeId = subject.timeId,
        groupId = subject.groupId,
        isEven = subject.isEven,
        weekday = subject.weekday;
}
