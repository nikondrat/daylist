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

class SettingsNotifier extends ChangeNotifier {
  Settings? _settings;
  set settings(Settings settings) {
    _settings = settings;
  }

  SettingsNotifier() {
    _init();
  }

  void _init() async {
    final Settings? settings =
        await UserDataRepository(Dependencies().getIt.get()).getSettings();

    _settings =
        settings ?? Settings(city: null, institution: null, group: null);
    notifyListeners();
  }

  City? get city => _settings?.city;
  set city(City? v) {
    _settings?.city = v;
    notifyListeners();
  }

  Institution? get institution => _settings?.institution;
  set institution(Institution? v) {
    _settings?.institution = v;
    notifyListeners();
  }

  Group? get group => _settings?.group;
  set group(Group? v) {
    _settings?.group = v;
    UserDataRepository(Dependencies().getIt.get()).setSettings(_settings!);
    AuthDataRepository(Dependencies().getIt.get()).updatePrefs(data: {
      'city': city!.id,
      'institution': institution!.id,
      'group': group!.id
    });
    notifyListeners();
  }

  int get undergroup => _settings!.undergroup;
  set undergroup(int v) {
    _settings!.undergroup = v;
    UserDataRepository(Dependencies().getIt.get()).setSettings(_settings!);
    notifyListeners();
  }

  bool get isDark => _settings?.isDark ?? false;
  void switchTheme() {
    _settings!.isDark = !_settings!.isDark;
    UserDataRepository(Dependencies().getIt.get()).setSettings(_settings!);
    notifyListeners();
  }

  Color? get primaryColor => _settings?.primaryColor;
  set primaryColor(Color? v) {
    _settings!.primaryColor = v;
    UserDataRepository(Dependencies().getIt.get()).setSettings(_settings!);
    notifyListeners();
  }

  Color? get backgroundColor => _settings?.backgroundColor;
  set backgroundColor(Color? v) {
    _settings!.backgroundColor = v;
    UserDataRepository(Dependencies().getIt.get()).setSettings(_settings!);
    notifyListeners();
  }

  double get radius => _settings?.radius ?? kDefaultRadius;
  set radius(double v) {
    _settings!.radius = v;
    UserDataRepository(Dependencies().getIt.get()).setSettings(_settings!);
    notifyListeners();
  }

  bool get isShowTime => _settings?.isShowTime ?? false;
  set isShowTime(bool v) {
    _settings!.isShowTime = v;
    UserDataRepository(Dependencies().getIt.get()).setSettings(_settings!);
    notifyListeners();
  }

  bool get isShortInitials => _settings?.isShortInitials ?? false;
  set isShortInitials(bool v) {
    _settings!.isShortInitials = v;
    UserDataRepository(Dependencies().getIt.get()).setSettings(_settings!);
    notifyListeners();
  }
}

final settingsProvider = ChangeNotifierProvider<SettingsNotifier>((ref) {
  return SettingsNotifier();
});
