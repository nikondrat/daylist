class Subject {
  final String id;
  final String teacherId;
  final String timeId;
  final String groupId;
  final bool? isEven;
  final int weekday;
  Subject({
    required this.id,
    required this.teacherId,
    required this.timeId,
    required this.groupId,
    this.isEven,
    required this.weekday,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'documentId': id,
      'teacherId': teacherId,
      'timeId': timeId,
      'groupId': groupId,
      'isEven': isEven,
      'weekday': weekday,
    };
  }

  factory Subject.fromMap(Map<String, dynamic> map) {
    return Subject(
      id: map['documentId'] as String,
      teacherId: map['teacherId'] as String,
      timeId: map['timeId'] as String,
      groupId: map['groupId'] as String,
      isEven: map['isEven'] != null ? map['isEven'] as bool : null,
      weekday: map['weekday'] as int,
    );
  }
}
