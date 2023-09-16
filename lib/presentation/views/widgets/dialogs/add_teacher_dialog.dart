import 'package:appwrite/appwrite.dart';
import 'package:appwrite/models.dart';
import 'package:daylist/data/api/request/add/add_teacher_body.dart';
import 'package:daylist/data/repository/auth_repository.dart';
import 'package:daylist/data/repository/teacher_repository.dart';
import 'package:daylist/domain/model/teacher.dart';
import 'package:daylist/domain/model/title.dart';
import 'package:daylist/domain/state/dialogs/subject_dialog_state.dart';
import 'package:daylist/domain/state/settings/settings_state.dart';
import 'package:daylist/domain/state/week/week_state.dart';
import 'package:daylist/internal/dependencies/dependencies.dart';
import 'package:daylist/presentation/extensions/theme/context.dart';
import 'package:daylist/presentation/res/values.dart';
import 'package:daylist/presentation/translations/translations.g.dart';
import 'package:daylist/presentation/utils/generator.dart';
import 'package:daylist/presentation/utils/validator.dart';
import 'package:daylist/presentation/views/widgets/dialog.dart';
import 'package:daylist/presentation/views/widgets/dialogs/add_subject_title_dialog.dart';
import 'package:daylist/presentation/views/widgets/loader.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:slang/builder/utils/string_extensions.dart';

class AddTeacherDialog extends StatefulHookConsumerWidget {
  const AddTeacherDialog({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _AddTeacherDialogState();
}

class _AddTeacherDialogState extends ConsumerState<AddTeacherDialog> {
  late GlobalKey<FormState> initialsKey;
  late TextEditingController initials;

  late GlobalKey<FormState> classroomKey;
  late TextEditingController classroom;

  @override
  void initState() {
    initials = TextEditingController();
    initialsKey = GlobalKey();
    classroom = TextEditingController();
    classroomKey = GlobalKey();
    super.initState();
  }

  @override
  void dispose() {
    initials.dispose();
    initialsKey.currentState?.dispose();

    classroom.dispose();
    classroomKey.currentState?.dispose();
    super.dispose();
  }

  Future addTeacher() async {
    if (!initialsKey.currentState!.validate() ||
        !classroomKey.currentState!.validate()) return;

    final User user =
        await AuthDataRepository(Dependencies().getIt.get()).getUser();

    final String institutionId = ref.watch(settingsProvider).institution!.id;
    final SubjectTitle? title = ref.watch(selectedSubjectTitleProvider);

    try {
      await TeacherDataRepository(
              Dependencies().getIt.get(), Dependencies().getIt.get())
          .addTeacher(
              body: AddTecherBody(
                  databaseId: dotenv.env['databaseId']!,
                  collectionId: dotenv.env['teachersCollectionId']!,
                  teacher: Teacher(
                      id: ID.custom(Generator.generateId()),
                      initials: initials.text,
                      institutionId: institutionId,
                      title: title!,
                      classroom: classroom.text.trim(),
                      createdBy: user.$id)))
          .then((value) {
        ref.invalidate(teachersProvider);
        context.pop();
      });
    } catch (e) {
      if (context.mounted) {
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text('$e')));
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final SubjectTitle? title = ref.watch(selectedSubjectTitleProvider);

    return CustomDialog(
        title: t.selection.add,
        onSubmitted: addTeacher,
        children: [
          Form(
              key: initialsKey,
              child: TextFormField(
                  controller: initials,
                  textInputAction: TextInputAction.next,
                  validator: (v) => Validator().initials(v, checkLen: false),
                  onEditingComplete: () => initialsKey.currentState!.validate(),
                  onSaved: (newValue) => initialsKey.currentState!.validate(),
                  onChanged: (value) => initialsKey.currentState!.validate(),
                  decoration: InputDecoration(labelText: t.dialog.initials))),
          Padding(
            padding: const EdgeInsets.only(top: Insets.small),
            child: Form(
                key: classroomKey,
                child: TextFormField(
                    controller: classroom,
                    textInputAction: TextInputAction.next,
                    validator: (v) => Validator.standart(v, checkLen: false),
                    onEditingComplete: () =>
                        classroomKey.currentState!.validate(),
                    onSaved: (newValue) =>
                        classroomKey.currentState!.validate(),
                    onChanged: (value) => classroomKey.currentState!.validate(),
                    decoration: InputDecoration(
                        labelText: t.subject.classroom.capitalize()))),
          ),
          Padding(
              padding: const EdgeInsets.only(top: Insets.small),
              child: LoaderWidget(
                  config: ref.watch(titlesProvider),
                  builder: (i) {
                    return DropdownButtonFormField(
                        isExpanded: true,
                        isDense: false,
                        value: title,
                        icon: GestureDetector(
                            onTap: () => showDialog(
                                context: context,
                                builder: (context) =>
                                    const AddSubjectTitleDialog()),
                            child: Icon(Icons.add,
                                color: context.color.primaryColor)),
                        hint: Text(t.subject.title,
                            style: context.text.mediumText),
                        items: i.isNotEmpty
                            ? i
                                .map((e) => DropdownMenuItem(
                                    value: e, child: Text(e.title)))
                                .toList()
                            : <DropdownMenuItem>[],
                        onChanged: (v) {
                          ref
                              .read(selectedSubjectTitleProvider.notifier)
                              .update((state) => v);
                        });
                  })),
        ]);
  }
}
