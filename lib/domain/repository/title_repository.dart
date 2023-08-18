import 'package:daylist/data/api/request/get/get_titles_body.dart';
import 'package:daylist/domain/model/title.dart';

abstract class TitleRepository {
  Future<List<SubjectTitle>?> getTitles({required GetTitlesBody body});
}
