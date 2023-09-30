class City {
  final String id;
  final String title;

  City({required this.id, required this.title});

  Map<String, dynamic> toMap() {
    return <String, dynamic>{'id': id, 'title': title};
  }

  factory City.fromMap(Map<String, dynamic> map) {
    return City(id: map['id'] as String, title: map['title'] as String);
  }
}
