class Time {
  final String id;
  final String start;
  final String end;
  final int number;

  Time({
    required this.id,
    required this.start,
    required this.end,
    required this.number,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'documentId': id,
      'start': start,
      'end': end,
      'number': number,
    };
  }

  factory Time.fromMap(Map<String, dynamic> map) {
    return Time(
      id: map['documentId'] as String,
      start: map['start'] as String,
      end: map['end'] as String,
      number: map['number'] as int,
    );
  }
}
