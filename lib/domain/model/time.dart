class Time {
  final String id;
  final String start;
  final String end;
  final int number;
  final String? createdBy;

  Time(
      {required this.id,
      required this.start,
      required this.end,
      required this.number,
      required this.createdBy});

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'documentId': id,
      'start': start,
      'end': end,
      'number': number,
      'createdBy': createdBy
    };
  }

  factory Time.fromMap(Map<String, dynamic> map) {
    return Time(
        id: map['documentId'] as String,
        start: map['start'] as String,
        end: map['end'] as String,
        number: map['number'] as int,
        createdBy: map['createdBy'] as String?);
  }
}
