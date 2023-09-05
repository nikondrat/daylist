import 'package:daylist/domain/model/replacement.dart';
import 'package:daylist/domain/model/teacher.dart';
import 'package:daylist/domain/model/time.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final selectedTeacherProvider = StateProvider<Teacher?>((ref) {
  return null;
});

final selectedSubjectTitleProvider = StateProvider<String?>((ref) {
  return null;
});

final selectedTimeProvider = StateProvider<Time?>((ref) {
  return null;
});

final selectedUndergroupProvider = StateProvider<int>((ref) {
  return 1;
});

final selectedModeProvider = StateProvider<ReplacementMode>((ref) {
  return ReplacementMode.usual;
});

final selectedWeekdayProvider = StateProvider<int>((ref) {
  return 1;
});
