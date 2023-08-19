// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:daylist/presentation/extensions/context.dart';
import 'package:daylist/presentation/views/widgets/dialog.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:daylist/domain/model/subject.dart';
import 'package:daylist/domain/model/teacher.dart';
import 'package:daylist/domain/model/time.dart';
import 'package:daylist/domain/model/title.dart';
import 'package:daylist/domain/state/week/week_state.dart';
import 'package:daylist/presentation/res/values.dart';
import 'package:daylist/presentation/translations/translations.g.dart';
import 'package:daylist/presentation/utils/week_util.dart';
import 'package:daylist/presentation/views/widgets/loader.dart';
import 'package:daylist/presentation/views/widgets/section.dart';
import 'package:daylist/presentation/views/widgets/subsection.dart';

class WeekView extends StatelessWidget {
  const WeekView({super.key});

  @override
  Widget build(BuildContext context) {
    final DateTime now = DateTime.now();
    final bool isEven = WeekUtil.weekNumber(now).isEven;

    return Scaffold(
        appBar: AppBar(
            title: Text(isEven ? t.week.isEven[0] : t.week.isEven[1]),
            actions: [
              Padding(
                  padding: const EdgeInsets.only(right: Insets.small),
                  child: IconButton(
                      onPressed: () => showDialog(
                          context: context,
                          builder: (context) => const _AddSubjectDialog()),
                      icon: const Icon(Icons.add)))
            ]),
        body: _Loader(
            builder: (times, titles, teachers, subjects) => _Body(
                times: times,
                titles: titles,
                teachers: teachers,
                subjects: subjects)));
  }
}

class _Loader extends HookConsumerWidget {
  final Widget Function(
      List<Time>, List<SubjectTitle>, List<Teacher>, List<Subject>) builder;
  const _Loader({required this.builder});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final AsyncValue<List<Time>> times = ref.watch(timesProvider);
    final AsyncValue<List<SubjectTitle>> titles = ref.watch(titlesProvider);
    final AsyncValue<List<Teacher>> teachers = ref.watch(teachersProvider);
    final AsyncValue<List<Subject>> subjects = ref.watch(subjectsProvider);

    return LoaderWidget(
        config: times,
        builder: (timesList) => LoaderWidget(
            config: titles,
            builder: (titlesList) => LoaderWidget(
                config: teachers,
                builder: (teachersList) => LoaderWidget(
                    config: subjects,
                    builder: (subjectsList) => builder(
                        timesList, titlesList, teachersList, subjectsList)))));
  }
}

class _Body extends StatelessWidget {
  final List<Time> times;
  final List<SubjectTitle> titles;
  final List<Teacher> teachers;
  final List<Subject> subjects;

  const _Body({
    Key? key,
    required this.times,
    required this.titles,
    required this.teachers,
    required this.subjects,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScrollConfiguration(
        behavior: ScrollConfiguration.of(context).copyWith(
            dragDevices: {PointerDeviceKind.mouse, PointerDeviceKind.touch}),
        child: ListView(
            physics: const BouncingScrollPhysics(),
            padding: const EdgeInsets.symmetric(horizontal: Insets.small),
            children: t.week.days.full
                .map((e) => _Item(
                    title: e,
                    times: times,
                    titles: titles,
                    teachers: teachers,
                    subjects: subjects))
                .toList()));
  }
}

class _Item extends StatelessWidget {
  final String title;
  final List<Time> times;
  final List<SubjectTitle> titles;
  final List<Teacher> teachers;
  final List<Subject> subjects;
  const _Item({
    Key? key,
    required this.title,
    required this.times,
    required this.titles,
    required this.teachers,
    required this.subjects,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final DateTime now = DateTime.now();
    final int weekday = t.week.days.full.indexOf(title);

    return SectionWidget(
        title: title,
        margin: const EdgeInsets.only(bottom: Insets.small),
        children: subjects
            .where((e) =>
                e.weekday == weekday &&
                (e.isEven == null ||
                    e.isEven == WeekUtil.weekNumber(now).isEven))
            .map((s) {
          final Time time = times.firstWhere((e) => e.id == s.timeId);
          final Teacher teacher =
              teachers.firstWhere((e) => e.id == s.teacherId);
          final SubjectTitle title =
              titles.firstWhere((e) => e.id == teacher.titleId);

          return SubsectionWidget(
              subsectionSubject: SubsectionSubject(
                  time: time, teacher: teacher, title: title));
        }).toList());
  }
}

class _AddSubjectDialog extends StatefulHookConsumerWidget {
  const _AddSubjectDialog();

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      __AddSubjectDialogState();
}

class __AddSubjectDialogState extends ConsumerState<_AddSubjectDialog> {
  Future addSubject() async {}

  @override
  Widget build(BuildContext context) {
    final AsyncValue<List<SubjectTitle>> titles = ref.watch(titlesProvider);
    final AsyncValue<List<Teacher>> teachers = ref.watch(teachersProvider);
    final AsyncValue<List<Time>> times = ref.watch(timesProvider);

    return CustomDialog(
        title: t.selection.add,
        onSubmitted: addSubject,
        children: [
          LoaderWidget(
              config: titles,
              builder: (v) => DropdownButtonFormField(
                  hint: Text(t.selection.title, style: context.text.mediumText),
                  items: v
                      .map((e) =>
                          DropdownMenuItem(value: e.id, child: Text(e.title)))
                      .toList(),
                  onChanged: (v) {})),
          LoaderWidget(
              config: teachers,
              builder: (v) => Padding(
                  padding: const EdgeInsets.only(top: Insets.small),
                  child: DropdownButtonFormField(
                      hint: Text(t.selection.teacher,
                          style: context.text.mediumText),
                      items: v
                          .map((e) => DropdownMenuItem(
                              value: e.id, child: Text(e.shortInitials())))
                          .toList(),
                      onChanged: (v) {}))),
          LoaderWidget(
              config: times,
              builder: (v) => Padding(
                  padding: const EdgeInsets.only(top: Insets.small),
                  child: DropdownButtonFormField(
                      hint: Text(t.selection.time,
                          style: context.text.mediumText),
                      items: v
                          .map((e) => DropdownMenuItem(
                              value: e.id,
                              child: Text('${e.start} - ${e.end}')))
                          .toList(),
                      onChanged: (v) {}))),
          Padding(
              padding: const EdgeInsets.only(top: Insets.small),
              child: DropdownButtonFormField(
                  hint: Text(t.selection.day, style: context.text.mediumText),
                  items: t.week.days.full
                      .map((e) => DropdownMenuItem(
                          value: t.week.days.full.indexOf(e) + 1,
                          child: Text(e)))
                      .toList(),
                  onChanged: (v) {})),
        ]);
  }
}
