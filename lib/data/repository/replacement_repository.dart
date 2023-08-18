import 'package:daylist/data/api/api_util.dart';
import 'package:daylist/data/api/request/get/get_replacements_body.dart';
import 'package:daylist/domain/model/replacement.dart';
import 'package:daylist/domain/repository/replacement_repository.dart';

class ReplacementDataRepository extends ReplacementRepository {
  final ApiUtil _apiUtil;
  // final StorageUtil _storageUtil;

  ReplacementDataRepository(
    this._apiUtil,
    // this._storageUtil
  );

  @override
  Future<List<Replacement>> getReplacements(
      {required GetReplacementsBody body}) async {
    // final List<Replacement> replacements = await _storageUtil.getReplacements();

    // if (cities.isEmpty) {
    final List<Replacement> result = await _apiUtil.getReplacements(body: body);
    // final List<StorageReplacement> convertedList =
    //     result.map((e) => StorageReplacement.fromApi(e)).toList();
    // _storageUtil.putReplacements(replacements: convertedList);

    return result;
    // } else {
    //   return cities;
    // }
  }
}
