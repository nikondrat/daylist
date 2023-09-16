class GetSubjectsBody {
  final String databaseId;
  final String collectionId;
  final String groupId;
  final bool isDataFromStorage;

  GetSubjectsBody(
      {required this.databaseId,
      required this.collectionId,
      required this.groupId,
      this.isDataFromStorage = true});
}
