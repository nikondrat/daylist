import 'package:appwrite/models.dart';
import 'package:daylist/data/api/request/auth/sign_in_body.dart';
import 'package:daylist/data/api/request/auth/sign_up_body.dart';

abstract class AuthRepository {
  Future signUp({required SignUpBody body});
  Future login({required SignInBody body});
  Future<User> getUser();
  Future updatePrefs({required Map data});
  Future<Map> getPrefs();
}
