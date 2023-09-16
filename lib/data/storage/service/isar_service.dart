import 'package:daylist/data/storage/model/storage_subject.dart';
import 'package:daylist/data/storage/model/storage_teacher.dart';
import 'package:daylist/data/storage/model/storage_time.dart';
import 'package:daylist/data/storage/model/storage_title.dart';
import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';

class IsarService {
  late final Future<Isar> _db;

  IsarService() {
    _db = _openDB();
  }

  Future putLink({required IsarLink link}) async {
    final Isar db = await _db;

    return await db.writeTxnSync(() => link.saveSync());
  }

  Future clear() async {
    final Isar db = await _db;
    db.writeTxnSync(() => db.clearSync());
  }

  // Future<List<StorageCity>> getCities() async {
  //   final Isar db = await _db;
  //   return db.storageCities.where().findAllSync();
  // }

  // Future addCity({required StorageCity city}) async {
  //   final Isar db = await _db;
  //   db.writeTxnSync(() => db.storageCities.putSync(city));
  // }

  // Future putCities({required List<StorageCity> cities}) async {
  //   final Isar db = await _db;
  //   db.writeTxnSync(() => db.storageCities.putAllSync(cities));
  // }

  // Future<List<StorageInstitution>> getInstitutions() async {
  //   final Isar db = await _db;
  //   return db.storageInstitutions.where().findAllSync();
  // }

  // Future addInstitution({required StorageInstitution institution}) async {
  //   final Isar db = await _db;
  //   db.writeTxnSync(() => db.storageInstitutions.putSync(institution));
  // }

  // Future putInstitutions(
  //     {required List<StorageInstitution> institutions}) async {
  //   final Isar db = await _db;
  //   db.writeTxnSync(() => db.storageInstitutions.putAllSync(institutions));
  // }

  // Future<List<StorageGroup>> getGroups() async {
  //   final Isar db = await _db;
  //   return db.storageGroups.where().findAllSync();
  // }

  // Future addGroup({required StorageGroup group}) async {
  //   final Isar db = await _db;
  //   db.writeTxnSync(() => db.storageGroups.putSync(group));
  // }

  // Future putGroups({required List<StorageGroup> groups}) async {
  //   final Isar db = await _db;
  //   db.writeTxnSync(() => db.storageGroups.putAllSync(groups));
  // }

  // Future<List<StorageReplacement>> getReplacements() async {
  //   final Isar db = await _db;
  //   return db.storageReplacements.where().findAllSync();
  // }

  // Future putReplacements(
  //     {required List<StorageReplacement> replacements}) async {
  //   final Isar db = await _db;
  //   db.writeTxnSync(() => db.storageReplacements.putAllSync(replacements));
  // }

  // Future addReplacement({required StorageReplacement replacement}) async {
  //   final Isar db = await _db;
  //   db.writeTxnSync(() => db.storageReplacements.putSync(replacement));
  // }

  // Future deleteReplacement({required String id}) async {
  //   final Isar db = await _db;
  //   db.writeTxnSync(
  //       () => db.storageReplacements.deleteSync(Generator.fastHash(id)));
  // }

  Future<List<StorageSubject>> getSubjects() async {
    final Isar db = await _db;
    return db.storageSubjects.where().findAllSync();
  }

  Future putSubject(
      {required StorageTeacher teacher,
      required StorageTime time,
      required StorageTitle title}) async {
    final Isar db = await _db;

    db.writeTxnSync(() {
      db.storageTitles.putSync(title);
      db.storageTeachers.putSync(teacher);
      db.storageTimes.putSync(time);
    });
  }

  Future addSubject({required StorageSubject subject}) async {
    final Isar db = await _db;

    return await db.writeTxn(() async {
      await db.storageSubjects.put(subject);
      await db.storageTeachers.put(subject.teacher.value!);
      await db.storageTitles.put(subject.teacher.value!.title.value!);
      await db.storageTimes.put(subject.time.value!);
      await subject.teacher.save();
      await subject.time.save();
      await subject.teacher.value!.title.save();
    });
  }

  Future clearSubjects() async {
    final Isar db = await _db;

    db.writeTxnSync(() => db.storageSubjects.clearSync());
  }

  Future<List<StorageTeacher>> getTeachers() async {
    final Isar db = await _db;
    return db.storageTeachers.where().findAllSync();
  }

  Future putTeachers({required List<StorageTeacher> teachers}) async {
    final Isar db = await _db;
    db.writeTxnSync(() => db.storageTeachers.putAllSync(teachers));
  }

  Future addTeacher({required StorageTeacher teacher}) async {
    final Isar db = await _db;
    db.writeTxnSync(() => db.storageTeachers.putSync(teacher));
  }

  Future<List<StorageTime>> getTimes() async {
    final Isar db = await _db;
    return db.storageTimes.where().findAllSync();
  }

  Future putTimes({required List<StorageTime> times}) async {
    final Isar db = await _db;
    db.writeTxnSync(() => db.storageTimes.putAllSync(times));
  }

  Future addTime({required StorageTime time}) async {
    final Isar db = await _db;
    db.writeTxnSync(() => db.storageTimes.putSync(time));
  }

  Future<List<StorageTitle>> getTitles() async {
    final Isar db = await _db;
    return db.storageTitles.where().findAllSync();
  }

  Future putTitles({required List<StorageTitle> titles}) async {
    final Isar db = await _db;
    db.writeTxnSync(() => db.storageTitles.putAllSync(titles));
  }

  Future addTitle({required StorageTitle title}) async {
    final Isar db = await _db;
    db.writeTxnSync(() => db.storageTitles.putSync(title));
  }

  Future<Isar> _openDB() async {
    final dir = await getApplicationCacheDirectory();

    if (Isar.instanceNames.isEmpty) {
      return await Isar.open([
        // StorageCitySchema,
        // StorageInstitutionSchema,
        // StorageGroupSchema,
        StorageTitleSchema,
        // StorageReplacementSchema,
        StorageSubjectSchema,
        StorageTeacherSchema,
        StorageTimeSchema
      ], directory: dir.path, inspector: true);
    } else {
      return Isar.getInstance()!;
    }
  }
}
