import 'package:daylist/data/api/request/add/add_group_body.dart';
import 'package:daylist/data/api/request/get/get_groups_body.dart';
import 'package:daylist/domain/model/group.dart';

abstract class GroupRepository {
  Future<List<Group>> getGroups({required GetGroupsBody body});
  Future addGroup({required AddGroupBody body});
}
