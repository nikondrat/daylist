class GetTimesBody {
  final String databaseId;
  final String collectionId;
  final bool isDataFromStorage;

  GetTimesBody(
      {required this.databaseId,
      required this.collectionId,
      this.isDataFromStorage = true});
}
