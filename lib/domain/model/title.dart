class SubjectTitle {
  final String id;
  final String title;

  SubjectTitle({
    required this.id,
    required this.title,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'documentId': id,
      'title': title,
    };
  }

  factory SubjectTitle.fromMap(Map<String, dynamic> map) {
    return SubjectTitle(
      id: map['documentId'] as String,
      title: map['title'] as String,
    );
  }
}
