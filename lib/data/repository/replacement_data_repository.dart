import 'package:daylist/data/api/api_util.dart';
import 'package:daylist/data/api/request/add/add_replacement_body.dart';
import 'package:daylist/data/api/request/delete/delete_replacement_body.dart';
import 'package:daylist/data/api/request/get/get_replacements_body.dart';
import 'package:daylist/domain/model/replacement.dart';
import 'package:daylist/domain/repository/replacement_repository.dart';

class ReplacementDataRepository extends ReplacementRepository {
  final ApiUtil _apiUtil;

  ReplacementDataRepository(this._apiUtil);

  @override
  Future<List<Replacement>> getReplacements(
      {required GetReplacementsBody body}) async {
    final List<Replacement> result = await _apiUtil.getReplacements(body: body);

    return result;
  }

  @override
  Future addReplacement({required AddReplacementBody body}) async {
    return await _apiUtil.addReplacement(body: body);
    // .then(
    //     (value) => VoitingDataRepository(_apiUtil).add(body: body.voitingBody));
  }

  @override
  Future deleteReplacement({required DeleteReplacementBody body}) async {
    return await _apiUtil.deleteReplacement(body: body);

    // .then(
    //     (value) async => await _storageUtil.deleteReplacement(id: body.id));
  }
}
