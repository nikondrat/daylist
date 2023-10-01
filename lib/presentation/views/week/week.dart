import 'package:daylist/data/repository/subject_data_repository.dart';
import 'package:daylist/domain/state/settings/settings_state.dart';
import 'package:daylist/internal/dependencies/dependencies.dart';
import 'package:daylist/presentation/views/router.dart';
import 'package:daylist/presentation/views/widgets/list.dart';
import 'package:daylist/presentation/views/widgets/subject.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:daylist/domain/model/subject.dart';
import 'package:daylist/domain/state/week/week_state.dart';
import 'package:daylist/presentation/translations/translations.g.dart';
import 'package:daylist/presentation/utils/week_util.dart';
import 'package:daylist/presentation/views/widgets/loader.dart';

class WeekView extends HookConsumerWidget {
  const WeekView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final DateTime now = DateTime.now();
    final bool isAdmin = ref.watch(settingsProvider).isAdmin;
    final bool isEvenWeek = ref.watch(isEvenWeekProvider);
    final bool isEven = WeekUtil().isEvenWeek(now, isEvenWeek);
    final AsyncValue<List<Subject>> subjects =
        ref.watch(subjectsProvider(!isAdmin));

    return Scaffold(
        appBar: AppBar(
            leading: IconButton(
                onPressed: () => context.pop(),
                splashRadius: 20,
                icon: const Icon(Icons.arrow_back)),
            actions: isAdmin
                ? [
                    Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: IconButton(
                            onPressed: () {
                              context.goNamed(ViewsNames.addSubject);
                            },
                            splashRadius: 20,
                            icon: const Icon(Icons.add)))
                  ]
                : null,
            title: Text(isEven ? t.week.isEven[0] : t.week.isEven[1])),
        body: LoaderWidget(
            config: subjects,
            builder: (subjectsList) => CustomListWidget(
                onRefresh: () {
                  SubjectDataRepository(Dependencies().getIt.get(),
                          Dependencies().getIt.get())
                      .clear();
                },
                children: t.week.days.full.map((e) {
                  return SectionSubjectsWidget(
                      weekday: t.week.days.full.indexOf(e) + 1,
                      isEvenWeek: isEvenWeek,
                      title: e,
                      subjects: subjectsList);
                }).toList())));
  }
}
