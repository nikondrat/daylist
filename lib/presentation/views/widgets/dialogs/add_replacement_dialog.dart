import 'package:appwrite/appwrite.dart';
import 'package:appwrite/models.dart';
import 'package:daylist/data/api/request/add/add_replacement_body.dart';
import 'package:daylist/data/repository/auth_repository.dart';
import 'package:daylist/data/repository/replacement_repository.dart';
import 'package:daylist/domain/model/group.dart';
import 'package:daylist/domain/model/replacement.dart';
import 'package:daylist/domain/model/teacher.dart';
import 'package:daylist/domain/model/time.dart';
import 'package:daylist/domain/model/title.dart';
import 'package:daylist/domain/state/dialogs/subject_dialog_state.dart';
import 'package:daylist/domain/state/home/home_state.dart';
import 'package:daylist/domain/state/settings/settings_state.dart';
import 'package:daylist/internal/dependencies/dependencies.dart';
import 'package:daylist/presentation/extensions/theme/context.dart';
import 'package:daylist/presentation/res/values.dart';
import 'package:daylist/presentation/translations/translations.g.dart';
import 'package:daylist/presentation/utils/generator.dart';
import 'package:daylist/presentation/views/widgets/dialog.dart';
import 'package:daylist/presentation/views/widgets/dialogs/widgets/teachers_dropdown.dart';
import 'package:daylist/presentation/views/widgets/dialogs/widgets/time_dropdown.dart';
import 'package:daylist/presentation/views/widgets/dialogs/widgets/title_dropdown.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class AddReplacementDialog extends StatefulHookConsumerWidget {
  final DateTime dateTime;
  const AddReplacementDialog({super.key, required this.dateTime});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _AddReplacementDialog();
}

class _AddReplacementDialog extends ConsumerState<AddReplacementDialog> {
  Future addReplacement() async {
    final User user =
        await AuthDataRepository(Dependencies().getIt.get()).getUser();
    final Group? group = ref.watch(settingsProvider).group;
    final Time? time = ref.watch(selectedTimeProvider);
    final Teacher? teacher = ref.watch(selectedTeacherProvider);
    final SubjectTitle? titleId = ref.watch(selectedSubjectTitleProvider);
    final int? selectedUndergroup = ref.watch(selectedUndergroupProvider);
    final ReplacementMode mode = ref.watch(selectedModeProvider);

    if (titleId != null && teacher != null && time != null && context.mounted) {
      try {
        ReplacementDataRepository(Dependencies().getIt.get())
            .addReplacement(
                body: AddReplacementBody(
                    databaseId: dotenv.env['const databaseId']!,
                    collectionId: dotenv.env['const replacementsCollectionId']!,
                    replacement: Replacement(
                        id: ID.custom(Generator.generateId()),
                        time: time,
                        teacher: teacher,
                        groupId: group!.id,
                        date: widget.dateTime,
                        mode: mode,
                        undergroup: mode == ReplacementMode.laboratory
                            ? selectedUndergroup
                            : null,
                        createdBy: user.$id)))
            .then((value) {
          ref.invalidate(replacementsProvider);

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
    List<ReplacementMode> mods = List.from(ReplacementMode.values);
    mods.removeLast();
    final ReplacementMode mode = ref.watch(selectedModeProvider);
    final int? selectedUndergroup = ref.watch(selectedUndergroupProvider);

    return CustomDialog(
        title: t.selection.add,
        onSubmitted: addReplacement,
        children: [
          const TitleDropdownWidget(),
          const TeachersDropdownWidget(),
          const TimeDropdownWidget(),
          Padding(
              padding: const EdgeInsets.only(top: Insets.small),
              child: DropdownButtonFormField(
                  isExpanded: true,
                  iconEnabledColor: context.color.primaryColor,
                  iconDisabledColor: context.color.primaryColor,
                  value: mode,
                  hint: Text(t.selection.day, style: context.text.mediumText),
                  items: mods.map((e) {
                    final String title = t.dialog.subject_mode[e.index];

                    return DropdownMenuItem(value: e, child: Text(title));
                  }).toList(),
                  onChanged: (v) {
                    ref
                        .read(selectedModeProvider.notifier)
                        .update((state) => v!);
                  })),
          mode == ReplacementMode.laboratory
              ? Padding(
                  padding: const EdgeInsets.only(top: Insets.small),
                  child: DropdownButtonFormField(
                      isExpanded: true,
                      iconEnabledColor: context.color.primaryColor,
                      iconDisabledColor: context.color.primaryColor,
                      value: selectedUndergroup,
                      items:
                          List.generate(2, (index) => index++, growable: false)
                              .map((e) => DropdownMenuItem(
                                  value: e + 1, child: Text('${e + 1}')))
                              .toList(),
                      hint: Text(t.settings.undergroup,
                          style: context.text.mediumText),
                      onChanged: (v) {
                        ref
                            .read(selectedUndergroupProvider.notifier)
                            .update((state) => v!);
                      }))
              : const SizedBox.shrink()
        ]);
  }
}
