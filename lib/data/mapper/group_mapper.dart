import 'package:daylist/data/api/model/api_group.dart';
import 'package:daylist/domain/model/group.dart';

class GroupMapper {
  static Group fromApi(ApiGroup group) {
    return Group(
        id: group.id, title: group.title, institutionId: group.institutionId);
  }

  // static Group fromStorage(StorageGroup group) {
  //   return Group(
  //       id: group.id, title: group.title, institutionId: group.institutionId);
  // }
}
