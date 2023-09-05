import 'package:daylist/domain/model/city.dart';

class Institution {
  final String id;
  final String title;
  final String shortTitle;
  final City city;
  final String? createdBy;

  Institution(
      {required this.id,
      required this.title,
      required this.shortTitle,
      required this.city,
      this.createdBy});

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'title': title,
      'shortTitle': shortTitle,
      'city': city.toMap(),
      'userId': createdBy
    };
  }

  factory Institution.fromMap(Map<String, dynamic> map) {
    return Institution(
        id: map['id'] as String,
        title: map['title'] as String,
        shortTitle: map['shortTitle'] as String,
        city: City.fromMap(map['city']),
        createdBy: map['createdBy']);
  }
}
