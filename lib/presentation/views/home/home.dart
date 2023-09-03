import 'package:daylist/domain/state/settings/settings_state.dart';
import 'package:daylist/presentation/extensions/theme/context.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:unicons/unicons.dart';

import 'package:daylist/domain/model/replacement.dart';
import 'package:daylist/domain/model/subject.dart';
import 'package:daylist/domain/model/teacher.dart';
import 'package:daylist/domain/model/time.dart';
import 'package:daylist/domain/model/title.dart';
import 'package:daylist/domain/state/dialogs/subject_dialog_state.dart';
import 'package:daylist/domain/state/home/home_state.dart';
import 'package:daylist/domain/state/week/week_state.dart';
import 'package:daylist/presentation/res/values.dart';
import 'package:daylist/presentation/translations/translations.g.dart';
import 'package:daylist/presentation/views/router.dart';
import 'package:daylist/presentation/views/widgets/dialogs/add_replacement_dialog.dart';
import 'package:daylist/presentation/views/widgets/loader.dart';
import 'package:daylist/presentation/views/widgets/section.dart';
import 'package:daylist/presentation/views/widgets/subsection.dart';

class HomeView extends HookConsumerWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return _Loader(
        builder: (times, titles, teachers, subjects, replacements) => _Body(
            times: times,
            titles: titles,
            teachers: teachers,
            subjects: subjects,
            replacements: replacements));
  }
}

class _Loader extends HookConsumerWidget {
  final Widget Function(
      List<Time> times,
      List<SubjectTitle> titles,
      List<Teacher> teachers,
      List<Subject> subjects,
      List<Replacement> replacements) builder;
  const _Loader({required this.builder});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final AsyncValue<List<Time>> times = ref.watch(timesProvider);
    final AsyncValue<List<SubjectTitle>> titles = ref.watch(titlesProvider);
    final AsyncValue<List<Teacher>> teachers = ref.watch(teachersProvider);
    final AsyncValue<List<Subject>> subjects = ref.watch(subjectsProvider);
    final AsyncValue<List<Replacement>> replacements =
        ref.watch(replacementsProvider);

    return Material(
        color: context.color.backgroundColor,
        child: LoaderWidget(
            config: times,
            builder: (timesList) => LoaderWidget(
                config: titles,
                builder: (titlesList) => LoaderWidget(
                    config: teachers,
                    builder: (teachersList) => LoaderWidget(
                        config: subjects,
                        builder: (subjectsList) => LoaderWidget(
                            config: replacements,
                            builder: (replacementsList) => builder(
                                timesList,
                                titlesList,
                                teachersList,
                                subjectsList,
                                replacementsList)))))));
  }
}

class _Body extends HookConsumerWidget {
  final List<Time> times;
  final List<SubjectTitle> titles;
  final List<Teacher> teachers;
  final List<Subject> subjects;
  final List<Replacement> replacements;

  const _Body({
    Key? key,
    required this.times,
    required this.titles,
    required this.teachers,
    required this.subjects,
    required this.replacements,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final DateTime now = DateTime.now();
    final DateTime tomorrow = now.add(const Duration(days: 1));

    final int undergroup = ref.watch(settingsProvider).undergroup;

    return Scaffold(
        appBar: AppBar(
            leading: IconButton(
                onPressed: () => context.goNamed(ViewsNames.settings),
                splashRadius: 20,
                icon: const Icon(UniconsLine.setting)),
            title: Text(t.settings.app_name),
            actions: [
              Padding(
                  padding: const EdgeInsets.all(Insets.small / 2),
                  child: IconButton(
                      onPressed: () => context.goNamed(ViewsNames.week),
                      color: context.color.primaryColor,
                      splashRadius: 20,
                      icon: const Icon(UniconsLine.schedule))),
            ]),
        body: ScrollConfiguration(
            behavior: ScrollConfiguration.of(context).copyWith(dragDevices: {
              PointerDeviceKind.mouse,
              PointerDeviceKind.touch
            }),
            child: ListView(
                physics: const BouncingScrollPhysics(),
                padding: const EdgeInsets.symmetric(horizontal: Insets.small),
                children: [
                  _SubjectsSection(
                      title:
                          '${t.home.today}, ${now.day} ${t.week.days.short[now.weekday - 1]}',
                      dateTime: now,
                      times: times,
                      titles: titles,
                      subjects: subjects,
                      teachers: teachers,
                      undergroup: undergroup,
                      replacements: replacements),
                  _SubjectsSection(
                      title:
                          '${t.home.tomorrow}, ${tomorrow.day} ${t.week.days.short[tomorrow.weekday - 1]}',
                      dateTime: tomorrow,
                      times: times,
                      titles: titles,
                      subjects: subjects,
                      teachers: teachers,
                      undergroup: undergroup,
                      replacements: replacements)
                ])));
  }
}

class _SubjectsSection extends HookConsumerWidget {
  final String title;
  final DateTime dateTime;
  final List<Time> times;
  final List<SubjectTitle> titles;
  final List<Teacher> teachers;
  final List<Subject> subjects;
  final int? undergroup;
  final List<Replacement> replacements;

