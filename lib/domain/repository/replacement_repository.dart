import 'package:daylist/data/api/request/add/add_replacement_body.dart';
import 'package:daylist/data/api/request/delete/delete_replacement_body.dart';
import 'package:daylist/data/api/request/get/get_replacements_body.dart';
import 'package:daylist/domain/model/replacement.dart';

abstract class ReplacementRepository {
  Future<List<Replacement>?> getReplacements(
      {required GetReplacementsBody body});

  Future addReplacement({required AddReplacementBody body});

  Future deleteReplacement({required DeleteReplacementBody body});
}
