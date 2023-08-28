import 'package:daylist/data/api/model/api_title.dart';
import 'package:daylist/data/storage/model/storage_title.dart';
import 'package:daylist/domain/model/title.dart';

class TitleMapper {
  static SubjectTitle fromApi(ApiTitle title) {
    return SubjectTitle(
        id: title.id, title: title.title, createdBy: title.createdBy);
  }

  static SubjectTitle fromStorage(StorageTitle title) {
    return SubjectTitle(
        id: title.id, title: title.title, createdBy: title.createdBy);
  }
}
