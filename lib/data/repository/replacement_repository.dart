import 'package:daylist/data/api/api_util.dart';
import 'package:daylist/data/api/request/add/add_replacement_body.dart';
import 'package:daylist/data/api/request/delete/delete_replacement_body.dart';
import 'package:daylist/data/api/request/get/get_replacements_body.dart';
import 'package:daylist/data/storage/model/storage_replacement.dart';
import 'package:daylist/data/storage/storage_util.dart';
import 'package:daylist/domain/model/replacement.dart';
import 'package:daylist/domain/repository/replacement_repository.dart';
import 'package:connectivity_plus/connectivity_plus.dart';

class ReplacementDataRepository extends ReplacementRepository {
  final ApiUtil _apiUtil;
  final StorageUtil _storageUtil;

  ReplacementDataRepository(this._apiUtil, this._storageUtil);

  @override
  Future<List<Replacement>> getReplacements(
      {required GetReplacementsBody body}) async {
    final ConnectivityResult connectivityResult =
        await Connectivity().checkConnectivity();
    if (connectivityResult == ConnectivityResult.mobile ||
        connectivityResult == ConnectivityResult.wifi) {
      final List<Replacement> result =
          await _apiUtil.getReplacements(body: body);

      return result;
    }
    return [];
  }

  @override
  Future addReplacement({required AddReplacementBody body}) async {
    return await _apiUtil.addReplacement(body: body).then((value) async =>
        await _storageUtil.addReplacement(
            replacement: StorageReplacement(
                id: body.replacement.id,
                teacherId: body.replacement.teacherId,
                groupId: body.replacement.groupId,
                timeId: body.replacement.timeId,
                date: body.replacement.date,
                undergroup: body.replacement.undergroup,
                mode: body.replacement.mode.name,
                createdBy: body.replacement.createdBy)));
  }

  @override
  Future deleteReplacement({required DeleteReplacementBody body}) async {
    return await _apiUtil.deleteReplacement(body: body).then(
        (value) async => await _storageUtil.deleteReplacement(id: body.id));
  }
}
