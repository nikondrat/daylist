import 'package:appwrite/models.dart';
import 'package:daylist/.env';
import 'package:daylist/data/api/request/add/add_subject_body.dart';
import 'package:daylist/data/repository/auth_repository.dart';
import 'package:daylist/data/repository/subject_repository.dart';
import 'package:daylist/domain/model/subject.dart';
import 'package:daylist/domain/model/teacher.dart';
import 'package:daylist/domain/state/dialogs/subject_dialog_state.dart';
import 'package:daylist/domain/state/settings/settings_state.dart';
import 'package:daylist/domain/state/week/week_state.dart';
import 'package:daylist/internal/dependencies/dependencies.dart';
import 'package:daylist/presentation/extensions/theme/context.dart';
import 'package:daylist/presentation/res/values.dart';
import 'package:daylist/presentation/translations/translations.g.dart';
import 'package:daylist/presentation/utils/string_gen.dart';
import 'package:daylist/presentation/views/widgets/dialog.dart';
import 'package:daylist/presentation/views/widgets/dialogs/widgets/teachers_dropdown.dart';
import 'package:daylist/presentation/views/widgets/dialogs/widgets/time_dropdown.dart';
import 'package:daylist/presentation/views/widgets/dialogs/widgets/title_dropdown.dart';
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
    return CustomDialog(
        title: t.selection.add,
        onSubmitted: addSubject,
        children: [
          const TitleDropdownWidget(),
          const TeachersDropdownWidget(),
          TimeDropdownWidget(onSelected: (v) => timeId = v),
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
