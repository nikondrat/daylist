import 'package:daylist/data/api/api_util.dart';
import 'package:daylist/data/api/request/add/add_title_body.dart';
import 'package:daylist/data/api/request/get/get_titles_body.dart';
import 'package:daylist/data/storage/model/storage_title.dart';
import 'package:daylist/data/storage/storage_util.dart';
import 'package:daylist/domain/model/title.dart';
import 'package:daylist/domain/repository/title_repository.dart';

class TitleDataRepository extends TitleRepository {
  final ApiUtil _apiUtil;
  final StorageUtil _storageUtil;

  TitleDataRepository(this._apiUtil, this._storageUtil);

  @override
  Future<List<SubjectTitle>> getTitles({required GetTitlesBody body}) async {
    final List<SubjectTitle> titles = await _storageUtil.getTitles();

    if (titles.isEmpty) {
      final List<SubjectTitle> result = await _apiUtil.getTitles(body: body);
      final List<StorageTitle> convertedList =
          result.map((e) => StorageTitle.fromApi(e)).toList();
      _storageUtil.putTitles(titles: convertedList);

      return result;
    } else {
      return titles;
    }
  }

  @override
  Future addTitle({required AddTitleBody body}) async {
    return await _apiUtil.addTitle(body: body).then((value) async =>
        await _storageUtil.addTitle(
            title: StorageTitle(
                id: body.title.id,
                title: body.title.title,
                createdBy: body.title.createdBy)));
  }
}
