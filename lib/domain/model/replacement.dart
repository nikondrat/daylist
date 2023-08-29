enum ReplacementMode { usual, exam, practice, laboratory, test, cancel }

class Replacement {
  final String teacherId;
  final String groupId;
  final String timeId;
  final String date;
  final ReplacementMode mode;

  Replacement({
    required this.teacherId,
    required this.groupId,
    required this.timeId,
    required this.date,
    required this.mode,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'teacherId': teacherId,
      'groupId': groupId,
      'timeId': timeId,
      'date': date,
      'mode': mode,
    };
  }

  factory Replacement.fromMap(Map<String, dynamic> map) {
    return Replacement(
      teacherId: map['teacherId'] as String,
      groupId: map['groupId'] as String,
      timeId: map['timeId'] as String,
      date: map['date'],
      mode: map['mode'] as ReplacementMode,
    );
  }
}
