import 'package:daylist/data/api/api_util.dart';
import 'package:daylist/data/storage/storage_util.dart';
import 'package:get_it/get_it.dart';

class Dependencies {
  final GetIt getIt = GetIt.instance;

  void init() {
    getIt.registerSingleton<ApiUtil>(ApiUtil());
    getIt.registerSingleton<StorageUtil>(StorageUtil());
  }
}
