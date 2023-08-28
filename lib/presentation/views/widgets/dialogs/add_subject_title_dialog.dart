import 'package:appwrite/appwrite.dart';
import 'package:appwrite/models.dart';
import 'package:daylist/.env';
import 'package:daylist/data/api/request/add/add_title_body.dart';
import 'package:daylist/data/repository/auth_repository.dart';
import 'package:daylist/data/repository/title_repository.dart';
import 'package:daylist/domain/model/title.dart';
import 'package:daylist/domain/state/week/week_state.dart';
import 'package:daylist/internal/dependencies/dependencies.dart';
import 'package:daylist/presentation/translations/translations.g.dart';
import 'package:daylist/presentation/utils/string_gen.dart';
import 'package:daylist/presentation/utils/validator.dart';
import 'package:daylist/presentation/views/widgets/dialog.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class AddSubjectTitleDialog extends StatefulHookConsumerWidget {
  const AddSubjectTitleDialog({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _AddSubjectTitleDialogState();
}

class _AddSubjectTitleDialogState extends ConsumerState<AddSubjectTitleDialog> {
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

  Future addCity() async {
    if (!formKey.currentState!.validate()) return;

    final User user =
        await AuthDataRepository(Dependencies().getIt.get()).getUser();

    try {
      await TitleDataRepository(
              Dependencies().getIt.get(), Dependencies().getIt.get())
          .addTitle(
              body: AddTitleBody(
                  databaseId: databaseId,
                  collectionId: titlesCollectionId,
                  title: SubjectTitle(
                      id: ID.custom(StringGenerator.generate()),
                      title: controller.text.trim(),
                      createdBy: user.$id)))
          .then((value) {
        ref.invalidate(titlesProvider);
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
