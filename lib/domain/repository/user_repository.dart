import 'package:daylist/data/storage/model/settings.dart';

abstract class UserRepository {
  Future setSettings(Settings settings);
  Future<Settings?> getSettings();
  Future<bool> isAuthorized();
  Future setIsAuthorized(bool value);
}
