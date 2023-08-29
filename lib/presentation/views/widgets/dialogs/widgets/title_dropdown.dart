import 'package:daylist/domain/model/teacher.dart';
import 'package:daylist/domain/model/title.dart';
import 'package:daylist/domain/state/dialogs/subject_dialog_state.dart';
import 'package:daylist/domain/state/week/week_state.dart';
import 'package:daylist/presentation/extensions/theme/context.dart';
import 'package:daylist/presentation/translations/translations.g.dart';
import 'package:daylist/presentation/views/widgets/dialogs/add_subject_title_dialog.dart';
import 'package:daylist/presentation/views/widgets/loader.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class TitleDropdownWidget extends HookConsumerWidget {
  const TitleDropdownWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final AsyncValue<List<SubjectTitle>> titles = ref.watch(titlesProvider);
    final Teacher? teacher = ref.watch(selectedTeacherProvider);
    final String? titleId = ref.watch(selectedSubjectTitleProvider);

    return LoaderWidget(
        config: titles,
        builder: (v) => DropdownButtonFormField(
            icon: GestureDetector(
                onTap: () => showDialog(
                            context: context,
                            builder: (context) => const AddSubjectTitleDialog())
                        .then((value) {
                      ref
                          .read(selectedTeacherProvider.notifier)
                          .update((state) => null);
                      ref
                          .read(selectedSubjectTitleProvider.notifier)
                          .update((state) => null);
                    }),
                child: Icon(Icons.add, color: context.color.primaryColor)),
            hint: Text(t.selection.title, style: context.text.mediumText),
            value: titleId,
            items: v
                .where((e) => teacher != null ? e.id == teacher.titleId : true)
                .map((e) => DropdownMenuItem(value: e.id, child: Text(e.title)))
                .toList(),
            onChanged: (v) {
              ref
                  .read(selectedSubjectTitleProvider.notifier)
                  .update((state) => v);
              ref
                  .read(selectedTeacherProvider.notifier)
                  .update((state) => null);
              ref.invalidate(teachersProvider);
            }));
  }
}
