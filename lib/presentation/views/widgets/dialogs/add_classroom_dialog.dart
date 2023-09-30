import 'package:appwrite/appwrite.dart';
import 'package:daylist/data/api/request/add/add_classroom_body.dart';
import 'package:daylist/data/api/request/add/add_voiting_body.dart';
import 'package:daylist/data/repository/classroom_data_repository.dart';
import 'package:daylist/domain/model/classroom.dart';
import 'package:daylist/domain/state/settings/settings_state.dart';
import 'package:daylist/domain/state/week/week_state.dart';
import 'package:daylist/internal/dependencies/dependencies.dart';
import 'package:daylist/presentation/translations/translations.g.dart';
import 'package:daylist/presentation/utils/generator.dart';
import 'package:daylist/presentation/utils/validator.dart';
import 'package:daylist/presentation/views/widgets/dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class AddClassroomDialog extends StatefulHookConsumerWidget {
  const AddClassroomDialog({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _AddClassroomDialogState();
}

class _AddClassroomDialogState extends ConsumerState<AddClassroomDialog> {
  late GlobalKey<FormState> formKey;
  late TextEditingController controller;

  @override
  void initState() {
    controller = TextEditingController();
    formKey = GlobalKey();
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    formKey.currentState?.dispose();
    super.dispose();
  }

  addCity() {
    if (!formKey.currentState!.validate()) return;

    final String groupId = ref.watch(settingsProvider).group!.id;

    try {
      final Classroom classroom = Classroom(
          id: ID.custom(Generator.generateId()), title: controller.text.trim());

      ClassroomDataRepository(
              Dependencies().getIt.get(), Dependencies().getIt.get())
          .addClassroom(
              body: AddClassroomBody(
                  databaseId: dotenv.env['databaseId']!,
                  collectionId: dotenv.env['classroomsCollectionId']!,
                  voitingBody: AddVoitingBody(
                      databaseId: dotenv.env['databaseId']!,
                      collectionId: dotenv.env['voitingCollectionId']!,
                      classroom: classroom,
                      groupId: groupId),
                  classroom: classroom))
          .then((value) {
        ref.invalidate(classroomsProvider);
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
    return CustomDialog(
        title: t.selection.add,
        onSubmitted: addCity,
        children: [
          Form(
              key: formKey,
              child: TextFormField(
                  controller: controller,
                  validator: (v) => Validator.standart(v, checkLen: false),
                  onEditingComplete: () => formKey.currentState!.validate(),
                  onSaved: (newValue) => formKey.currentState!.validate(),
                  onFieldSubmitted: (value) => addCity(),
                  onChanged: (value) => formKey.currentState!.validate(),
                  decoration: InputDecoration(labelText: t.selection.title)))
        ]);
  }
}
