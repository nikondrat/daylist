import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:daylist/data/api/request/get/get_cities_body.dart';
import 'package:daylist/data/api/request/get/get_groups_body.dart';
import 'package:daylist/data/api/request/get/get_institutions_body.dart';
import 'package:daylist/data/api/request/get/get_replacements_body.dart';
import 'package:daylist/data/repository/city_data_repository.dart';
import 'package:daylist/data/repository/group_repository.dart';
import 'package:daylist/data/repository/institution_repository.dart';
import 'package:daylist/data/repository/replacement_repository.dart';
import 'package:daylist/domain/model/city.dart';
import 'package:daylist/domain/model/group.dart';
import 'package:daylist/domain/model/institution.dart';
import 'package:daylist/domain/model/replacement.dart';
import 'package:daylist/domain/state/settings/settings_state.dart';
import 'package:daylist/internal/dependencies/dependencies.dart';

final citiesProvider = FutureProvider<List<City>>((ref) async {
  final List<City> cities = await CityDataRepository(Dependencies().getIt.get())
      .getCities(
          body: GetCitiesBody(
              databaseId: dotenv.env['const databaseId']!,
              collectionId: dotenv.env['const citiesCollectionId']!));

  return cities;
});

final institutionsProvider = FutureProvider<List<Institution>>((ref) async {
  final City? city = ref.watch(settingsProvider).city;

  final List<Institution> institutions =
      await InstitutionDataRepository(Dependencies().getIt.get())
          .getInstitutions(
              body: GetInstitutionsBody(
                  cityId: city!.id,
                  databaseId: dotenv.env['const databaseId']!,
                  collectionId: dotenv.env['const institutionsCollectionId']!));

  return institutions;
});

final groupsProvider = FutureProvider<List<Group>>((ref) async {
  final Institution? institution = ref.watch(settingsProvider).institution;

  final List<Group> groups =
      await GroupDataRepository(Dependencies().getIt.get()).getGroups(
          body: GetGroupsBody(
              databaseId: dotenv.env['const databaseId']!,
              collectionId: dotenv.env['const groupsCollectionId']!,
              institutionId: institution!.id));

  return groups;
});

final replacementsProvider = FutureProvider<List<Replacement>>((ref) async {
  final String groupId = ref.watch(settingsProvider).group!.id;

  final List<Replacement> replacements =
      await ReplacementDataRepository(Dependencies().getIt.get())
          .getReplacements(
              body: GetReplacementsBody(
                  databaseId: dotenv.env['const databaseId']!,
                  collectionId: dotenv.env['const replacementsCollectionId']!,
                  groupId: groupId,
                  day: DateTime.now()));

  return replacements;
});

final isChangeScheduleProvider = StateProvider<bool>((ref) {
  return false;
});
