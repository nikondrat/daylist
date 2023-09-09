import 'package:daylist/domain/model/time.dart';
import 'package:isar/isar.dart';

part 'storage_time.g.dart';

@collection
class StorageTime {
  final Id localId = Isar.autoIncrement;
  final String id;
  final String start;
  final String end;
  final int number;
  final String? createdBy;

  StorageTime(
      {required this.id,
      required this.start,
      required this.end,
      required this.number,
      required this.createdBy});

  StorageTime.fromApi(Time time)
      : id = time.id,
        start = time.start,
        end = time.end,
        number = time.number,
        createdBy = time.createdBy;
}
