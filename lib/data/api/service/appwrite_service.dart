import 'package:appwrite/appwrite.dart';
import 'package:appwrite/models.dart';

import 'package:daylist/data/api/model/api_city.dart';
import 'package:daylist/data/api/model/api_classroom.dart';
import 'package:daylist/data/api/model/api_group.dart';
import 'package:daylist/data/api/model/api_institution.dart';
import 'package:daylist/data/api/model/api_replacement.dart';
import 'package:daylist/data/api/model/api_subject.dart';
import 'package:daylist/data/api/model/api_teacher.dart';
import 'package:daylist/data/api/model/api_time.dart';
import 'package:daylist/data/api/model/api_title.dart';
import 'package:daylist/data/api/model/api_voiting.dart';
import 'package:daylist/data/api/request/add/add_city_body.dart';
import 'package:daylist/data/api/request/add/add_classroom_body.dart';
import 'package:daylist/data/api/request/add/add_group_body.dart';
import 'package:daylist/data/api/request/add/add_institution_body.dart';
import 'package:daylist/data/api/request/add/add_replacement_body.dart';
import 'package:daylist/data/api/request/add/add_subject_body.dart';
import 'package:daylist/data/api/request/add/add_teacher_body.dart';
import 'package:daylist/data/api/request/add/add_time_body.dart';
import 'package:daylist/data/api/request/add/add_title_body.dart';
import 'package:daylist/data/api/request/add/add_voiting_body.dart';
import 'package:daylist/data/api/request/auth/sign_in_body.dart';
import 'package:daylist/data/api/request/auth/sign_up_body.dart';
import 'package:daylist/data/api/request/delete/delete_replacement_body.dart';
import 'package:daylist/data/api/request/get/get_cities_body.dart';
import 'package:daylist/data/api/request/get/get_classroom_body.dart';
import 'package:daylist/data/api/request/get/get_groups_body.dart';
import 'package:daylist/data/api/request/get/get_institutions_body.dart';
import 'package:daylist/data/api/request/get/get_replacements_body.dart';
import 'package:daylist/data/api/request/get/get_subjects_body.dart';
import 'package:daylist/data/api/request/get/get_teachers_body.dart';
import 'package:daylist/data/api/request/get/get_times_body.dart';
import 'package:daylist/data/api/request/get/get_titles_body.dart';
import 'package:daylist/data/api/request/get/get_voitings_body.dart';
import 'package:daylist/data/api/request/put/put_vote_body.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class AppwriteService {
  final Client client = Client()
      .setEndpoint(dotenv.env['endPoint']!)
      .setProject(dotenv.env['key']!);

  late final Account _account = Account(client);
  late final Databases _databases = Databases(client);
  // late final Storage _storage = Storage(client);

  Future addVoiting({required AddVoitingBody body}) async {
    return _databases.createDocument(
        databaseId: body.databaseId,
        collectionId: body.collectionId,
        documentId: ID.unique(),
        data: {
          'groupId': body.groupId,
          'type': body.type!.name,
          'classroom': body.classroom?.id,
          'replacement': body.replacement?.id,
          'subject': body.subject?.id,
          'teacher': body.teacher?.id,
          'time': body.time?.id,
          'title': body.title?.id
        });
  }

  Future changeVote({required PutVoteBody body}) async {
    return _databases.updateDocument(
        databaseId: body.databaseId,
        collectionId: body.collectionId,
        documentId: body.documentId,
        data: {
          'pros': body.pros,
          'cons': body.cons,
        });
  }

  Future<List<ApiVoiting>> getVoitings({required GetVoitingsBody body}) async {
    final DocumentList docs = await _databases.listDocuments(
        databaseId: body.databaseId,
        collectionId: body.collectionId,
        queries: [Query.equal('groupId', body.groupId)]);

    return docs.documents.map((e) => ApiVoiting.fromApi(e.data)).toList();
  }

  Future<List<ApiCity>> getCities({required GetCitiesBody body}) async {
    final DocumentList docs = await _databases.listDocuments(
        databaseId: body.databaseId, collectionId: body.collectionId);

    return docs.documents.map((e) => ApiCity.fromApi(e.data)).toList();
  }

  Future addCity({required AddCityBody body}) async {
    return _databases.createDocument(
        databaseId: body.databaseId,
        collectionId: body.collectionId,
        documentId: body.city.id,
        data: {'title': body.city.title});
  }

  Future<List<ApiInstitution>> getInstitutions(
      {required GetInstitutionsBody body}) async {
    final DocumentList docs = await _databases.listDocuments(
        databaseId: body.databaseId,
        collectionId: body.collectionId,
        queries: [Query.equal('cityId', body.cityId)]);

    return docs.documents.map((e) => ApiInstitution.fromApi(e.data)).toList();
  }

  Future addInstitution({required AddInstitutionBody body}) async {
    return _databases.createDocument(
        databaseId: body.databaseId,
        collectionId: body.collectionId,
        documentId: body.institution.id,
        data: {
          'title': body.institution.title,
          'shortTitle': body.institution.shortTitle,
          'cityId': body.institution.cityId,
        });
  }

  Future<List<ApiGroup>> getGroups({required GetGroupsBody body}) async {
    final DocumentList docs = await _databases.listDocuments(
        databaseId: body.databaseId,
        collectionId: body.collectionId,
        queries: [Query.equal('institutionId', body.institutionId)]);

    return docs.documents.map((e) => ApiGroup.fromApi(e.data)).toList();
  }

  Future addGroup({required AddGroupBody body}) async {
    return _databases.createDocument(
        databaseId: body.databaseId,
        collectionId: body.collectionId,
        documentId: body.group.id,
        data: {
          'title': body.group.title,
          'institutionId': body.group.institutionId,
        });
  }

  Future<List<ApiTitle>> getTitles({required GetTitlesBody body}) async {
    final DocumentList docs = await _databases.listDocuments(
        databaseId: body.databaseId,
        collectionId: body.collectionId,
        queries: [Query.equal('isCorrect', true)]);

    return docs.documents.map((e) => ApiTitle.fromApi(e.data)).toList();
  }

  Future addTitle({required AddTitleBody body}) async {
    return _databases.createDocument(
        databaseId: body.databaseId,
        collectionId: body.collectionId,
        documentId: body.title.id,
        data: {'title': body.title.title});
  }

  Future<List<ApiTeacher>> getTeachers({required GetTeachersBody body}) async {
    final DocumentList docs = await _databases.listDocuments(
        databaseId: body.databaseId,
        collectionId: body.collectionId,
        queries: [
          Query.equal('institutionId', body.institutionId),
          Query.equal('isCorrect', true)
        ]);

    return docs.documents.map((e) => ApiTeacher.fromApi(e.data)).toList();
  }

  Future addTeacher({required AddTecherBody body}) async {
    return _databases.createDocument(
        databaseId: body.databaseId,
        collectionId: body.collectionId,
        documentId: body.teacher.id,
        data: {
          'name': body.teacher.name,
          'surname': body.teacher.surname,
          'patronymic': body.teacher.patronymic,
          'title': body.teacher.title.id,
          'classroom': body.teacher.classroom.id,
          'institutionId': body.teacher.institutionId,
        });
  }

  Future<List<ApiClassroom>> getClassrooms(
      {required GetClassroomsBody body}) async {
    final DocumentList docs = await _databases.listDocuments(
        databaseId: body.databaseId,
        collectionId: body.collectionId,
        queries: [Query.equal('isCorrect', true)]);

    return docs.documents.map((e) => ApiClassroom.fromApi(e.data)).toList();
  }

  Future addClasroom({required AddClassroomBody body}) async {
    return _databases.createDocument(
        databaseId: body.databaseId,
        collectionId: body.collectionId,
        documentId: body.classroom.id,
        data: {
          'title': body.classroom.title,
        });
  }

  Future<List<ApiTime>> getTimes({required GetTimesBody body}) async {
    final DocumentList docs = await _databases.listDocuments(
        databaseId: body.databaseId,
        collectionId: body.collectionId,
        queries: [Query.orderAsc('number'), Query.equal('isCorrect', true)]);

    return docs.documents.map((e) => ApiTime.fromApi(e.data)).toList();
  }

  Future addTime({required AddTimeBody body}) async {
    return _databases.createDocument(
        databaseId: body.databaseId,
        collectionId: body.collectionId,
        documentId: body.time.id,
        data: {
          'start': body.time.start,
          'end': body.time.end,
          'number': body.time.number,
        });
  }

  Future<List<ApiSubject>> getSubjects({required GetSubjectsBody body}) async {
    final DocumentList docs = await _databases.listDocuments(
        databaseId: body.databaseId,
        collectionId: body.collectionId,
        queries: [
          Query.equal('groupId', body.groupId),
          Query.equal('isCorrect', true)
        ]);

    return docs.documents.map((e) => ApiSubject.fromApi(e.data)).toList();
  }

  Future addSubject({required AddSubjectBody body}) async {
    return _databases.createDocument(
        databaseId: body.databaseId,
        collectionId: body.collectionId,
        documentId: body.subject.id,
        data: {
          'teacher': body.subject.teacher.id,
          'time': body.subject.time.id,
          'groupId': body.subject.groupId,
          'showInWeek': body.subject.showInWeek,
          'weekday': body.subject.weekday,
        });
  }

  Future<List<ApiReplacement>> getReplacements(
      {required GetReplacementsBody body}) async {
    final DocumentList docs = await _databases.listDocuments(
        databaseId: body.databaseId,
        collectionId: body.collectionId,
        queries: [
          Query.equal('groupId', body.groupId),
          Query.equal('isCorrect', true)
        ]);

    return docs.documents.map((e) => ApiReplacement.fromApi(e.data)).toList();
  }

  Future addReplacement({required AddReplacementBody body}) async {
    return _databases.createDocument(
        databaseId: body.databaseId,
        collectionId: body.collectionId,
        documentId: body.replacement.id,
        data: {
          'date': body.replacement.date.toIso8601String(),
          'mode': body.replacement.mode.name,
          'undergroup': body.replacement.undergroup,
          'groupId': body.replacement.groupId,
          'teacher': body.replacement.teacher.id,
          'time': body.replacement.time.id
        });
  }

  Future deleteReplacement({required DeleteReplacementBody body}) async {
    return _databases.deleteDocument(
        databaseId: body.databaseId,
        collectionId: body.collectionId,
        documentId: body.id);
  }

  // Future<List<File>> getVersions({required GetVersionsBody body}) async {
  //   return _storage.listFiles(
  //       bucketId: body.bucketId, queries: []).then((value) => value.files);
  // }

  // Future getVersionData({required GetVersionDataBody body}) async {
  //   return _storage.getFileDownload(
  //       bucketId: body.bucketId, fileId: body.fileId);
  // }

  Future signUp({required SignUpBody body}) async {
    return await _account.create(
        userId: ID.unique(), email: body.email, password: body.password);
  }

  Future signIn({required SignInBody body}) async {
    return await _account.createEmailSession(
        email: body.email, password: body.password);
  }

  Future getUser() async {
    return await _account.get();
  }

  Future<List> getLabels() async {
    final User user = await _account.get();
    return user.labels;
  }

  Future getPrefs() async {
    final User user = await _account.get();

    return user.prefs.data;
  }

  Future updatePrefs(Map prefs) async {
    return await _account.updatePrefs(prefs: prefs);
  }

  Future<bool> isAuthorized() async {
    return await getUser()
        .then((value) => true)
        .onError((error, stackTrace) => false);
  }
}
