class SubjectTitle {
  final String id;
  final String title;
  final String? createdBy;

  SubjectTitle(
      {required this.id, required this.title, required this.createdBy});

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'documentId': id,
      'title': title,
      'createdBy': createdBy
    };
  }

  factory SubjectTitle.fromMap(Map<String, dynamic> map) {
    return SubjectTitle(
        id: map['documentId'] as String,
        title: map['title'] as String,
        createdBy: map['createdBy'] as String);
  }
}
