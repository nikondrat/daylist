import 'package:daylist/data/api/model/api_time.dart';
import 'package:daylist/data/storage/model/storage_time.dart';
import 'package:daylist/domain/model/time.dart';

class TimeMapper {
  static Time fromApi(ApiTime time) {
    return Time(
        start: time.start,
        end: time.end,
        number: time.number,
        createdBy: time.createdBy);
  }

  static Time fromStorage(StorageTime time) {
    return Time(
        start: time.start,
        end: time.end,
        number: time.number,
        createdBy: time.createdBy);
  }
}
