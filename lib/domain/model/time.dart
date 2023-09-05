class Time {
  final String start;
  final String end;
  final int number;
  final String? createdBy;

  Time(
      {required this.start,
      required this.end,
      required this.number,
      required this.createdBy});

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'start': start,
      'end': end,
      'number': number,
      'createdBy': createdBy
    };
  }

  factory Time.fromMap(Map<String, dynamic> map) {
    return Time(
        start: map['start'] as String,
        end: map['end'] as String,
        number: map['number'] as int,
        createdBy: map['createdBy'] as String?);
  }
}
