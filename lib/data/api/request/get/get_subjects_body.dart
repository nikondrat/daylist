class GetSubjectsBody {
  final String databaseId;
  final String collectionId;
  final String groupId;

  GetSubjectsBody(
      {required this.databaseId,
      required this.collectionId,
      required this.groupId});
}
