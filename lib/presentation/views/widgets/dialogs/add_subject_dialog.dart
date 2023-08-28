import 'package:appwrite/models.dart';
import 'package:daylist/.env';
import 'package:daylist/data/api/request/add/add_subject_body.dart';
import 'package:daylist/data/repository/auth_repository.dart';
import 'package:daylist/data/repository/subject_repository.dart';
import 'package:daylist/domain/model/subject.dart';
import 'package:daylist/domain/model/teacher.dart';
import 'package:daylist/domain/model/time.dart';
import 'package:daylist/domain/model/title.dart';
import 'package:daylist/domain/state/dialogs/subject_dialog_state.dart';
import 'package:daylist/domain/state/dialogs/time_dialog_state.dart';
import 'package:daylist/domain/state/settings/settings_state.dart';
import 'package:daylist/domain/state/week/week_state.dart';
import 'package:daylist/internal/dependencies/dependencies.dart';
import 'package:daylist/presentation/extensions/theme/context.dart';
import 'package:daylist/presentation/res/values.dart';
import 'package:daylist/presentation/translations/translations.g.dart';
import 'package:daylist/presentation/utils/string_gen.dart';
import 'package:daylist/presentation/views/widgets/dialog.dart';
import 'package:daylist/presentation/views/widgets/dialogs/add_subject_title_dialog.dart';
import 'package:daylist/presentation/views/widgets/dialogs/add_teacher_dialog.dart';
import 'package:daylist/presentation/views/widgets/dialogs/add_time_dialog.dart';
import 'package:daylist/presentation/views/widgets/loader.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class AddSubjectDialog extends StatefulHookConsumerWidget {
  const AddSubjectDialog({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      __AddSubjectDialogState();
}

class __AddSubjectDialogState extends ConsumerState<AddSubjectDialog> {
  String? timeId;
  bool? isEven;
  int weekday = 1;

  Future addSubject() async {
    final User user =
        await AuthDataRepository(Dependencies().getIt.get()).getUser();
    final String? groupId = ref.watch(settingsProvider).group?.id;

    final Teacher? teacher = ref.watch(selectedTeacherProvider);
    final String? titleId = ref.watch(selectedSubjectTitleProvider);

    if (titleId != null && teacher != null && context.mounted) {
      try {
        SubjectDataRepository(
                Dependencies().getIt.get(), Dependencies().getIt.get())
            .addSubject(
                body: AddSubjectBody(
                    databaseId: databaseId,
                    collectionId: subjectsCollectionId,
                    subject: Subject(
                        id: StringGenerator.generate(),
                        teacherId: teacher.id,
                        timeId: timeId!,
                        isEven: isEven,
                        groupId: groupId!,
                        weekday: weekday,
                        createdBy: user.$id)))
            .then((value) {
          ref.invalidate(subjectsProvider);
          context.pop();
        });
      } catch (e) {
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text('$e')));
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final AsyncValue<List<SubjectTitle>> titles = ref.watch(titlesProvider);
    final AsyncValue<List<Teacher>> teachers = ref.watch(teachersProvider);
    final AsyncValue<List<Time>> times = ref.watch(timesProvider);

    final Teacher? teacher = ref.watch(selectedTeacherProvider);
    final String? titleId = ref.watch(selectedSubjectTitleProvider);

    return CustomDialog(
        title: t.selection.add,
        onSubmitted: addSubject,
        children: [
          LoaderWidget(
              config: titles,
              builder: (v) => DropdownButtonFormField(
                  icon: GestureDetector(
                      onTap: () => showDialog(
                          context: context,
                          builder: (context) => const AddSubjectTitleDialog()),
                      child:
                          Icon(Icons.add, color: context.color.primaryColor)),
                  hint: Text(t.selection.title, style: context.text.mediumText),
                  value: titleId,
                  items: v
                      .where((e) =>
                          teacher != null ? e.id == teacher.titleId : true)
                      .map((e) =>
                          DropdownMenuItem(value: e.id, child: Text(e.title)))
                      .toList(),
                  onChanged: (v) {
                    ref
                        .read(selectedSubjectTitleProvider.notifier)
                        .update((state) => v);
                    ref
                        .read(selectedTeacherProvider.notifier)
                        .update((state) => null);
                    ref.invalidate(teachersProvider);
                  })),
          LoaderWidget(
              config: teachers,
              builder: (v) => Padding(
                  padding: const EdgeInsets.only(top: Insets.small),
                  child: DropdownButtonFormField(
                      icon: GestureDetector(
                          onTap: () => showDialog(
                              context: context,
                              builder: (context) => const AddTeacherDialog()),
                          child: Icon(Icons.add,
                              color: context.color.primaryColor)),
                      hint: Text(t.selection.teacher,
                          style: context.text.mediumText),
                      value: teacher,
                      items: v
                          .where((e) =>
                              titleId != null ? e.titleId == titleId : true)
                          .map((e) => DropdownMenuItem(
                              value: e, child: Text(e.shortInitials())))
                          .toList(),
                      onChanged: (v) {
                        ref
                            .read(selectedTeacherProvider.notifier)
                            .update((state) => v);
                        if (titleId == null) {
                          ref
                              .read(selectedSubjectTitleProvider.notifier)
                              .update((state) => v!.titleId);
                        }
                      }))),
          LoaderWidget(
              config: times,
              builder: (v) => Padding(
                  padding: const EdgeInsets.only(top: Insets.small),
                  child: DropdownButtonFormField(
                      icon: GestureDetector(
                          onTap: () => showDialog(
                                  context: context,
                                  builder: (context) =>
                                      const AddTimeDialog()).then((value) {
                                ref
                                    .read(startTimeProvider.notifier)
                                    .update((state) => null);
                                ref
                                    .read(endTimeProvider.notifier)
                                    .update((state) => null);
                              }),
                          child: Icon(Icons.add,
                              color: context.color.primaryColor)),
                      hint: Text(t.selection.time,
                          style: context.text.mediumText),
                      items: v
                          .map((e) => DropdownMenuItem(
                              value: e.id,
                              child: Text('${e.start} - ${e.end}')))
                          .toList(),
                      onChanged: (v) {
                        timeId = v;
                      }))),
          Padding(
              padding: const EdgeInsets.only(top: Insets.small),
              child: DropdownButtonFormField(
                  iconEnabledColor: context.color.primaryColor,
                  iconDisabledColor: context.color.primaryColor,
                  hint: Text(t.selection.day, style: context.text.mediumText),
                  items: t.week.isEven.reversed.map((e) {
                    final int i = t.week.isEven.indexOf(e);

                    final bool? isEven = i == 0
                        ? true
                        : i == 1
                            ? false
                            : null;

                    return DropdownMenuItem(value: isEven, child: Text(e));
                  }).toList(),
                  onChanged: (v) {
                    isEven = v;
                  })),
          Padding(
              padding: const EdgeInsets.only(top: Insets.small),
              child: DropdownButtonFormField(
                  iconEnabledColor: context.color.primaryColor,
                  iconDisabledColor: context.color.primaryColor,
                  value: weekday,
                  hint: Text(t.selection.day, style: context.text.mediumText),
                  items: t.week.days.full
                      .map((e) => DropdownMenuItem(
                          value: t.week.days.full.indexOf(e) + 1,
                          child: Text(e)))
                      .toList(),
                  onChanged: (v) {
                    weekday = v!;
                  })),
        ]);
  }
}
