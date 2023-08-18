import 'package:daylist/data/storage/model/settings.dart';
import 'package:daylist/data/storage/storage_util.dart';
import 'package:daylist/domain/repository/user_repository.dart';

class UserDataRepository extends UserRepository {
  final StorageUtil _storageUtil;

  UserDataRepository(this._storageUtil);

  @override
  Future<Settings?> getSettings() async {
    return await _storageUtil.getSettings();
  }

  @override
  Future setSettings(Settings settings) async {
    return await _storageUtil.setSettings(settings);
  }
}
