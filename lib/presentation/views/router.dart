import 'package:daylist/data/repository/user_repository.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'package:daylist/data/repository/auth_repository.dart';
import 'package:daylist/internal/dependencies/dependencies.dart';
import 'package:daylist/presentation/views/auth/sign_in.dart';
import 'package:daylist/presentation/views/auth/sign_up.dart';
import 'package:daylist/presentation/views/home/home.dart';
import 'package:daylist/presentation/views/selection/selection.dart';
import 'package:daylist/presentation/views/settings/settings.dart';
import 'package:daylist/presentation/views/week/week.dart';

final navigatorKey = GlobalKey<NavigatorState>();

final GoRouter router = GoRouter(navigatorKey: navigatorKey, routes: [
  GoRoute(
      path: '/',
      redirect: (context, state) async {
        final bool isAuthorized =
            await AuthDataRepository(Dependencies().getIt.get()).isAuthorized();

        if (!isAuthorized) {
          await AuthDataRepository(Dependencies().getIt.get()).login();
        }

        if (await UserDataRepository(Dependencies().getIt.get())
                .getSettings() !=
            null) {
          router.goNamed(ViewsNames.home);
        } else {
          router.goNamed(ViewsNames.selectionCity);
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
      redirect: (context, state) async {
        final bool isAuthorized =
            await AuthDataRepository(Dependencies().getIt.get()).isAuthorized();

        if (isAuthorized) router.goNamed(ViewsNames.home);

        return null;
      },
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
      ])
]);

abstract class ViewsNames {
  static const String selectionCity = 'selectionCity';
  static const String selectionInstitution = 'selectionInstitution';
  static const String selectionGroup = 'selectionGroup';

  static const String signIn = 'signIn';
  static const String signUp = 'signUp';

  static const String home = 'home';
  static const String week = 'week';
  static const String settings = 'settings';
}

abstract class ViewsPaths {
  static const String selectionCity = '/${ViewsNames.selectionCity}';
  static const String selectionInstitution = ViewsNames.selectionInstitution;
  static const String selectionGroup = ViewsNames.selectionGroup;

  static const String signIn = '/${ViewsNames.signIn}';
  static const String signUp = ViewsNames.signUp;

  static const String home = '/${ViewsNames.home}';
  static const String week = ViewsNames.week;
  static const String settings = ViewsNames.settings;
}
