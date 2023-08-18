// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:unicons/unicons.dart';

import 'package:daylist/domain/model/replacement.dart';
import 'package:daylist/domain/model/teacher.dart';
import 'package:daylist/domain/model/time.dart';
import 'package:daylist/domain/model/title.dart';
import 'package:daylist/domain/state/home/home_state.dart';
import 'package:daylist/domain/state/week/week_state.dart';
import 'package:daylist/presentation/extensions/context.dart';
import 'package:daylist/presentation/res/values.dart';
import 'package:daylist/presentation/translations/translations.g.dart';
import 'package:daylist/presentation/views/router.dart';
import 'package:daylist/presentation/views/widgets/loader.dart';
import 'package:daylist/presentation/views/widgets/section.dart';
import 'package:daylist/presentation/views/widgets/subsection.dart';

class HomeView extends HookConsumerWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return _Loader(
        builder: (times, titles, teachers, replacements) => _Body(
            times: times,
            titles: titles,
            teachers: teachers,
            replacements: replacements));
  }
}

class _Loader extends HookConsumerWidget {
  final Widget Function(List<Time> times, List<SubjectTitle> titles,
      List<Teacher> teachers, List<Replacement> replacements) builder;
  const _Loader({required this.builder});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final AsyncValue<List<Time>> times = ref.watch(timesProvider);
    final AsyncValue<List<SubjectTitle>> titles = ref.watch(titlesProvider);
    final AsyncValue<List<Teacher>> teachers = ref.watch(teachersProvider);
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
                        config: replacements,
                        builder: (replacementsList) => builder(timesList,
                            titlesList, teachersList, replacementsList))))));
  }
}

class _Body extends StatelessWidget {
  final List<Time> times;
  final List<SubjectTitle> titles;
  final List<Teacher> teachers;
  final List<Replacement> replacements;

  const _Body({
    Key? key,
    required this.times,
    required this.titles,
    required this.teachers,
    required this.replacements,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final DateTime now = DateTime.now();

    return Scaffold(
        appBar: AppBar(
            leading: IconButton(
                onPressed: () => context.goNamed(ViewsNames.settings),
                icon: const Icon(UniconsLine.setting)),
            title: Text(t.settings.app_name),
            actions: [
              Padding(
                  padding: const EdgeInsets.all(Insets.small / 2),
                  child: IconButton(
                      onPressed: () => context.goNamed(ViewsNames.week),
                      color: context.color.primaryColor,
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
                      title: t.home.today,
                      dateTime: now,
                      times: times,
                      titles: titles,
                      teachers: teachers,
                      replacements: replacements),
                  _SubjectsSection(
                      title: t.home.tomorrow,
                      dateTime: now.add(const Duration(days: 1)),
                      times: times,
                      titles: titles,
                      teachers: teachers,
                      replacements: replacements)
                ])));
  }
}

class _SubjectsSection extends StatelessWidget {
  final String title;
  final DateTime dateTime;
  final List<Time> times;
  final List<SubjectTitle> titles;
  final List<Teacher> teachers;
  final List<Replacement> replacements;

  const _SubjectsSection({
    Key? key,
    required this.title,
    required this.dateTime,
    required this.times,
    required this.titles,
    required this.teachers,
    required this.replacements,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.only(bottom: Insets.small),
        child: SectionWidget(
            title: title,
            children: replacements
                .where((e) =>
                    int.parse(e.date.split('.').first) == dateTime.weekday)
                .map((r) {
              final Time time = times.firstWhere((e) => e.id == r.timeId);
              final Teacher teacher =
                  teachers.firstWhere((e) => e.id == r.teacherId);
              final SubjectTitle title =
                  titles.firstWhere((e) => e.id == teacher.titleId);

              return SubsectionWidget(
                  subsectionSubject: SubsectionSubject(
                      time: time, teacher: teacher, title: title));
            }).toList()));
  }
}
