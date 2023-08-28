import 'package:daylist/domain/model/teacher.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final selectedTeacherProvider = StateProvider<Teacher?>((ref) {
  return null;
});

final selectedSubjectTitleProvider = StateProvider<String?>((ref) {
  return null;
});
