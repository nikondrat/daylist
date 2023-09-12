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
  final bool isDataFromStorage;
  const WeekView({super.key, this.isDataFromStorage = true});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // TODO init loading data
    // TODO add replacements and subjects view
    final DateTime now = DateTime.now();
    final bool isEven = WeekUtil.weekNumber(now).isEven;
    final AsyncValue<List<Subject>> subjects =
        ref.watch(subjectsProvider(isDataFromStorage));

    return Scaffold(
        appBar: AppBar(
            leading: IconButton(
                onPressed: () => context.pop(),
                splashRadius: 20,
                icon: const Icon(Icons.arrow_back)),
            actions: isDataFromStorage
                ? null
                : [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: IconButton(
                          onPressed: () {
                            context.goNamed(ViewsNames.addSubject);
                          },
                          splashRadius: 20,
                          icon: const Icon(Icons.add)),
                    )
                  ],
            title: Text(isEven ? t.week.isEven[0] : t.week.isEven[1])),
        body: LoaderWidget(
            config: subjects,
            builder: (subjectsList) => CustomListWidget(
                    children: t.week.days.full.map((e) {
                  return SectionSubjectsWidget(
                      weekday: t.week.days.full.indexOf(e) + 1,
                      title: e,
                      subjects: subjectsList);
                }).toList())));
  }
}
