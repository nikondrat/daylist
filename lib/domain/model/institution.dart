class Institution {
  final String id;
  final String title;
  final String shortTitle;
  final String cityId;
  final String? createdBy;

  Institution(
      {required this.id,
      required this.title,
      required this.shortTitle,
      required this.cityId,
      this.createdBy});

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'title': title,
      'shortTitle': shortTitle,
      'cityId': cityId,
      'userId': createdBy
    };
  }

  factory Institution.fromMap(Map<String, dynamic> map) {
    return Institution(
        id: map['id'] as String,
        title: map['title'] as String,
        shortTitle: map['shortTitle'] as String,
        cityId: map['cityId'],
        createdBy: map['createdBy']);
  }
}
