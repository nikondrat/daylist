import 'package:appwrite/appwrite.dart';
import 'package:appwrite/models.dart';

import 'package:daylist/data/api/model/api_city.dart';
import 'package:daylist/data/api/model/api_group.dart';
import 'package:daylist/data/api/model/api_institution.dart';
import 'package:daylist/data/api/model/api_replacement.dart';
import 'package:daylist/data/api/model/api_subject.dart';
import 'package:daylist/data/api/model/api_teacher.dart';
import 'package:daylist/data/api/model/api_time.dart';
import 'package:daylist/data/api/model/api_title.dart';
import 'package:daylist/data/api/request/add/add_city_body.dart';
import 'package:daylist/data/api/request/add/add_group_body.dart';
import 'package:daylist/data/api/request/add/add_institution_body.dart';
import 'package:daylist/data/api/request/add/add_replacement_body.dart';
import 'package:daylist/data/api/request/add/add_subject_body.dart';
import 'package:daylist/data/api/request/add/add_teacher_body.dart';
import 'package:daylist/data/api/request/add/add_time_body.dart';
import 'package:daylist/data/api/request/add/add_title_body.dart';
import 'package:daylist/data/api/request/auth/sign_in_body.dart';
import 'package:daylist/data/api/request/auth/sign_up_body.dart';
import 'package:daylist/data/api/request/delete/delete_replacement_body.dart';
import 'package:daylist/data/api/request/get/get_cities_body.dart';
import 'package:daylist/data/api/request/get/get_groups_body.dart';
import 'package:daylist/data/api/request/get/get_institutions_body.dart';
import 'package:daylist/data/api/request/get/get_replacements_body.dart';
import 'package:daylist/data/api/request/get/get_subjects_body.dart';
import 'package:daylist/data/api/request/get/get_teachers_body.dart';
import 'package:daylist/data/api/request/get/get_times_body.dart';
import 'package:daylist/data/api/request/get/get_titles_body.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class AppwriteService {
  final Client client = Client()
      .setEndpoint(dotenv.env['const endPoint']!)
      .setProject(dotenv.env['const key']!);

  late final Account _account = Account(client);
  late final Databases _databases = Databases(client);

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
        data: {'title': body.city.title, 'createdBy': body.city.createdBy});
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
          'createdBy': body.institution.createdBy
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
          'createdBy': body.group.createdBy,
        });
  }

  Future<List<ApiTitle>> getTitles({required GetTitlesBody body}) async {
    final DocumentList docs = await _databases.listDocuments(
        databaseId: body.databaseId, collectionId: body.collectionId);

    return docs.documents.map((e) => ApiTitle.fromApi(e.data)).toList();
  }

  Future addTitle({required AddTitleBody body}) async {
    return _databases.createDocument(
        databaseId: body.databaseId,
        collectionId: body.collectionId,
        documentId: body.title.id,
        data: {'title': body.title.title, 'createdBy': body.title.createdBy});
  }

  Future<List<ApiTeacher>> getTeachers({required GetTeachersBody body}) async {
    final DocumentList docs = await _databases.listDocuments(
        databaseId: body.databaseId,
        collectionId: body.collectionId,
        queries: [Query.equal('institutionId', body.institutionId)]);

    return docs.documents.map((e) => ApiTeacher.fromApi(e.data)).toList();
  }

  Future addTeacher({required AddTecherBody body}) async {
    return _databases.createDocument(
        databaseId: body.databaseId,
        collectionId: body.collectionId,
        documentId: body.teacher.id,
        data: {
          'title': body.teacher.title.id,
          'initials': body.teacher.initials,
          'classroom': body.teacher.classroom,
          'institutionId': body.teacher.institutionId,
          'createdBy': body.teacher.createdBy
        });
  }

  Future<List<ApiTime>> getTimes({required GetTimesBody body}) async {
    final DocumentList docs = await _databases.listDocuments(
        databaseId: body.databaseId, collectionId: body.collectionId);

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
          'createdBy': body.time.createdBy
        });
  }

  Future<List<ApiSubject>> getSubjects({required GetSubjectsBody body}) async {
    final DocumentList docs = await _databases.listDocuments(
        databaseId: body.databaseId,
        collectionId: body.collectionId,
        queries: [Query.equal('groupId', body.groupId)]);

    return docs.documents.map((e) => ApiSubject.fromApi(e.data)).toList();
  }

  Future addSubject({required AddSubjectBody body}) async {
    return _databases.createDocument(
        databaseId: body.databaseId,
        collectionId: body.collectionId,
        documentId: body.subject.id,
        data: {
          'teacherId': body.subject.teacherId,
          'groupId': body.subject.groupId,
          'timeId': body.subject.timeId,
          'isEven': body.subject.isEven,
          'weekday': body.subject.weekday,
          'createdBy': body.subject.createdBy
        });
  }

  Future<List<ApiReplacement>> getReplacements(
      {required GetReplacementsBody body}) async {
    final DocumentList docs = await _databases.listDocuments(
        databaseId: body.databaseId,
        collectionId: body.collectionId,
        queries: [
          Query.equal('groupId', body.groupId),
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
          'createdBy': body.replacement.createdBy,
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

  Future signUp({required SignUpBody body}) async {
    return _account.create(
        userId: ID.unique(), email: body.email, password: body.password);
  }

  Future signIn({required SignInBody body}) async {
    return _account.createEmailSession(
        email: body.email, password: body.password);
  }

  Future getUser() async {
    return _account.get();
  }

  Future getPrefs() async {
    final User user = await _account.get();

    return user.prefs.data;
  }

  Future updatePrefs(Map prefs) async {
    return _account.updatePrefs(prefs: prefs);
  }

  Future<bool> isAuthorized() async {
    try {
      return await getUser().then((value) => true);
    } catch (e) {
      return false;
    }
  }
}
