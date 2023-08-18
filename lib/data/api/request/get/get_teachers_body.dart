class GetTeachersBody {
  final String databaseId;
  final String collectionId;
  final String institutionId;

  GetTeachersBody(
      {required this.databaseId,
      required this.collectionId,
      required this.institutionId});
}
