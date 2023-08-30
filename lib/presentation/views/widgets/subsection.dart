// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:appwrite/appwrite.dart';
import 'package:appwrite/models.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';

import 'package:daylist/.env';
import 'package:daylist/data/api/request/add/add_replacement_body.dart';
import 'package:daylist/data/api/request/delete/delete_replacement_body.dart';
import 'package:daylist/data/repository/auth_repository.dart';
import 'package:daylist/data/repository/replacement_repository.dart';
import 'package:daylist/domain/model/replacement.dart';
import 'package:daylist/domain/model/teacher.dart';
import 'package:daylist/domain/model/time.dart';
import 'package:daylist/domain/model/title.dart';
import 'package:daylist/domain/state/home/home_state.dart';
import 'package:daylist/domain/state/settings/settings_state.dart';
import 'package:daylist/internal/dependencies/dependencies.dart';
import 'package:daylist/presentation/extensions/theme/context.dart';
import 'package:daylist/presentation/translations/translations.g.dart';
import 'package:daylist/presentation/utils/generator.dart';

class SubsectionSubject {
  final Time time;

  final Teacher teacher;
  final SubjectTitle title;

  final Replacement? replacement;

  final bool isHomeView;

  final DateTime? dateTime;

  SubsectionSubject(
      {required this.time,
      required this.teacher,
      required this.title,
      this.replacement,
      this.isHomeView = false,
      this.dateTime});
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

class _Body extends HookConsumerWidget {
  final Subsection subsection;

  const _Body({
    Key? key,
    required this.subsection,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
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

    final bool isReplacement = subject.replacement != null;
    final bool isCanceled =
        isReplacement && subject.replacement!.mode == ReplacementMode.cancel;

    return ListTile(
        dense: true,
        leading: isShowTime
            ? _Leading(time: subject.time)
            : _LeadingIndex(number: subject.time.number),
        title: Text(subject.title.title,
            style: context.text.largeText.copyWith(
                color: isCanceled ? Colors.red : null,
                decoration: isCanceled ? TextDecoration.lineThrough : null)),
        subtitle: _Subtitle(teacher: subject.teacher),
        trailing: _Delete(subject: subject));
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
          Text('${teacher.classroom} ${t.subject.classroom}',
              style: context.text.mediumText),
          Text(isShortInitials ? teacher.shortInitials() : teacher.initials)
        ]);
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

class _Delete extends HookConsumerWidget {
  final SubsectionSubject subject;
  const _Delete({
    required this.subject,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final bool isChangeSchedule = ref.watch(isChangeScheduleProvider);
    final String groupId = ref.watch(settingsProvider).group!.id;

    return isChangeSchedule && subject.isHomeView
        ? IconButton(
            onPressed: () async {
              final User user =
                  await AuthDataRepository(Dependencies().getIt.get())
                      .getUser();

              if (subject.replacement != null) {
                ReplacementDataRepository(
                        Dependencies().getIt.get(), Dependencies().getIt.get())
                    .deleteReplacement(
                        body: DeleteReplacementBody(
                            databaseId: databaseId,
                            collectionId: replacementsCollectionId,
                            id: subject.replacement!.id));
              } else {
                ReplacementDataRepository(
                        Dependencies().getIt.get(), Dependencies().getIt.get())
                    .addReplacement(
                        body: AddReplacementBody(
                            databaseId: databaseId,
                            collectionId: replacementsCollectionId,
                            replacement: Replacement(
                                id: ID.custom(Generator.generateId()),
                                teacherId: subject.teacher.id,
                                groupId: groupId,
                                timeId: subject.time.id,
                                date:
                                    DateFormat.yMd().format(subject.dateTime!),
                                mode: ReplacementMode.cancel,
                                undergroup: null,
                                createdBy: user.$id)));
              }
              ref.invalidate(replacementsProvider);
            },
            splashRadius: 20,
            icon: const Icon(Icons.delete))
        : const SizedBox.shrink();
  }
}
