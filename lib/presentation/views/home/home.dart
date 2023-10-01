import 'package:daylist/domain/state/home/home_state.dart';
import 'package:daylist/domain/state/settings/settings_state.dart';
import 'package:daylist/presentation/views/widgets/list.dart';
import 'package:daylist/presentation/views/widgets/subject.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:daylist/presentation/extensions/theme/context.dart';
import 'package:unicons/unicons.dart';

import 'package:daylist/domain/model/replacement.dart';
import 'package:daylist/domain/model/subject.dart';
import 'package:daylist/presentation/translations/translations.g.dart';
import 'package:daylist/presentation/views/router.dart';
import 'package:daylist/presentation/views/widgets/loader.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return SubjectsLoaderWidget(
        builder: (subjects, replacements) =>
            _Body(subjects: subjects, replacements: replacements));
  }
}

class _Body extends HookConsumerWidget {
  final List<Subject> subjects;
  final List<Replacement> replacements;

  const _Body({
    Key? key,
    required this.subjects,
    required this.replacements,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final DateTime now = DateTime.now();
    final DateTime tomorrow = now.add(const Duration(days: 1));
    final bool isAdmin = ref.watch(settingsProvider).isAdmin;

    final int undergroup = ref.watch(settingsProvider).undergroup;
    final bool isEvenWeek = ref.watch(isEvenWeekProvider);

    final bool isChangeSchedule = ref.watch(isChangeScheduleProvider);

    return Scaffold(
        appBar: AppBar(
            leading: IconButton(
                onPressed: () => context.goNamed(ViewsNames.settings),
                splashRadius: 20,
                icon: const Icon(UniconsLine.setting)),
            title: Text(t.settings.app_name),
            actions: [
              isAdmin
                  ? Padding(
                      padding: const EdgeInsets.all(8),
                      child: IconButton(
                          onPressed: () => ref
                              .read(isChangeScheduleProvider.notifier)
                              .update((state) => !state),
                          color: context.color.primaryColor,
                          splashRadius: 20,
                          icon: const Icon(UniconsLine.edit)))
                  : const SizedBox.shrink(),
              // Padding(
              //     padding: const EdgeInsets.all(8),
              //     child: IconButton(
              //         onPressed: () => context.goNamed(ViewsNames.voitings),
              //         color: context.color.primaryColor,
              //         splashRadius: 20,
              //         icon: const FaIcon(FontAwesomeIcons.wandMagicSparkles,
              //             size: 16))),
              Padding(
                  padding: const EdgeInsets.all(8),
                  child: IconButton(
                      onPressed: () => context.goNamed(ViewsNames.week),
                      color: context.color.primaryColor,
                      splashRadius: 20,
                      icon: const Icon(UniconsLine.schedule))),
            ]),
        body: CustomListWidget(children: [
          SectionSubjectsWidget(
              title:
                  '${t.home.today}, ${now.day} ${t.week.days.short[now.weekday - 1]}',
              dateTime: now,
              subjects: subjects,
              isShedulerView: true,
              isEvenWeek: isEvenWeek,
              undergroup: undergroup,
              replacements: replacements),
          SectionSubjectsWidget(
              title:
                  '${t.home.tomorrow}, ${tomorrow.day} ${t.week.days.short[tomorrow.weekday - 1]}',
              dateTime: tomorrow,
              subjects: subjects,
              isShedulerView: true,
              isEvenWeek: isEvenWeek,
              undergroup: undergroup,
              replacements: replacements),
        ]),
        floatingActionButton: isChangeSchedule
            ? FloatingActionButton(
                onPressed: () => context.goNamed(ViewsNames.sheduler),
                child: const Icon(Icons.add))
            : null);
  }
}
