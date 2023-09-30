class PutVoteBody {
  final String databaseId;
  final String collectionId;
  final String documentId;
  final List pros;
  final List cons;

  PutVoteBody(
      {required this.databaseId,
      required this.collectionId,
      required this.documentId,
      required this.pros,
      required this.cons});
}
