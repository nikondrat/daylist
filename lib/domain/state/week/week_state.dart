import 'package:daylist/data/api/request/get/get_subjects_body.dart';
import 'package:daylist/data/api/request/get/get_teachers_body.dart';
import 'package:daylist/data/api/request/get/get_times_body.dart';
import 'package:daylist/data/api/request/get/get_titles_body.dart';
import 'package:daylist/data/repository/subject_repository.dart';
import 'package:daylist/data/repository/teacher_repository.dart';
import 'package:daylist/data/repository/time_repository.dart';
import 'package:daylist/data/repository/title_repository.dart';
import 'package:daylist/domain/model/subject.dart';
import 'package:daylist/domain/model/teacher.dart';
import 'package:daylist/domain/model/time.dart';
import 'package:daylist/domain/model/title.dart';
import 'package:daylist/domain/state/settings/settings_state.dart';
import 'package:daylist/domain/state/sheduler/sheduler_state.dart';
import 'package:daylist/internal/dependencies/dependencies.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final subjectsProvider = FutureProvider.autoDispose<List<Subject>>((ref) async {
  final String groupId =
      ref.watch(selectedGroup)?.id ?? ref.watch(settingsProvider).group!.id;

  final List<Subject> subjects =
      await SubjectDataRepository(Dependencies().getIt.get()).getSubjects(
          body: GetSubjectsBody(
              databaseId: dotenv.env['databaseId']!,
              collectionId: dotenv.env['subjectsCollectionId']!,
              groupId: groupId));

  return subjects;
});

final timesProvider = FutureProvider.autoDispose<List<Time>>((ref) async {
  final List<Time> times = await TimeDataRepository(Dependencies().getIt.get())
      .getTimes(
          body: GetTimesBody(
              databaseId: dotenv.env['databaseId']!,
              collectionId: dotenv.env['timesCollectionId']!));

  return times;
});

final titlesProvider =
    FutureProvider.autoDispose<List<SubjectTitle>>((ref) async {
  final List<SubjectTitle> titles =
      await TitleDataRepository(Dependencies().getIt.get()).getTitles(
          body: GetTitlesBody(
              databaseId: dotenv.env['databaseId']!,
              collectionId: dotenv.env['titlesCollectionId']!));

  return titles;
});

final teachersProvider = FutureProvider.autoDispose<List<Teacher>>((ref) async {
  final String institutionId = ref.watch(settingsProvider).institution!.id;

  final List<Teacher> teachers =
      await TeacherDataRepository(Dependencies().getIt.get()).getTeachers(
          body: GetTeachersBody(
              databaseId: dotenv.env['databaseId']!,
              collectionId: dotenv.env['teachersCollectionId']!,
              institutionId: institutionId));

  return teachers;
});

final teachersBySubject =
    FutureProvider.autoDispose<List<Teacher>>((ref) async {
  return [];
});
