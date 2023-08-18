import 'package:daylist/domain/model/group.dart';

class AddGroupBody {
  final String databaseId;
  final String collectionId;
  final Group group;

  AddGroupBody(
      {required this.databaseId,
      required this.collectionId,
      required this.group});
}
