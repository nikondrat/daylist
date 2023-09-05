class City {
  final String id;
  final String title;
  final String? createdBy;

  City({required this.id, required this.title, this.createdBy});

  Map<String, dynamic> toMap() {
    return <String, dynamic>{'id': id, 'title': title, 'userId': createdBy};
  }

  factory City.fromMap(Map<String, dynamic> map) {
    return City(
        id: map['id'] as String,
        title: map['title'] as String,
        createdBy: map['userId']);
  }
}
