import 'package:daylist/domain/model/teacher.dart';
import 'package:daylist/domain/state/dialogs/subject_dialog_state.dart';
import 'package:daylist/domain/state/week/week_state.dart';
import 'package:daylist/presentation/extensions/theme/context.dart';
import 'package:daylist/presentation/res/values.dart';
import 'package:daylist/presentation/translations/translations.g.dart';
import 'package:daylist/presentation/views/widgets/dialogs/add_teacher_dialog.dart';
import 'package:daylist/presentation/views/widgets/loader.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class TeachersDropdownWidget extends HookConsumerWidget {
  const TeachersDropdownWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final AsyncValue<List<Teacher>> teachers = ref.watch(teachersProvider);
    final Teacher? teacher = ref.watch(selectedTeacherProvider);
    final String? titleId = ref.watch(selectedSubjectTitleProvider);

    return LoaderWidget(
        config: teachers,
        builder: (v) => Padding(
            padding: const EdgeInsets.only(top: Insets.small),
            child: DropdownButtonFormField(
                icon: GestureDetector(
                    onTap: () => showDialog(
                        context: context,
                        builder: (context) => const AddTeacherDialog()),
                    child: Icon(Icons.add, color: context.color.primaryColor)),
                hint: Text(t.selection.teacher, style: context.text.mediumText),
                value: teacher,
                items: v
                    .where((e) => titleId != null ? e.titleId == titleId : true)
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
                })));
  }
}
