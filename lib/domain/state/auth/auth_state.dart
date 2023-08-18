import 'package:hooks_riverpod/hooks_riverpod.dart';

final isShowPasswordProvider = StateProvider<bool>((ref) {
  return false;
});

final authErrorProvider = StateProvider<String?>((ref) {
  return null;
});
