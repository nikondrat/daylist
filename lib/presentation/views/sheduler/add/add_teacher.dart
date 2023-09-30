import 'package:appwrite/appwrite.dart';
import 'package:daylist/data/api/request/add/add_teacher_body.dart';
import 'package:daylist/data/api/request/add/add_voiting_body.dart';
import 'package:daylist/data/repository/teacher_data_repository.dart';
import 'package:daylist/domain/model/classroom.dart';
import 'package:daylist/domain/model/teacher.dart';
import 'package:daylist/domain/model/title.dart';
import 'package:daylist/domain/state/settings/settings_state.dart';
import 'package:daylist/domain/state/sheduler/subject_state.dart';
import 'package:daylist/domain/state/week/week_state.dart';
import 'package:daylist/internal/dependencies/dependencies.dart';
import 'package:daylist/presentation/extensions/text.dart';
import 'package:daylist/presentation/extensions/theme/context.dart';
import 'package:daylist/presentation/res/values.dart';
import 'package:daylist/presentation/translations/translations.g.dart';
import 'package:daylist/presentation/utils/generator.dart';
import 'package:daylist/presentation/views/router.dart';
import 'package:daylist/presentation/views/widgets/list.dart';
import 'package:daylist/presentation/views/widgets/subsection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:reactive_forms/reactive_forms.dart';

class AddTeacherView extends StatefulHookConsumerWidget {
  const AddTeacherView({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _AddTeacherViewState();
}

class _AddTeacherViewState extends ConsumerState<AddTeacherView> {
  final FilteringTextInputFormatter formatter =
      FilteringTextInputFormatter(RegExp(r"\p{L}", unicode: true), allow: true);
  late final FormGroup formGroup;

  @override
  void initState() {
    formGroup = FormGroup({
      'name': FormControl(validators: [Validators.required]),
      'surname': FormControl(validators: [Validators.required]),
      'patronymic': FormControl(validators: [Validators.required]),
    });
    super.initState();
  }

  @override
  void dispose() {
    formGroup.dispose();
    super.dispose();
  }

  addTeacher() {
    final SubjectTitle? title = ref.watch(selectedSubjectTitleProvider);
    final Classroom? classroom = ref.watch(selectedClassroomProvider);
    final String groupId = ref.watch(settingsProvider).group!.id;

    if (!formGroup.hasErrors && title != null && classroom != null) {
      final String institutionId = ref.watch(settingsProvider).institution!.id;

      final String name = formGroup.control('name').value.trim();
      final String surname = formGroup.control('surname').value.trim();
      final String patronymic = formGroup.control('patronymic').value.trim();

      final Teacher teacher = Teacher(
          id: ID.custom(Generator.generateId()),
          name: name,
          surname: surname,
          patronymic: patronymic,
          institutionId: institutionId,
          title: title,
          classroom: classroom);

      try {
        TeacherDataRepository(
                Dependencies().getIt.get(), Dependencies().getIt.get())
            .addTeacher(
                body: AddTecherBody(
                    databaseId: dotenv.env['databaseId']!,
                    collectionId: dotenv.env['teachersCollectionId']!,
                    voitingBody: AddVoitingBody(
                        databaseId: dotenv.env['databaseId']!,
                        collectionId: dotenv.env['voitingCollectionId']!,
                        teacher: teacher,
                        groupId: groupId),
                    teacher: teacher))
            .then((value) {
          ref.invalidate(teachersProvider);
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
    final SubjectTitle? title = ref.watch(selectedSubjectTitleProvider);
    final Classroom? classroom = ref.watch(selectedClassroomProvider);
    final Color? primaryColor = ref.watch(primaryColorProvider);
    final double radius = ref.watch(radiusProvider);

    const double size = 68;

    final RoundedRectangleBorder shapeBorder = RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(radius),
        side: BorderSide(color: primaryColor ?? context.color.primaryColor));

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
                      onPressed: addTeacher,
                      splashRadius: 20,
                      icon: const Icon(Icons.done)))
            ]),
        body: ReactiveForm(
            formGroup: formGroup,
            child: CustomListWidget(children: [
              Padding(
                  padding: const EdgeInsets.symmetric(vertical: Insets.small),
                  child: ReactiveTextField(
                      formControlName: 'name',
                      inputFormatters: [formatter],
                      textInputAction: TextInputAction.next,
                      decoration: InputDecoration(
                          constraints:
                              const BoxConstraints.expand(height: size),
                          labelText: t.auth.name),
                      onChanged: (control) {
                        formGroup.markAsTouched();
                      },
                      keyboardType: TextInputType.name)),
              Padding(
                  padding: const EdgeInsets.only(bottom: Insets.small),
                  child: ReactiveTextField(
                      formControlName: 'surname',
                      keyboardType: TextInputType.name,
                      textInputAction: TextInputAction.next,
                      inputFormatters: [formatter],
                      decoration: InputDecoration(
                          constraints:
                              const BoxConstraints.expand(height: size),
                          labelText: t.auth.surname),
                      onChanged: (control) {
                        formGroup.markAsTouched();
                      })),
              Padding(
                  padding: const EdgeInsets.only(bottom: Insets.small),
                  child: ReactiveTextField(
                      formControlName: 'patronymic',
                      keyboardType: TextInputType.name,
                      inputFormatters: [formatter],
                      textInputAction: TextInputAction.next,
                      decoration: InputDecoration(
                          constraints:
                              const BoxConstraints.expand(height: size),
                          labelText: t.auth.patronymic),
                      onChanged: (control) {
                        formGroup.markAsTouched();
                      })),
              Padding(
                  padding: const EdgeInsets.only(bottom: Insets.small),
                  child: SubsectionWidget(
                      subsection: Subsection(
                          onTap: () => context.goNamed(
                              ViewsNames.addReplacementTeacherTitleClassroom),
                          title: classroom?.title ??
                              t.subject.classroom.capitalize(),
                          shape: shapeBorder,
                          trailing: [
                        title != null
                            ? GestureDetector(
                                onTap: () => ref
                                    .read(selectedClassroomProvider.notifier)
                                    .update((state) => null),
                                child: const Icon(Icons.close))
                            : const Icon(Icons.arrow_forward)
                      ]))),
              Padding(
                  padding: const EdgeInsets.only(bottom: Insets.small),
                  child: SubsectionWidget(
                      subsection: Subsection(
                          onTap: () => context
                              .goNamed(ViewsNames.addReplacementTeacherTitle),
                          title: title?.title ?? t.subject.title,
                          shape: shapeBorder,
                          trailing: [
                        title != null
                            ? GestureDetector(
                                onTap: () => ref
                                    .read(selectedSubjectTitleProvider.notifier)
                                    .update((state) => null),
                                child: const Icon(Icons.close))
                            : const Icon(Icons.arrow_forward)
                      ]))),
            ])));
  }
}
