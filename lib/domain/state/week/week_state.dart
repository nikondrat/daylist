import 'package:daylist/data/api/request/get/get_classroom_body.dart';
import 'package:daylist/data/api/request/get/get_subjects_body.dart';
import 'package:daylist/data/api/request/get/get_teachers_body.dart';
import 'package:daylist/data/api/request/get/get_times_body.dart';
import 'package:daylist/data/api/request/get/get_titles_body.dart';
import 'package:daylist/data/repository/classroom_data_repository.dart';
import 'package:daylist/data/repository/subject_data_repository.dart';
import 'package:daylist/data/repository/teacher_data_repository.dart';
import 'package:daylist/data/repository/time_data_repository.dart';
import 'package:daylist/data/repository/title_data_repository.dart';
import 'package:daylist/domain/model/classroom.dart';
import 'package:daylist/domain/model/subject.dart';
import 'package:daylist/domain/model/teacher.dart';
import 'package:daylist/domain/model/time.dart';
import 'package:daylist/domain/model/title.dart';
import 'package:daylist/domain/state/settings/settings_state.dart';
import 'package:daylist/domain/state/sheduler/sheduler_state.dart';
import 'package:daylist/domain/state/sheduler/subject_state.dart';
import 'package:daylist/internal/dependencies/dependencies.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final subjectsProvider = FutureProvider.family
    .autoDispose<List<Subject>, bool>((ref, isDataFromStorage) async {
  final String groupId =
      ref.watch(selectedGroup)?.id ?? ref.watch(settingsProvider).group!.id;

  final List<Subject> subjects = await SubjectDataRepository(
          Dependencies().getIt.get(), Dependencies().getIt.get())
      .getSubjects(
          body: GetSubjectsBody(
              databaseId: dotenv.env['databaseId']!,
              collectionId: dotenv.env['subjectsCollectionId']!,
              isDataFromStorage: isDataFromStorage,
              groupId: groupId));

  return subjects;
});

final timesProvider = FutureProvider.autoDispose<List<Time>>((ref) async {
  final List<Time> times = await TimeDataRepository(
          Dependencies().getIt.get(), Dependencies().getIt.get())
      .getTimes(
          body: GetTimesBody(
              databaseId: dotenv.env['databaseId']!,
              collectionId: dotenv.env['timesCollectionId']!));

  return times;
});

final titlesProvider =
    FutureProvider.autoDispose<List<SubjectTitle>>((ref) async {
  final List<SubjectTitle> titles = await TitleDataRepository(
          Dependencies().getIt.get(), Dependencies().getIt.get())
      .getTitles(
          body: GetTitlesBody(
              databaseId: dotenv.env['databaseId']!,
              collectionId: dotenv.env['titlesCollectionId']!));

  return titles;
});

final classroomsProvider =
    FutureProvider.autoDispose<List<Classroom>>((ref) async {
  final List<Classroom> classrooms = await ClassroomDataRepository(
          Dependencies().getIt.get(), Dependencies().getIt.get())
      .getClassrooms(
          body: GetClassroomsBody(
              databaseId: dotenv.env['databaseId']!,
              collectionId: dotenv.env['classroomsCollectionId']!));

  return classrooms;
});

final teachersProvider = FutureProvider.autoDispose<List<Teacher>>((ref) async {
  final String institutionId = ref.watch(settingsProvider).institution!.id;

  final SubjectTitle? title = ref.watch(selectedSubjectTitleProvider);

  final List<Teacher> teachers = await TeacherDataRepository(
          Dependencies().getIt.get(), Dependencies().getIt.get())
      .getTeachers(
          body: GetTeachersBody(
              databaseId: dotenv.env['databaseId']!,
              collectionId: dotenv.env['teachersCollectionId']!,
              title: title,
              institutionId: institutionId));

  return teachers;
});

final teachersBySubject =
    FutureProvider.autoDispose<List<Teacher>>((ref) async {
  return [];
});
