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
import 'package:daylist/data/api/request/get/get_cities_body.dart';
import 'package:daylist/data/api/request/get/get_groups_body.dart';
import 'package:daylist/data/api/request/get/get_institutions_body.dart';
import 'package:daylist/data/api/request/get/get_replacements_body.dart';
import 'package:daylist/data/api/request/get/get_subjects_body.dart';
import 'package:daylist/data/api/request/get/get_teachers_body.dart';
import 'package:daylist/data/api/request/get/get_times_body.dart';
import 'package:daylist/data/api/request/get/get_titles_body.dart';
import 'package:daylist/data/api/service/appwrite_service.dart';
import 'package:daylist/data/mapper/city_mapper.dart';
import 'package:daylist/data/mapper/group_mapper.dart';
import 'package:daylist/data/mapper/institution_mapper.dart';
import 'package:daylist/data/mapper/replacement_mapper.dart';
import 'package:daylist/data/mapper/subject_mapper.dart';
import 'package:daylist/data/mapper/teacher_mapper.dart';
import 'package:daylist/data/mapper/time_mapper.dart';
import 'package:daylist/data/mapper/title_mapper.dart';
import 'package:daylist/domain/model/city.dart';
import 'package:daylist/domain/model/group.dart';
import 'package:daylist/domain/model/institution.dart';
import 'package:daylist/domain/model/replacement.dart';
import 'package:daylist/domain/model/subject.dart';
import 'package:daylist/domain/model/teacher.dart';
import 'package:daylist/domain/model/time.dart';
import 'package:daylist/domain/model/title.dart';

class ApiUtil {
  late final AppwriteService _appwriteService = AppwriteService();

  Future<List<City>> getCities({required GetCitiesBody body}) async {
    final List<ApiCity> result = await _appwriteService.getCities(body: body);
    final List<City> convertedList =
        result.map((e) => CityMapper.fromApi(e)).toList();

    return convertedList;
  }

  Future addCity({required AddCityBody body}) async {
    return _appwriteService.addCity(body: body);
  }

  Future<List<Institution>> getInstitutions(
      {required GetInstitutionsBody body}) async {
    final List<ApiInstitution> result =
        await _appwriteService.getInstitutions(body: body);
    final List<Institution> convertedList =
        result.map((e) => InstitutionMapper.fromApi(e)).toList();

    return convertedList;
  }

  Future addInstitution({required AddInstitutionBody body}) async {
    return _appwriteService.addInstitution(body: body);
  }

  Future<List<Group>> getGroups({required GetGroupsBody body}) async {
    final List<ApiGroup> result = await _appwriteService.getGroups(body: body);
    final List<Group> convertedList =
        result.map((e) => GroupMapper.fromApi(e)).toList();

    return convertedList;
  }

  Future addGroup({required AddGroupBody body}) async {
    return _appwriteService.addGroup(body: body);
  }

  Future<List<SubjectTitle>> getTitles({required GetTitlesBody body}) async {
    final List<ApiTitle> result = await _appwriteService.getTitles(body: body);
    final List<SubjectTitle> convertedList =
        result.map((e) => TitleMapper.fromApi(e)).toList();

    return convertedList;
  }

  Future<List<Teacher>> getTeachers({required GetTeachersBody body}) async {
    final List<ApiTeacher> result =
        await _appwriteService.getTeachers(body: body);
    final List<Teacher> convertedList =
        result.map((e) => TeacherMapper.fromApi(e)).toList();

    return convertedList;
  }

  Future<List<Time>> getTimes({required GetTimesBody body}) async {
    final List<ApiTime> result = await _appwriteService.getTimes(body: body);
    final List<Time> convertedList =
        result.map((e) => TimeMapper.fromApi(e)).toList();

    return convertedList;
  }

  Future<List<Subject>> getSubjects({required GetSubjectsBody body}) async {
    final List<ApiSubject> result =
        await _appwriteService.getSubjects(body: body);
    final List<Subject> convertedList =
        result.map((e) => SubjectMapper.fromApi(e)).toList();

    return convertedList;
  }

  Future<List<Replacement>> getReplacements(
      {required GetReplacementsBody body}) async {
    final List<ApiReplacement> result =
        await _appwriteService.getReplacements(body: body);
    final List<Replacement> convertedList =
        result.map((e) => ReplacementMapper.fromApi(e)).toList();

    return convertedList;
  }

  // Future signUp({required SignUpBody body}) async {
  //   return _appwriteService.signUp(body: body).then((value) =>
  //       signIn(body: SignInBody(email: body.email, password: body.password)));
  // }

  Future signIn() async {
    return _appwriteService.signIn();
  }

  Future<bool> isAuthorized() async {
    return _appwriteService.isAuthorized();
  }

  Future getUser() async {
    return _appwriteService.getUser();
  }

  Future getPrefs() async {
    return _appwriteService.getPrefs();
  }

  Future updatePrefs(Map prefs) async {
    return _appwriteService.updatePrefs(prefs);
  }
}
