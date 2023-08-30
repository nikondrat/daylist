class GetReplacementsBody {
  final String databaseId;
  final String collectionId;
  final String groupId;
  final String today;
  final String tomorrow;

  GetReplacementsBody({
    required this.databaseId,
    required this.collectionId,
    required this.groupId,
    required this.today,
    required this.tomorrow,
  });
}
