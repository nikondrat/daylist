import 'package:appwrite/models.dart';
import 'package:daylist/data/api/api_util.dart';
import 'package:daylist/data/api/request/auth/sign_in_body.dart';
import 'package:daylist/data/api/request/auth/sign_up_body.dart';
import 'package:daylist/domain/repository/auth_repository.dart';

class AuthDataRepository extends AuthRepository {
  final ApiUtil _apiUtil;

  AuthDataRepository(this._apiUtil);

  @override
  Future login({required SignInBody body}) {
    return _apiUtil.signIn(body: body);
  }

  @override
  Future signUp({required SignUpBody body}) async {
    return _apiUtil.signUp(body: body);
  }

  @override
  Future<User> getUser() async {
    return await _apiUtil.getUser();
  }

  @override
  Future updatePrefs({required Map data}) async {
    return await _apiUtil.updatePrefs(data);
  }

  @override
  Future<Map> getPrefs() async {
    return await _apiUtil.getPrefs();
  }

  @override
  Future<bool> isScheduler() async {
    return false;
    // return await _apiUtil.isScheduler();
  }
}
