import 'dart:io';

import 'package:daylist/domain/state/settings/settings_state.dart';
import 'package:daylist/internal/dependencies/dependencies.dart';
import 'package:daylist/presentation/res/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
// import 'package:shared_preferences/shared_preferences.dart';

import 'presentation/translations/translations.g.dart';
import 'presentation/views/router.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  LocaleSettings.useDeviceLocale();
  await dotenv.load(mergeWith: Platform.environment);
  await SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);

  // IsarService().clear();

  // var p = await SharedPreferences.getInstance();
  // p.clear();

  Dependencies().init();

  runApp(TranslationProvider(child: const ProviderScope(child: MyApp())));
}

class MyApp extends HookConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final bool isDark = ref.watch(settingsProvider).isDark;
    final double radius = ref.watch(settingsProvider).radius;
    final Color? primaryColor = ref.watch(settingsProvider).primaryColor;
    final Color? backgroundColor = ref.watch(settingsProvider).backgroundColor;

    return MaterialApp.router(
        routerConfig: router,
        theme: theme(
            isDark: isDark,
            radius: radius,
            customPrimaryColor: primaryColor,
            customBackgroundColor: backgroundColor),
        debugShowCheckedModeBanner: false,

        // localization
        supportedLocales: AppLocaleUtils.supportedLocales,
        locale: TranslationProvider.of(context).flutterLocale,
        localizationsDelegates: GlobalMaterialLocalizations.delegates);
  }
}
