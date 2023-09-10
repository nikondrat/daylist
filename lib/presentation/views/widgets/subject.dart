import 'package:daylist/domain/model/subject.dart';
import 'package:daylist/presentation/res/values.dart';
import 'package:daylist/presentation/views/widgets/section.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:daylist/domain/model/replacement.dart';
import 'package:daylist/domain/model/teacher.dart';
import 'package:daylist/domain/model/time.dart';
import 'package:daylist/domain/model/title.dart';
import 'package:daylist/domain/state/settings/settings_state.dart';
import 'package:daylist/presentation/extensions/theme/context.dart';
import 'package:daylist/presentation/translations/translations.g.dart';

class _SubjectWidget extends HookConsumerWidget {
  final Time time;
  final Teacher teacher;
  final SubjectTitle title;
  final Replacement? replacement;
  final DateTime? dateTime;

  const _SubjectWidget({
    required this.time,
    required this.teacher,
    required this.title,
    this.replacement,
    this.dateTime,
  });

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
        title: Row(
          children: [
            Expanded(
                child: Text(title.title,
                    style: context.text.largeText.copyWith(
                        color: isCanceled
                            ? Colors.red
                            : context.color.primaryColor,
                        fontWeight: FontWeight.bold,
                        decoration:
                            isCanceled ? TextDecoration.lineThrough : null))),
            _Mode(mode: replacement!.mode)
          ],
        ),
        subtitle: _Subtitle(teacher: teacher, mode: replacement!.mode));
  }
}

class _Subtitle extends HookConsumerWidget {
  final Teacher teacher;
  final ReplacementMode mode;
  const _Subtitle({required this.teacher, required this.mode});

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
  final DateTime dateTime;
  final List<Subject> subjects;
  final List<Replacement> replacements;
  final int undergroup;

  const SectionSubjectsWidget({
    Key? key,
    required this.title,
    required this.dateTime,
    required this.subjects,
    required this.replacements,
    required this.undergroup,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SectionWidget(
        title: title,
        margin: const EdgeInsets.only(bottom: Insets.small),
        children: List.generate(6, (int i) => i++, growable: false).map((s) {
          Time? time;

          final Replacement? replacement = replacements.where((r) {
            time = r.time.number == s + 1 ? r.time : null;

            final bool isThisDay = r.date.day == dateTime.day;
            final bool myUndergroup = r.mode == ReplacementMode.laboratory
                ? r.undergroup == undergroup
                : true;

            return isThisDay && myUndergroup && time != null;
          }).firstOrNull;

          // TODO

          // final Subject? subject = subjects.where((s) {
          //   // time = timesList.where((t) => t.id == s.timeId).firstOrNull;
          //   final bool isThisDay = s.weekday == dateTime.weekday;

          //   return isThisDay && time != null;
          // }).firstOrNull;

          if (
              // subject != null ||
              replacement != null) {
            return _SubjectWidget(
                time: time!,
                teacher: replacement.teacher,
                replacement: replacement,
                dateTime: dateTime,
                title: replacement.teacher.title);

            // return SubsectionWidget(
            //     subsection: Subsection(
            //         title: title,
            //         subject: SubsectionSubject(
            //             time: time ??
            //                 Time(
            //                     id: '',
            //                     start: '',
            //                     end: '',
            //                     number: 0,
            //                     createdBy: ''),
            //             teacher: replacement!.teacher,
            //             title: replacement.teacher.title,
            //             dateTime: dateTime,
            //             replacement: replacement)));
          }

          return const SizedBox.shrink();
        }).toList());
  }
}
