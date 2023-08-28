import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final startTimeProvider = StateProvider<TimeOfDay?>((ref) {
  return null;
});

final endTimeProvider = StateProvider<TimeOfDay?>((ref) {
  // DateTime today = DateTime.now();
  // final TimeOfDay start = ref.watch(startTimeProvider);
  // final DateTime dateTime =
  //     DateTime(today.year, today.month, today.day, start.hour, start.minute);
  // final TimeOfDay end = TimeOfDay.fromDateTime(
  //     dateTime.add(const Duration(hours: 1, minutes: 30)));

  return null;
});
