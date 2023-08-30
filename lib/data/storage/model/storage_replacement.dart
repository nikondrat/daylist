import 'package:daylist/domain/model/replacement.dart';
import 'package:daylist/presentation/utils/generator.dart';
import 'package:isar/isar.dart';

part 'storage_replacement.g.dart';

@collection
class StorageReplacement {
  Id get isarId => Generator.fastHash(id);

  final String id;
  final String teacherId;
  final String groupId;
  final String timeId;
  final String date;
  final String mode;
  final int? undergroup;
  final String? createdBy;

  StorageReplacement(
      {required this.id,
      required this.teacherId,
      required this.groupId,
      required this.timeId,
      required this.date,
      required this.mode,
      required this.undergroup,
      required this.createdBy});

  StorageReplacement.fromApi(Replacement replacement)
      : id = replacement.id,
        teacherId = replacement.teacherId,
        groupId = replacement.groupId,
        timeId = replacement.timeId,
        undergroup = replacement.undergroup,
        date = replacement.date,
        mode = replacement.mode.name,
        createdBy = replacement.createdBy;
}
