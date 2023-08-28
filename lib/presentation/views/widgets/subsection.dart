import 'package:daylist/domain/state/settings/settings_state.dart';
import 'package:daylist/presentation/translations/translations.g.dart';
import 'package:flutter/material.dart';

import 'package:daylist/domain/model/replacement.dart';
import 'package:daylist/domain/model/subject.dart';
import 'package:daylist/domain/model/teacher.dart';
import 'package:daylist/domain/model/time.dart';
import 'package:daylist/domain/model/title.dart';
import 'package:daylist/presentation/extensions/theme/context.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class SubsectionSubject {
  final Time time;

  final Teacher teacher;
  final SubjectTitle title;

  final Replacement? replacement;
  final Subject? subject;

  SubsectionSubject({
    required this.time,
    required this.teacher,
    required this.title,
    this.replacement,
    this.subject,
  }) : assert(replacement == null || subject == null);
}

class Subsection {
  final Function()? onTap;
  final Icon? icon;
  final String title;
  final List<Widget>? trailing;

  Subsection({
    this.onTap,
    this.icon,
    required this.title,
    this.trailing,
  });
}

class SubsectionWidget extends StatelessWidget {
  final Subsection? subsection;
  final SubsectionSubject? subsectionSubject;

  const SubsectionWidget({
    super.key,
    this.subsection,
    this.subsectionSubject,
  }) : assert(subsection == null || subsectionSubject == null);

  @override
  Widget build(BuildContext context) {
    return subsection != null
        ? _Body(subsection: subsection!)
        : _Subject(subject: subsectionSubject!);
  }
}

class _Body extends StatelessWidget {
  final Subsection subsection;

  const _Body({
    Key? key,
    required this.subsection,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
        onTap: subsection.onTap,
        leading: subsection.icon,
        title: Text(subsection.title),
        minLeadingWidth: 0,
        iconColor: context.color.primaryColor,
        trailing: subsection.trailing != null
            ? Row(
                mainAxisSize: MainAxisSize.min, children: subsection.trailing!)
            : null);
  }
}

class _Subject extends HookConsumerWidget {
  final SubsectionSubject subject;
  const _Subject({required this.subject});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final bool isShowTime = ref.watch(settingsProvider).isShowTime;

    return ListTile(
        dense: true,
        leading: isShowTime
            ? _Leading(time: subject.time)
            : _LeadingIndex(number: subject.time.number),
        title: Text(subject.title.title, style: context.text.largeText),
        subtitle: _Subtitle(teacher: subject.teacher));
  }
}

class _Subtitle extends HookConsumerWidget {
  final Teacher teacher;
  const _Subtitle({required this.teacher});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text('${teacher.classroom} ${t.subject.classroom}',
              style: context.text.mediumText),
          Text(teacher.initials)
        ]);
  }
}

class _Leading extends HookConsumerWidget {
  final Time time;
  const _Leading({required this.time});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Text('${time.start}\n${time.end}');
  }
}

class _LeadingIndex extends StatelessWidget {
  final int number;
  const _LeadingIndex({required this.number});

  @override
  Widget build(BuildContext context) {
    const double size = 40;

    return Container(
        width: size,
        height: size,
        decoration: BoxDecoration(
            shape: BoxShape.rectangle,
            borderRadius: BorderRadius.circular(context.value.radius),
            border: Border.all(color: context.color.primaryColor)),
        child: Center(child: Text('$number', style: context.text.mediumText)));
  }
}
