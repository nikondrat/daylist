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
import 'package:daylist/presentation/views/widgets/dialogs/widgets/teachers_dropdown.dart';
import 'package:daylist/presentation/views/widgets/dialogs/widgets/time_dropdown.dart';
import 'package:daylist/presentation/views/widgets/dialogs/widgets/title_dropdown.dart';
import 'package:daylist/presentation/views/widgets/list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class AddReplacementView extends StatefulHookConsumerWidget {
  const AddReplacementView({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _AddReplacementViewState();
}

class _AddReplacementViewState extends ConsumerState<AddReplacementView> {
  DateTime? dateTime;

  Future addReplacement() async {
    final User user =
        await AuthDataRepository(Dependencies().getIt.get()).getUser();
    final Group? group = ref.watch(settingsProvider).group;
    final Time? time = ref.watch(selectedTimeProvider);
    final Teacher? teacher = ref.watch(selectedTeacherProvider);
    final SubjectTitle? titleId = ref.watch(selectedSubjectTitleProvider);
    final int? selectedUndergroup = ref.watch(selectedUndergroupProvider);
    final ReplacementMode mode = ref.watch(selectedModeProvider);

    if (titleId != null &&
        teacher != null &&
        time != null &&
        dateTime != null &&
        context.mounted) {
      try {
        ReplacementDataRepository(Dependencies().getIt.get())
            .addReplacement(
                body: AddReplacementBody(
                    databaseId: dotenv.env['databaseId']!,
                    collectionId: dotenv.env['replacementsCollectionId']!,
                    replacement: Replacement(
                        id: ID.custom(Generator.generateId()),
                        time: time,
                        teacher: teacher,
                        groupId: group!.id,
                        date: dateTime!,
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

    return Scaffold(
      appBar: AppBar(
          title: Text(t.selection.add),
          leading: IconButton(
              onPressed: () => context.pop(),
              splashRadius: 20,
              icon: const Icon(Icons.arrow_back)),
          actions: [
            Padding(
                padding: const EdgeInsets.all(8.0),
                child: IconButton(
                    onPressed: addReplacement,
                    splashRadius: 20,
                    icon: const Icon(Icons.done)))
          ]),
      body: CustomListWidget(children: [
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
                  ref.read(selectedModeProvider.notifier).update((state) => v!);
                })),
        mode == ReplacementMode.laboratory
            ? Padding(
                padding: const EdgeInsets.only(top: Insets.small),
                child: DropdownButtonFormField(
                    isExpanded: true,
                    iconEnabledColor: context.color.primaryColor,
                    iconDisabledColor: context.color.primaryColor,
                    value: selectedUndergroup,
                    items: List.generate(2, (index) => index++, growable: false)
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
            : const SizedBox.shrink(),
        TextButton(
            onPressed: () async {
              dateTime = await showDatePicker(
                  context: context,
                  initialDate: DateTime.now(),
                  firstDate: DateTime.now(),
                  lastDate: DateTime.now().add(const Duration(days: 60)));
            },
            child: Text('date'))
      ]),
    );
  }
}

// class AddReplacementView extends StatelessWidget {
//   const AddReplacementView({super.key});
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//           title: Text(t.selection.add),
//           leading: IconButton(
//               onPressed: () => context.pop(),
//               splashRadius: 20,
//               icon: const Icon(Icons.arrow_back))),
//       body: CustomListWidget(children: [
//         TitleDropdownWidget(),
//         TeachersDropdownWidget(),
//         TimeDropdownWidget(),
//         Padding(
//               padding: const EdgeInsets.only(top: Insets.small),
//               child: DropdownButtonFormField(
//                   isExpanded: true,
//                   iconEnabledColor: context.color.primaryColor,
//                   iconDisabledColor: context.color.primaryColor,
//                   value: mode,
//                   hint: Text(t.selection.day, style: context.text.mediumText),
//                   items: mods.map((e) {
//                     final String title = t.dialog.subject_mode[e.index];

//                     return DropdownMenuItem(value: e, child: Text(title));
//                   }).toList(),
//                   onChanged: (v) {
//                     ref
//                         .read(selectedModeProvider.notifier)
//                         .update((state) => v!);
//                   })),
//       ]),
//     );
//   }
// }
