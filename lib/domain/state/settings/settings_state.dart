import 'package:appwrite/models.dart';
import 'package:daylist/data/repository/auth_repository.dart';
import 'package:daylist/data/repository/user_repository.dart';
import 'package:daylist/data/storage/model/settings.dart';
import 'package:daylist/domain/model/city.dart';
import 'package:daylist/domain/model/group.dart';
import 'package:daylist/domain/model/institution.dart';
import 'package:daylist/internal/dependencies/dependencies.dart';
import 'package:daylist/presentation/res/values.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final settingsProvider = Provider(SettingsNotifier.new);

class SettingsNotifier {
  SettingsNotifier(this.ref) {
    _init();
  }

  Settings? _settings;
  set settings(Settings settings) {
    _settings = settings;
    ref.read(cityProvider.notifier).update((state) => settings.city);
    ref.read(groupProvider.notifier).update((state) => settings.group);
    ref
        .read(institutionProvider.notifier)
        .update((state) => settings.institution);
    ref
        .read(undergroupProvider.notifier)
        .update((state) => settings.undergroup);
    ref.read(isDarkProvider.notifier).update((state) => settings.isDark);
    ref
        .read(primaryColorProvider.notifier)
        .update((state) => settings.primaryColor);
    ref
        .read(backgroundColorProvider.notifier)
        .update((state) => settings.backgroundColor);
    ref.read(radiusProvider.notifier).update((state) => settings.radius);
    ref
        .read(isShowTimeProvider.notifier)
        .update((state) => settings.isShowTime);
    ref
        .read(isShortInitialsProvider.notifier)
        .update((state) => settings.isShortInitials);
  }

  void _init() async {
    settings =
        await UserDataRepository(Dependencies().getIt.get()).getSettings() ??
            Settings(city: null, institution: null, group: null);

    _user = await AuthDataRepository(Dependencies().getIt.get()).getUser();
  }

  updateSettings() {
    UserDataRepository(Dependencies().getIt.get()).setSettings(_settings!);
  }

  final Ref ref;

  User? _user;

  late final List _labels = _user?.labels ?? [];

  bool get isScheduler => _labels.where((e) => e == 'scheduler').isNotEmpty;
  bool get isAdmin => _labels.where((e) => e == 'admin').isNotEmpty;

  String get name => _user?.name ?? '';
  String get email => _user?.email ?? '';

  City? get city => _settings?.city;
  set city(City? city) {
    _settings?.city = city;
    ref.read(cityProvider.notifier).update((state) => city);
  }

  Institution? get institution => _settings?.institution;
  set institution(Institution? institution) {
    _settings?.institution = institution;
    ref.read(institutionProvider.notifier).update((state) => institution);
  }

  Group? get group => _settings?.group;
  set group(Group? group) {
    _settings?.group = group;
    updateSettings();
    ref.read(groupProvider.notifier).update((state) => group);
  }

  int get undergroup => _settings!.undergroup;
  set undergroup(int undergroup) {
    _settings?.undergroup = undergroup;
    updateSettings();
    ref.read(undergroupProvider.notifier).update((state) => undergroup);
  }

  bool get isDark => _settings?.isDark ?? false;
  set isDark(bool isDark) {
    _settings?.isDark = isDark;
    updateSettings();
    ref.read(isDarkProvider.notifier).update((state) => isDark);
  }

  bool get isEvenWeek => _settings?.isEvenWeek ?? false;
  set isEvenWeek(bool isEvenWeek) {
    _settings?.isEvenWeek = isEvenWeek;
    updateSettings();
    ref.read(isEvenWeekProvider.notifier).update((state) => isEvenWeek);
  }

  Color? get primaryColor => _settings?.primaryColor;
  set primaryColor(Color? primaryColor) {
    _settings?.primaryColor = primaryColor;
    ref.read(primaryColorProvider.notifier).update((state) => primaryColor);
  }

  Color? get backgroundColor => _settings?.backgroundColor;
  set backgroundColor(Color? backgroundColor) {
    _settings?.backgroundColor = backgroundColor;
    ref
        .read(backgroundColorProvider.notifier)
        .update((state) => backgroundColor);
  }

  double get radius => _settings?.radius ?? kDefaultRadius;
  set radius(double radius) {
    _settings?.radius = radius;
    ref.read(radiusProvider.notifier).update((state) => radius);
  }

  bool get isShowTime => _settings?.isShowTime ?? false;
  set isShowTime(bool isShowTime) {
    _settings?.isShowTime = isShowTime;
    updateSettings();
    ref.read(isShowTimeProvider.notifier).update((state) => isShowTime);
  }

  bool get isShortInitials => _settings?.isShortInitials ?? false;
  set isShortInitials(bool isShortInitials) {
    _settings?.isShortInitials = isShortInitials;
    updateSettings();
    ref
        .read(isShortInitialsProvider.notifier)
        .update((state) => isShortInitials);
  }
}

final cityProvider = StateProvider<City?>((ref) {
  final City? city = ref.watch(settingsProvider).city;

  return city;
});

final institutionProvider = StateProvider<Institution?>((ref) {
  final Institution? institution = ref.watch(settingsProvider).institution;

  return institution;
});

final groupProvider = StateProvider<Group?>((ref) {
  final Group? group = ref.watch(settingsProvider).group;

  return group;
});

final undergroupProvider = StateProvider<int>((ref) {
  final int undergroup = ref.watch(settingsProvider).undergroup;

  return undergroup;
});

final isDarkProvider = StateProvider<bool>((ref) {
  final bool isDark = ref.watch(settingsProvider).isDark;

  return isDark;
});

final isEvenWeekProvider = StateProvider<bool>((ref) {
  final bool isEvenWeek = ref.watch(settingsProvider).isEvenWeek;

  return isEvenWeek;
});

final primaryColorProvider = StateProvider<Color?>((ref) {
  final Color? color = ref.watch(settingsProvider).primaryColor;

  return color;
});

final backgroundColorProvider = StateProvider<Color?>((ref) {
  final Color? color = ref.watch(settingsProvider).backgroundColor;

  return color;
});

final radiusProvider = StateProvider<double>((ref) {
  final double radius = ref.watch(settingsProvider).radius;

  return radius;
});

final isShowTimeProvider = StateProvider<bool>((ref) {
  final bool isShowTime = ref.watch(settingsProvider).isShowTime;

  return isShowTime;
});

final isShortInitialsProvider = StateProvider<bool>((ref) {
  final bool isShortInitials = ref.watch(settingsProvider).isShortInitials;

  return isShortInitials;
});
