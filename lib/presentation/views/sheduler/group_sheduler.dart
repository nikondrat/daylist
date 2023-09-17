import 'package:daylist/domain/model/group.dart';
import 'package:daylist/domain/state/settings/settings_state.dart';
import 'package:daylist/domain/state/sheduler/sheduler_state.dart';
import 'package:daylist/presentation/extensions/theme/context.dart';
import 'package:daylist/presentation/translations/translations.g.dart';
import 'package:daylist/presentation/views/router.dart';
import 'package:daylist/presentation/views/widgets/list.dart';
import 'package:daylist/presentation/views/widgets/loader.dart';
import 'package:daylist/presentation/views/widgets/subject.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:unicons/unicons.dart';

class GroupShedulerView extends HookConsumerWidget {
  const GroupShedulerView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final Group group = ref.watch(selectedGroup)!;
    final int undergroup = ref.watch(settingsProvider).undergroup;
    final DateTime today = DateTime.now();
    final bool isEvenWeek = ref.watch(isEvenWeekProvider);

    return SubjectsLoaderWidget(
        isDataFromStorage: false,
        builder: (subjects, replacements) => Scaffold(
            appBar: AppBar(
                leading: IconButton(
                    onPressed: () => context.pop(),
                    splashRadius: 20,
                    icon: const Icon(Icons.arrow_back)),
                title: Text(group.title),
                actions: [
                  Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: IconButton(
                          onPressed: () =>
                              context.goNamed(ViewsNames.addReplacement),
                          splashRadius: 20,
                          icon: const Icon(Icons.add))),
                  Padding(
                      padding: const EdgeInsets.all(8),
                      child: IconButton(
                          onPressed: () =>
                              context.goNamed(ViewsNames.shedulerWeek),
                          color: context.color.primaryColor,
                          splashRadius: 20,
                          icon: const Icon(UniconsLine.schedule)))
                ]),
            body: CustomListWidget(children: [
              SectionSubjectsWidget(
                  title: t.home.today,
                  dateTime: today,
                  isShedulerView: true,
                  isEvenWeek: isEvenWeek,
                  subjects: subjects,
                  replacements: replacements,
                  undergroup: undergroup),
              SectionSubjectsWidget(
                  title: t.home.tomorrow,
                  dateTime: today.add(const Duration(days: 1)),
                  subjects: subjects,
                  isShedulerView: true,
                  isEvenWeek: isEvenWeek,
                  replacements: replacements,
                  undergroup: undergroup),
            ])));
  }
}
