import 'package:daylist/data/api/request/get/get_voitings_body.dart';
import 'package:daylist/data/repository/voiting_data_repository.dart';
import 'package:daylist/domain/model/voiting.dart';
import 'package:daylist/domain/state/settings/settings_state.dart';
import 'package:daylist/internal/dependencies/dependencies.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final voitingsProvider = FutureProvider<List<Voiting>>((ref) async {
  final String groupId = ref.watch(settingsProvider).group!.id;

  final List<Voiting> voitings =
      await VoitingDataRepository(Dependencies().getIt.get()).get(
          body: GetVoitingsBody(
              groupId: groupId,
              databaseId: dotenv.env['databaseId']!,
              collectionId: dotenv.env['voitingCollectionId']!));

  return voitings;
});
