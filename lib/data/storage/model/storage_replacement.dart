import 'package:daylist/domain/model/replacement.dart';
import 'package:isar/isar.dart';

part 'storage_replacement.g.dart';

@collection
class StorageReplacement {
  final Id localId = Isar.autoIncrement;

  final String teacherId;
  final String groupId;
  final String timeId;
  final String date;
  final String mode;

  StorageReplacement({
    required this.teacherId,
    required this.groupId,
    required this.timeId,
    required this.date,
    required this.mode,
  });

  StorageReplacement.fromApi(Replacement replacement)
      : teacherId = replacement.teacherId,
        groupId = replacement.groupId,
        timeId = replacement.timeId,
        date = replacement.date,
        mode = replacement.mode;
}
