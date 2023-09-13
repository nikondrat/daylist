import 'package:daylist/data/api/request/add/add_time_body.dart';
import 'package:daylist/data/api/request/get/get_times_body.dart';
import 'package:daylist/domain/model/time.dart';

abstract class TimeRepository {
  Future<List<Time>?> getTimes({required GetTimesBody body});

  Future addTime({required AddTimeBody body});
}
