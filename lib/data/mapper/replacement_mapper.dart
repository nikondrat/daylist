import 'package:daylist/data/api/model/api_replacement.dart';
import 'package:daylist/data/storage/model/storage_replacement.dart';
import 'package:daylist/domain/model/replacement.dart';

class ReplacementMapper {
  static Replacement fromApi(ApiReplacement replacement) {
    return Replacement(
        teacherId: replacement.teacherId,
        groupId: replacement.groupId,
        timeId: replacement.timeId,
        date: replacement.date,
        mode: ReplacementMode.values
            .firstWhere((e) => e.name == replacement.mode));
  }

  static Replacement fromStorage(StorageReplacement replacement) {
    return Replacement(
        teacherId: replacement.teacherId,
        groupId: replacement.groupId,
        timeId: replacement.timeId,
        date: replacement.date,
        mode: ReplacementMode.values
            .firstWhere((e) => e.name == replacement.mode));
  }
}
