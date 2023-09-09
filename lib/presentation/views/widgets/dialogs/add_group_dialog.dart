import 'package:appwrite/appwrite.dart';
import 'package:appwrite/models.dart';
import 'package:daylist/data/api/request/add/add_group_body.dart';
import 'package:daylist/data/repository/auth_repository.dart';
import 'package:daylist/data/repository/group_repository.dart';
import 'package:daylist/domain/model/group.dart';
import 'package:daylist/domain/state/home/home_state.dart';
import 'package:daylist/domain/state/settings/settings_state.dart';
import 'package:daylist/internal/dependencies/dependencies.dart';
import 'package:daylist/presentation/translations/translations.g.dart';
import 'package:daylist/presentation/utils/generator.dart';
import 'package:daylist/presentation/utils/validator.dart';
import 'package:daylist/presentation/views/widgets/dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class AddGroupDialog extends StatefulHookConsumerWidget {
  const AddGroupDialog({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      __AddGroupDialogState();
}

class __AddGroupDialogState extends ConsumerState<AddGroupDialog> {
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
    super.dispose();
  }

  Future addGroup() async {
    if (!formKey.currentState!.validate()) return;

    final User user =
        await AuthDataRepository(Dependencies().getIt.get()).getUser();

    try {
      await GroupDataRepository(Dependencies().getIt.get())
          .addGroup(
              body: AddGroupBody(
                  databaseId: dotenv.env['const databaseId']!,
                  collectionId: dotenv.env['const groupsCollectionId']!,
                  group: Group(
                      id: ID.custom(Generator.generateId()),
                      title: controller.text.trim(),
                      createdBy: user.$id,
                      institutionId:
                          ref.watch(settingsProvider).institution!.id)))
          .then((value) {
        ref.invalidate(groupsProvider);
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
        onSubmitted: addGroup,
        children: [
          Form(
              key: formKey,
              child: TextFormField(
                  controller: controller,
                  validator: (v) => Validator.standart(v, checkLen: false),
                  onEditingComplete: () => formKey.currentState!.validate(),
                  onSaved: (newValue) => formKey.currentState!.validate(),
                  onFieldSubmitted: (value) => addGroup(),
                  onChanged: (value) => formKey.currentState!.validate(),
                  decoration: InputDecoration(labelText: t.selection.title)))
        ]);
  }
}
