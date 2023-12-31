class IsarService {
  // late final Future<Isar> _db;

  // IsarService() {
  //   _db = _openDB();
  // }

  // Future clear() async {
  //   final Isar db = await _db;
  //   db.writeTxnSync(() => db.clearSync());
  // }

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

  // Future<List<StorageSubject>> getSubjects() async {
  //   final Isar db = await _db;
  //   return db.storageSubjects.where().findAllSync();
  // }

  // Future putSubject(
  //     {required StorageTeacher teacher,
  //     required StorageTime time,
  //     required StorageTitle title}) async {
  //   final Isar db = await _db;

  //   db.writeTxnSync(() {
  //     db.storageTitles.putSync(title);
  //     db.storageTeachers.putSync(teacher);
  //     db.storageTimes.putSync(time);
  //   });
  // }

  // Future putSubjects({required List<StorageSubject> subjects}) async {
  //   final Isar db = await _db;

  //   // for (var i in subjects) {
  //   //   db.writeTxn(() async {
  //   //     await i.teacher.save();
  //   //     await i.time.save();
  //   //     await db.storageSubjects.put(i);
  //   //   });
  //   // }

  //   db.writeTxnSync(() {
  //     db.storageSubjects.putAllSync(subjects);

  //     // for (var e in subjects) {
  //     //   e.teacher.saveSync();
  //     //   e.time.saveSync();
  //     // }
  //   });
  // }

  // Future addSubject({required StorageSubject subject}) async {
  //   final Isar db = await _db;
  //   db.writeTxnSync(() => db.storageSubjects.putSync(subject));
  // }

  // Future clearSubjects() async {
  //   final Isar db = await _db;

  //   db.writeTxnSync(() => db.storageSubjects.clearSync());
  // }

  // Future<List<StorageTeacher>> getTeachers() async {
  //   final Isar db = await _db;
  //   return db.storageTeachers.where().findAllSync();
  // }

  // Future putTeachers({required List<StorageTeacher> teachers}) async {
  //   final Isar db = await _db;
  //   db.writeTxnSync(() => db.storageTeachers.putAllSync(teachers));
  // }

  // Future addTeacher({required StorageTeacher teacher}) async {
  //   final Isar db = await _db;
  //   db.writeTxnSync(() => db.storageTeachers.putSync(teacher));
  // }

  // Future<List<StorageTime>> getTimes() async {
  //   final Isar db = await _db;
  //   return db.storageTimes.where().findAllSync();
  // }

  // Future putTimes({required List<StorageTime> times}) async {
  //   final Isar db = await _db;
  //   db.writeTxnSync(() => db.storageTimes.putAllSync(times));
  // }

  // Future addTime({required StorageTime time}) async {
  //   final Isar db = await _db;
  //   db.writeTxnSync(() => db.storageTimes.putSync(time));
  // }

  // Future<List<StorageTitle>> getTitles() async {
  //   final Isar db = await _db;
  //   return db.storageTitles.where().findAllSync();
  // }

  // Future putTitles({required List<StorageTitle> titles}) async {
  //   final Isar db = await _db;
  //   db.writeTxnSync(() => db.storageTitles.putAllSync(titles));
  // }

  // Future addTitle({required StorageTitle title}) async {
  //   final Isar db = await _db;
  //   db.writeTxnSync(() => db.storageTitles.putSync(title));
  // }

  // Future<Isar> _openDB() async {
  //   final dir = await getTemporaryDirectory();
  //   if (Isar.instanceNames.isEmpty) {
  //     return await Isar.open([
  //       // StorageCitySchema,
  //       // StorageInstitutionSchema,
  //       // StorageGroupSchema,
  //       // StorageTitleSchema,
  //       // StorageReplacementSchema,
  //       // StorageSubjectSchema,
  //       // StorageTeacherSchema,
  //       // StorageTimeSchema
  //     ], directory: dir.path, inspector: true);
  //   } else {
  //     return Isar.getInstance()!;
  //   }
  // }
}
