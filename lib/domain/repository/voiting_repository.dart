import 'package:daylist/data/api/request/add/add_voiting_body.dart';
import 'package:daylist/data/api/request/get/get_voitings_body.dart';
import 'package:daylist/data/api/request/put/put_vote_body.dart';
import 'package:daylist/domain/model/voiting.dart';

abstract class VoitingRepository {
  Future<List<Voiting>?> get({required GetVoitingsBody body});
  Future add({required AddVoitingBody body});
  Future change({required PutVoteBody body});
}
