class GetGroupsBody {
  final String databaseId;
  final String collectionId;
  final String institutionId;

  GetGroupsBody(
      {required this.databaseId,
      required this.collectionId,
      required this.institutionId});
}
