import 'package:daylist/data/api/api_util.dart';
import 'package:daylist/data/api/request/add/add_time_body.dart';
import 'package:daylist/data/api/request/get/get_times_body.dart';
import 'package:daylist/data/storage/model/storage_time.dart';
import 'package:daylist/data/storage/storage_util.dart';
import 'package:daylist/domain/model/time.dart';
import 'package:daylist/domain/repository/time_repository.dart';

class TimeDataRepository extends TimeRepository {
  final ApiUtil _apiUtil;
  final StorageUtil _storageUtil;

  TimeDataRepository(this._apiUtil, this._storageUtil);

  @override
  Future<List<Time>> getTimes({required GetTimesBody body}) async {
    final List<Time> times = await _storageUtil.getTimes();

    if (times.isEmpty) {
      final List<Time> result = await _apiUtil.getTimes(body: body);
      final List<StorageTime> convertedList =
          result.map((e) => StorageTime.fromApi(e)).toList();
      _storageUtil.putTimes(times: convertedList);

      return result;
    } else {
      return times;
    }
  }

  @override
  Future addTime({required AddTimeBody body}) async {
    return await _apiUtil.addTime(body: body).then((value) async =>
        await _storageUtil.addTime(
            time: StorageTime(
                id: body.time.id,
                start: body.time.start,
                end: body.time.end,
                number: body.time.number,
                createdBy: body.time.createdBy)));
  }
}
