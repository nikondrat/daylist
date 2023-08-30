enum ReplacementMode { usual, exam, practice, laboratory, test, cancel }

class Replacement {
  final String id;
  final String teacherId;
  final String groupId;
  final String timeId;
  final String date;
  final int? undergroup;
  final String? createdBy;
  final ReplacementMode mode;

  Replacement(
      {required this.id,
      required this.teacherId,
      required this.groupId,
      required this.timeId,
      required this.date,
      required this.mode,
      required this.undergroup,
      required this.createdBy});

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'teacherId': teacherId,
      'groupId': groupId,
      'timeId': timeId,
      'date': date,
      'mode': mode,
      'undergroup': undergroup,
      'createdBy': createdBy
    };
  }

  factory Replacement.fromMap(Map<String, dynamic> map) {
    return Replacement(
      id: map['id'] as String,
      teacherId: map['teacherId'] as String,
      groupId: map['groupId'] as String,
      timeId: map['timeId'] as String,
      date: map['date'],
      mode: map['mode'] as ReplacementMode,
      undergroup: map['undergroup'] as int?,
      createdBy: map['createdBy'],
    );
  }
}
