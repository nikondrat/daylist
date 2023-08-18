class Group {
  final String id;
  final String title;
  final String institutionId;
  final String? createdBy;

  Group(
      {required this.id,
      required this.title,
      required this.institutionId,
      this.createdBy});

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'title': title,
      'institutionId': institutionId,
      'userId': createdBy
    };
  }

  factory Group.fromMap(Map<String, dynamic> map) {
    return Group(
      id: map['id'] as String,
      title: map['title'] as String,
      institutionId: map['institutionId'] as String,
    );
  }
}
