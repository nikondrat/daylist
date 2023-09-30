import 'package:daylist/data/api/api_util.dart';
import 'package:daylist/data/api/request/add/add_voiting_body.dart';
import 'package:daylist/data/api/request/get/get_voitings_body.dart';
import 'package:daylist/data/api/request/put/put_vote_body.dart';
import 'package:daylist/domain/model/voiting.dart';
import 'package:daylist/domain/repository/voiting_repository.dart';

class VoitingDataRepository extends VoitingRepository {
  final ApiUtil _apiUtil;
  VoitingDataRepository(this._apiUtil);

  @override
  Future add({required AddVoitingBody body}) async {
    return await _apiUtil.addVoiting(
        body: body.copyWith(type: VoitingType.post));
  }

  @override
  Future<List<Voiting>> get({required GetVoitingsBody body}) async {
    final List<Voiting> result = await _apiUtil.getVoitings(body: body);

    return result;
  }

  @override
  Future change({required PutVoteBody body}) async {
    return await _apiUtil.changeVote(body: body);
  }
}
