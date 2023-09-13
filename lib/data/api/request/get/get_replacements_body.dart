class GetReplacementsBody {
  final String databaseId;
  final String collectionId;
  final String groupId;
  final DateTime day;

  GetReplacementsBody({
    required this.databaseId,
    required this.collectionId,
    required this.groupId,
    required this.day,
  });
}
