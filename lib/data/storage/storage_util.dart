import 'package:daylist/data/mapper/subject_mapper.dart';
import 'package:daylist/data/mapper/teacher_mapper.dart';
import 'package:daylist/data/mapper/time_mapper.dart';
import 'package:daylist/data/mapper/title_mapper.dart';
import 'package:daylist/data/storage/model/settings.dart';
import 'package:daylist/data/storage/model/storage_subject.dart';
import 'package:daylist/data/storage/model/storage_teacher.dart';
import 'package:daylist/data/storage/model/storage_time.dart';
import 'package:daylist/data/storage/model/storage_title.dart';
import 'package:daylist/data/storage/service/isar_service.dart';
import 'package:daylist/data/storage/service/shared_prefs_service.dart';
import 'package:daylist/domain/model/subject.dart';
import 'package:daylist/domain/model/teacher.dart';
import 'package:daylist/domain/model/time.dart';
import 'package:daylist/domain/model/title.dart';

class StorageUtil {
  late final IsarService _db = IsarService();
  late final SharedPrefsService _prefs = SharedPrefsService();

  Future<bool> isAuthorized() async {
    return await _prefs.isAuthorized();
  }

  Future setIsAuthorized(bool value) async {
    return await _prefs.setIsAuthorized(value);
  }

  Future setSettings(Settings settings) async {
    return await _prefs.setSettings(settings);
  }

  Future<Settings?> getSettings() async {
    return await _prefs.getSettings();
  }

  // Future<List<City>> getCities() async {
  //   final List<StorageCity> result = await _db.getCities();
  //   final List<City> convertedList =
  //       result.map((e) => CityMapper.fromStorage(e)).toList();

  //   return convertedList;
  // }

  // Future addCity({required StorageCity city}) async {
  //   return await _db.addCity(city: city);
  // }

  // Future putCities({required List<StorageCity> cities}) async {
  //   await _db.putCities(cities: cities);
  // }

  // Future<List<Institution>> getInstitutions() async {
  //   final List<StorageInstitution> result = await _db.getInstitutions();
  //   final List<Institution> convertedList =
  //       result.map((e) => InstitutionMapper.fromStorage(e)).toList();

  //   return convertedList;
  // }

  // Future addInstitution({required StorageInstitution institution}) async {
  //   await _db.addInstitution(institution: institution);
  // }

  // Future putInstitutions(
  //     {required List<StorageInstitution> institutions}) async {
  //   await _db.putInstitutions(institutions: institutions);
  // }

  // Future<List<Group>> getGroups() async {
  //   final List<StorageGroup> result = await _db.getGroups();
  //   final List<Group> convertedList =
  //       result.map((e) => GroupMapper.fromStorage(e)).toList();

  //   return convertedList;
  // }

  // Future addGroup({required StorageGroup group}) async {
  //   await _db.addGroup(group: group);
  // }

  // Future putGroups({required List<StorageGroup> groups}) async {
  //   await _db.putGroups(groups: groups);
  // }

  // Future<List<Replacement>> getReplacements() async {
  //   final List<StorageReplacement> result = await _db.getReplacements();
  //   final List<Replacement> convertedList =
  //       result.map((e) => ReplacementMapper.fromStorage(e)).toList();

  //   return convertedList;
  // }

  // Future putReplacements(
  //     {required List<StorageReplacement> replacements}) async {
  //   await _db.putReplacements(replacements: replacements);
  // }

  // Future addReplacement({required StorageReplacement replacement}) async {
  //   await _db.addReplacement(replacement: replacement);
  // }

  // Future deleteReplacement({required String id}) async {
  //   await _db.deleteReplacement(id: id);
  // }

  Future<List<Subject>> getSubjects() async {
    final List<StorageSubject> result = await _db.getSubjects();
    final List<Subject> convertedList =
        result.map((e) => SubjectMapper.fromStorage(e)).toList();

    return convertedList;
  }

  Future putSubject(
      {required StorageTeacher teacher,
      required StorageTime time,
      required StorageTitle title,
      required StorageSubject? subject}) async {
    return await _db.putSubject(
        teacher: teacher, time: time, title: title, subject: subject);
  }

  Future putSubjects({required List<StorageSubject> subjects}) async {
    await _db.putSubjects(subjects: subjects);
  }

  Future addSubject({required StorageSubject subject}) async {
    return await _db.addSubject(subject: subject);
  }

  Future<List<Teacher>> getTeachers() async {
    final List<StorageTeacher> result = await _db.getTeachers();
    final List<Teacher> convertedList =
        result.map((e) => TeacherMapper.fromStorage(e)).toList();

    return convertedList;
  }

  Future putTeachers({required List<StorageTeacher> teachers}) async {
    await _db.putTeachers(teachers: teachers);
  }

  Future addTeacher({required StorageTeacher teacher}) async {
    return await _db.addTeacher(teacher: teacher);
  }

  Future<List<Time>> getTimes() async {
    final List<StorageTime> result = await _db.getTimes();
    final List<Time> convertedList =
        result.map((e) => TimeMapper.fromStorage(e)).toList();

    return convertedList;
  }

  Future putTimes({required List<StorageTime> times}) async {
    await _db.putTimes(times: times);
  }

  Future addTime({required StorageTime time}) async {
    return await _db.addTime(time: time);
  }

  Future<List<SubjectTitle>> getTitles() async {
    final List<StorageTitle> result = await _db.getTitles();
    final List<SubjectTitle> convertedList =
        result.map((e) => TitleMapper.fromStorage(e)).toList();

    return convertedList;
  }

  Future putTitles({required List<StorageTitle> titles}) async {
    await _db.putTitles(titles: titles);
  }

  Future addTitle({required StorageTitle title}) async {
    return await _db.addTitle(title: title);
  }
}
