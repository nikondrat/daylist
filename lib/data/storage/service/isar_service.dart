import 'package:daylist/data/storage/model/storage_group.dart';
import 'package:daylist/data/storage/model/storage_institution.dart';
import 'package:daylist/data/storage/model/storage_replacement.dart';
import 'package:daylist/data/storage/model/storage_subject.dart';
import 'package:daylist/data/storage/model/storage_teacher.dart';
import 'package:daylist/data/storage/model/storage_time.dart';
import 'package:daylist/data/storage/model/storage_title.dart';
import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';

import 'package:daylist/data/storage/model/storage_city.dart';

class IsarService {
  late final Future<Isar> _db;

  IsarService() {
    _db = _openDB();
  }

  Future clear() async {
    final Isar db = await _db;
    db.writeTxnSync(() => db.clearSync());
  }

  Future<List<StorageCity>> getCities() async {
    final Isar db = await _db;
    return db.storageCities.where().findAllSync();
  }

  Future addCity({required StorageCity city}) async {
    final Isar db = await _db;
    db.writeTxnSync(() => db.storageCities.putSync(city));
  }

  Future putCities({required List<StorageCity> cities}) async {
    final Isar db = await _db;
    db.writeTxnSync(() => db.storageCities.putAllSync(cities));
  }

  Future<List<StorageInstitution>> getInstitutions() async {
    final Isar db = await _db;
    return db.storageInstitutions.where().findAllSync();
  }

  Future addInstitution({required StorageInstitution institution}) async {
    final Isar db = await _db;
    db.writeTxnSync(() => db.storageInstitutions.putSync(institution));
  }

  Future putInstitutions(
      {required List<StorageInstitution> institutions}) async {
    final Isar db = await _db;
    db.writeTxnSync(() => db.storageInstitutions.putAllSync(institutions));
  }

  Future<List<StorageGroup>> getGroups() async {
    final Isar db = await _db;
    return db.storageGroups.where().findAllSync();
  }

  Future addGroup({required StorageGroup group}) async {
    final Isar db = await _db;
    db.writeTxnSync(() => db.storageGroups.putSync(group));
  }

  Future putGroups({required List<StorageGroup> groups}) async {
    final Isar db = await _db;
    db.writeTxnSync(() => db.storageGroups.putAllSync(groups));
  }

  Future<List<StorageReplacement>> getReplacements() async {
    final Isar db = await _db;
    return db.storageReplacements.where().findAllSync();
  }

  Future putReplacements(
      {required List<StorageReplacement> replacements}) async {
    final Isar db = await _db;
    db.writeTxnSync(() => db.storageReplacements.putAllSync(replacements));
  }

  Future<List<StorageSubject>> getSubjects() async {
    final Isar db = await _db;
    return db.storageSubjects.where().findAllSync();
  }

  Future putSubjects({required List<StorageSubject> subjects}) async {
    final Isar db = await _db;
    db.writeTxnSync(() => db.storageSubjects.putAllSync(subjects));
  }

  Future<List<StorageTeacher>> getTeachers() async {
    final Isar db = await _db;
    return db.storageTeachers.where().findAllSync();
  }

  Future putTeachers({required List<StorageTeacher> teachers}) async {
    final Isar db = await _db;
    db.writeTxnSync(() => db.storageTeachers.putAllSync(teachers));
  }

  Future<List<StorageTime>> getTimes() async {
    final Isar db = await _db;
    return db.storageTimes.where().findAllSync();
  }

  Future putTimes({required List<StorageTime> times}) async {
    final Isar db = await _db;
    db.writeTxnSync(() => db.storageTimes.putAllSync(times));
  }

  Future<List<StorageTitle>> getTitles() async {
    final Isar db = await _db;
    return db.storageTitles.where().findAllSync();
  }

  Future putTitles({required List<StorageTitle> titles}) async {
    final Isar db = await _db;
    db.writeTxnSync(() => db.storageTitles.putAllSync(titles));
  }

  Future<Isar> _openDB() async {
    final dir = await getTemporaryDirectory();
    if (Isar.instanceNames.isEmpty) {
      return await Isar.open([
        StorageCitySchema,
        StorageInstitutionSchema,
        StorageGroupSchema,
        StorageTitleSchema,
        StorageReplacementSchema,
        StorageSubjectSchema,
        StorageTeacherSchema,
        StorageTimeSchema
      ], directory: dir.path, inspector: true);
    } else {
      return Isar.getInstance()!;
    }
  }
}
