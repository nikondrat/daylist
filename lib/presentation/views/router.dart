import 'package:daylist/data/repository/auth_repository.dart';
import 'package:daylist/data/repository/user_repository.dart';
import 'package:daylist/data/storage/model/settings.dart';
import 'package:daylist/presentation/views/auth/sign_in.dart';
import 'package:daylist/presentation/views/auth/sign_up.dart';
import 'package:daylist/presentation/views/sheduler/add_replacement.dart';
import 'package:daylist/presentation/views/sheduler/group_sheduler.dart';
import 'package:daylist/presentation/views/sheduler/sheduler.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'package:daylist/internal/dependencies/dependencies.dart';
import 'package:daylist/presentation/views/home/home.dart';
import 'package:daylist/presentation/views/selection/selection.dart';
import 'package:daylist/presentation/views/settings/settings.dart';
import 'package:daylist/presentation/views/week/week.dart';

final navigatorKey = GlobalKey<NavigatorState>();

final GoRouter router = GoRouter(navigatorKey: navigatorKey, routes: [
  GoRoute(
      path: '/',
      redirect: (context, state) async {
        final Settings? settings =
            await UserDataRepository(Dependencies().getIt.get()).getSettings();

        final bool isAuthorized =
            await UserDataRepository(Dependencies().getIt.get()).isAuthorized();

        if (!isAuthorized) {
          router.goNamed(ViewsNames.signIn);
        } else if (settings == null) {
          router.goNamed(ViewsNames.selectionCity);
        } else {
          final bool isScheduler =
              await AuthDataRepository(Dependencies().getIt.get())
                  .isScheduler();
          if (isScheduler && settings.city == null) {
            router.goNamed(ViewsNames.sheduler);
          } else {
            router.goNamed(ViewsNames.home);
          }
        }

        return null;
      },
      builder: (context, state) => const Material()),
  GoRoute(
      name: ViewsNames.selectionCity,
      path: ViewsPaths.selectionCity,
      builder: (context, state) => const SelectionCityView(),
      routes: [
        GoRoute(
            name: ViewsNames.selectionInstitution,
            path: ViewsPaths.selectionInstitution,
            builder: (context, state) => const SelectionInstitutionView(),
            routes: [
              GoRoute(
                  name: ViewsNames.selectionGroup,
                  path: ViewsPaths.selectionGroup,
                  builder: (context, state) => const SelectionGroupView())
            ])
      ]),
  GoRoute(
      name: ViewsNames.signIn,
      path: ViewsPaths.signIn,
      builder: (context, state) => const LoginView(),
      routes: [
        GoRoute(
            name: ViewsNames.signUp,
            path: ViewsPaths.signUp,
            builder: (context, state) => const SignUpView())
      ]),
  GoRoute(
      name: ViewsNames.home,
      path: ViewsPaths.home,
      builder: (context, state) => const HomeView(),
      routes: [
        GoRoute(
            name: ViewsNames.week,
            path: ViewsPaths.week,
            builder: (context, state) => const WeekView()),
        GoRoute(
            name: ViewsNames.settings,
            path: ViewsPaths.settings,
            builder: (context, state) => const SettingsView()),
      ]),
  GoRoute(
      name: ViewsNames.sheduler,
      path: ViewsPaths.sheduler,
      builder: (context, state) => const ShedulerView(),
      routes: [
        GoRoute(
            name: ViewsNames.groupSheduler,
            path: ViewsPaths.groupSheduler,
            builder: (context, state) => const GroupShedulerView(),
            routes: [
              GoRoute(
                  name: ViewsNames.addReplacement,
                  path: ViewsPaths.addReplacement,
                  builder: (context, state) => const AddReplacementView())
            ])
      ])
]);

abstract class ViewsNames {
  static const String signIn = 'signIn';
  static const String signUp = 'signUp';

  static const String selectionCity = 'selectionCity';
  static const String selectionInstitution = 'selectionInstitution';
  static const String selectionGroup = 'selectionGroup';

  static const String home = 'home';
  static const String week = 'week';
  static const String settings = 'settings';

  static const String sheduler = 'sheduler';
  static const String groupSheduler = 'groupSheduler';
  static const String addReplacement = 'addReplacement';
}

abstract class ViewsPaths {
  static const String signUp = ViewsNames.signUp;
  static const String signIn = '/${ViewsNames.signIn}';

  static const String selectionCity = '/${ViewsNames.selectionCity}';
  static const String selectionInstitution = ViewsNames.selectionInstitution;
  static const String selectionGroup = ViewsNames.selectionGroup;

  static const String home = '/${ViewsNames.home}';
  static const String week = ViewsNames.week;
  static const String settings = ViewsNames.settings;

  static const String sheduler = '/${ViewsNames.sheduler}';
  static const String groupSheduler = ViewsNames.groupSheduler;
  static const String addReplacement = ViewsNames.addReplacement;
}
