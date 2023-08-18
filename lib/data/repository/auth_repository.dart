import 'package:appwrite/models.dart';
import 'package:daylist/data/api/api_util.dart';
import 'package:daylist/data/api/request/auth/sign_up_body.dart';
import 'package:daylist/domain/repository/auth_repository.dart';

class AuthDataRepository extends AuthRepository {
  final ApiUtil _apiUtil;

  AuthDataRepository(
    this._apiUtil,
  );

  @override
  Future<bool> isAuthorized() {
    return _apiUtil.isAuthorized();
  }

  @override
  Future login() {
    return _apiUtil.signIn();
  }

  @override
  Future signUp({required SignUpBody body}) {
    throw Exception();
    // return _apiUtil.signUp(body: body);
  }

  @override
  Future<User> getUser() async {
    return await _apiUtil.getUser();
  }
}
