import 'package:daylist/data/api/request/put/put_subject_body.dart';
import 'package:daylist/data/repository/subject_repository.dart';
import 'package:daylist/internal/dependencies/dependencies.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:daylist/domain/model/replacement.dart';
import 'package:daylist/domain/model/subject.dart';
import 'package:daylist/domain/model/teacher.dart';
import 'package:daylist/domain/model/time.dart';
import 'package:daylist/domain/state/settings/settings_state.dart';
import 'package:daylist/presentation/extensions/theme/context.dart';
import 'package:daylist/presentation/res/values.dart';
import 'package:daylist/presentation/translations/translations.g.dart';
import 'package:daylist/presentation/views/widgets/section.dart';

class _SubjectWidget extends StatefulWidget {
  final Time time;
  final Teacher teacher;
  final Replacement? replacement;
  final Subject? subject;

  const _SubjectWidget(
      {Key? key,
      required this.time,
      required this.teacher,
      this.replacement,
      this.subject})
      : super(key: key);

  @override
  State<_SubjectWidget> createState() => __SubjectWidgetState();
}

class __SubjectWidgetState extends State<_SubjectWidget> {
  @override
  void initState() {
    SubjectDataRepository(
            Dependencies().getIt.get(), Dependencies().getIt.get())
        .putSubject(
            body: PutSubjectBody(
                teacher: widget.teacher,
                time: widget.time,
                subject: widget.subject,
                title: widget.teacher.title));

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return _Body(
        time: widget.time,
        teacher: widget.teacher,
        replacement: widget.replacement);
  }
}

class _Body extends HookConsumerWidget {
  final Time time;
  final Teacher teacher;
  final Replacement? replacement;

  const _Body(
      {required this.time, required this.teacher, required this.replacement});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final bool isShowTime = ref.watch(settingsProvider).isShowTime;

    final bool isReplacement = replacement != null;
    final bool isCanceled =
        isReplacement && replacement!.mode == ReplacementMode.cancel;

    return ListTile(
        dense: true,
        leading: isShowTime
            ? _Leading(time: time)
            : _LeadingIndex(number: time.number),
        title: Row(children: [
          Expanded(
              child: Text(teacher.title.title,
                  style: context.text.largeText.copyWith(
                      color:
                          isCanceled ? Colors.red : context.color.primaryColor,
                      fontWeight: FontWeight.bold,
                      decoration:
                          isCanceled ? TextDecoration.lineThrough : null))),
          isReplacement
              ? _Mode(mode: replacement!.mode)
              : const SizedBox.shrink()
        ]),
        subtitle: _Subtitle(teacher: teacher));
  }
}

class _Subtitle extends HookConsumerWidget {
  final Teacher teacher;
  const _Subtitle({required this.teacher});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final bool isShortInitials = ref.watch(settingsProvider).isShortInitials;

    return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
              padding: const EdgeInsets.only(top: 2, bottom: 2),
              child: Text('${teacher.classroom} ${t.subject.classroom}',
                  style: context.text.mediumText)),
          Text(isShortInitials ? teacher.shortInitials() : teacher.initials,
              style: context.text.mediumText)
        ]);
  }
}

class _Mode extends HookConsumerWidget {
  final ReplacementMode mode;
  const _Mode({required this.mode});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final bool isDark = ref.watch(settingsProvider).isDark;
    final double radius = ref.watch(settingsProvider).radius;
    final int i = mode.index;
    const double size = 26;

    return mode != ReplacementMode.usual
        ? Container(
            height: size,
            width: size,
            decoration: BoxDecoration(
                border: Border.all(color: isDark ? Colors.white : Colors.black),
                borderRadius: BorderRadius.circular(radius / 2)),
            child: Center(
              child: Text(t.dialog.subject_mode[i][0],
                  style: context.text.smallText
                      .copyWith(color: context.color.primaryColor)),
            ))
        : const SizedBox.shrink();
  }
}

class _Leading extends HookConsumerWidget {
  final Time time;
  const _Leading({required this.time});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return RichText(
        text: TextSpan(children: [
      TextSpan(
          text: time.start,
          style: context.text.largeText.copyWith(
              color: context.color.primaryColor, fontWeight: FontWeight.bold)),
      TextSpan(text: '\n${time.end}', style: context.text.mediumText)
    ]));
  }
}

class _LeadingIndex extends HookConsumerWidget {
  final int number;
  const _LeadingIndex({required this.number});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final double radius = ref.watch(settingsProvider).radius;
    const double size = 40;

    return Container(
        width: size,
        height: size,
        decoration: BoxDecoration(
            shape: BoxShape.rectangle,
            borderRadius: BorderRadius.circular(radius),
            border: Border.all(color: context.color.primaryColor)),
        child: Center(child: Text('$number', style: context.text.mediumText)));
  }
}

class SectionSubjectsWidget extends StatelessWidget {
  final String title;
  final List<Subject>? subjects;
  final List<Replacement>? replacements;
  final int? undergroup;
  final int? weekday;
  final DateTime? dateTime;

  const SectionSubjectsWidget(
      {super.key,
      required this.title,
      this.dateTime,
      this.subjects,
      this.replacements,
      this.undergroup,
      this.weekday})
      : assert(
            subjects != null || (replacements != null && undergroup != null));

  @override
  Widget build(BuildContext context) {
    return SectionWidget(
        title: title,
        margin: const EdgeInsets.only(bottom: Insets.small),
        children: List.generate(6, (int i) => i++, growable: false).map((i) {
          Time? time;

          final Replacement? replacement = replacements?.where((r) {
            time = r.time.number == i + 1 ? r.time : null;

            final bool isThisDay = r.date.day == dateTime!.day;
            final bool myUndergroup = r.mode == ReplacementMode.laboratory
                ? r.undergroup == undergroup
                : true;

            return isThisDay && myUndergroup && time != null;
          }).firstOrNull;

          if (replacement != null) {
            return _SubjectWidget(
                time: time!,
                teacher: replacement.teacher,
                replacement: replacement);
          } else {
            final Subject? subject = subjects?.where((s) {
              time = s.time.number == i + 1 ? s.time : null;
              final bool isThisDay = dateTime != null
                  ? s.weekday == dateTime!.weekday
                  : s.weekday == weekday;

              return isThisDay && time != null;
            }).firstOrNull;

            if (subject != null) {
              return _SubjectWidget(
                  time: time!, teacher: subject.teacher, subject: subject);
            }
          }

          return const SizedBox.shrink();
        }).toList());
  }
}