  const _SubjectsSection({
    Key? key,
    required this.title,
    required this.dateTime,
    required this.times,
    required this.titles,
    required this.teachers,
    required this.subjects,
    required this.replacements,
    required this.undergroup,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final bool isChange = ref.watch(isChangeScheduleProvider);

    return Padding(
        padding: const EdgeInsets.only(bottom: Insets.small),
        child: SectionWidget(title: title, actions: [
          InkWell(
              onTap: () {
                ref
                    .read(isChangeScheduleProvider.notifier)
                    .update((state) => !state);
              },
              child:
                  isChange ? const Icon(Icons.close) : const Icon(Icons.edit))
        ], children: [
          _Items(
              title: title,
              dateTime: dateTime,
              times: times,
              titles: titles,
              teachers: teachers,
              subjects: subjects,
              undergroup: undergroup,
              replacements: replacements),
          isChange
              ? Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: Insets.small, vertical: Insets.small / 2),
                  child: Row(children: [
                    Expanded(
                        child: TextButton(
                            onPressed: () {
                              showDialog(
                                  context: context,
                                  builder: (context) => AddReplacementDialog(
                                      dateTime: dateTime)).then((value) {
                                ref
                                    .read(selectedTeacherProvider.notifier)
                                    .update((state) => null);
                                ref
                                    .read(selectedSubjectTitleProvider.notifier)
                                    .update((state) => null);
                              });
                            },
                            child: Text(t.selection.add))),
                  ]))
              : const SizedBox.shrink()
        ]));
  }
}

class _Items extends StatelessWidget {
  final String title;
  final DateTime dateTime;
  final List<Time> times;
  final List<SubjectTitle> titles;
  final List<Teacher> teachers;
  final List<Subject> subjects;
  final List<Replacement> replacements;
  final int? undergroup;

  const _Items(
      {Key? key,
      required this.title,
      required this.dateTime,
      required this.times,
      required this.titles,
      required this.teachers,
      required this.subjects,
      required this.replacements,
      required this.undergroup})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
        children: List.generate(6, (int i) => i++, growable: false).map((s) {
      final List<Time>? timesList =
          times.where((e) => e.number == s + 1).isNotEmpty
              ? times.where((e) => e.number == s + 1).toList()
              : null;

      if (timesList != null) {
        Time? time;

        final Replacement? replacement = replacements.where((r) {
          time = timesList.where((t) => t.id == r.timeId).firstOrNull;

          final bool isThisDay =
              int.parse(r.date.split('/')[1]) == dateTime.day;
          final bool myUndergroup = r.mode == ReplacementMode.laboratory
              ? r.undergroup == undergroup
              : true;

          return isThisDay && myUndergroup && time != null;
        }).firstOrNull;

        final Subject? subject = subjects.where((s) {
          time = timesList.where((t) => t.id == s.timeId).firstOrNull;
          final bool isThisDay = s.weekday == dateTime.weekday;

          return isThisDay && time != null;
        }).firstOrNull;

        if (subject != null || replacement != null) {
          final Teacher teacher = teachers.firstWhere((e) => replacement != null
              ? e.id == replacement.teacherId
              : e.id == subject!.teacherId);
          final SubjectTitle title =
              titles.firstWhere((e) => e.id == teacher.titleId);

          return SubsectionWidget(
              subsectionSubject: SubsectionSubject(
                  time: time ??
                      Time(
                          id: '', start: '', end: '', number: 0, createdBy: ''),
                  teacher: teacher,
                  isHomeView: true,
                  title: title,
                  dateTime: dateTime,
                  replacement: replacement));
        }
      }

      return const SizedBox.shrink();
    }).toList());
  }
}
