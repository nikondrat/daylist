import 'package:appwrite/appwrite.dart';
import 'package:appwrite/models.dart';
import 'package:daylist/.env';
import 'package:daylist/data/api/request/add/add_institution_body.dart';
import 'package:daylist/data/repository/auth_repository.dart';
import 'package:daylist/data/repository/institution_repository.dart';
import 'package:daylist/domain/model/institution.dart';
import 'package:daylist/domain/state/home/home_state.dart';
import 'package:daylist/domain/state/settings/settings_state.dart';
import 'package:daylist/internal/dependencies/dependencies.dart';
import 'package:daylist/presentation/res/values.dart';
import 'package:daylist/presentation/translations/translations.g.dart';
import 'package:daylist/presentation/utils/generator.dart';
import 'package:daylist/presentation/utils/validator.dart';
import 'package:daylist/presentation/views/widgets/dialog.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class AddInstitutionDialog extends StatefulHookConsumerWidget {
  const AddInstitutionDialog({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      __AddInstitutionState();
}

class __AddInstitutionState extends ConsumerState<AddInstitutionDialog> {
  late TextEditingController title;
  late GlobalKey<FormState> titleState;

  late TextEditingController shortTitle;
  late GlobalKey<FormState> shortTitleState;

  @override
  void initState() {
    title = TextEditingController();
    titleState = GlobalKey();

    shortTitle = TextEditingController();
    shortTitleState = GlobalKey();

    super.initState();
  }

  @override
  void dispose() {
    title.dispose();
    shortTitle.dispose();
    super.dispose();
  }

  Future addInstitution() async {
    if (!titleState.currentState!.validate() ||
        !shortTitleState.currentState!.validate()) return;

    final User user =
        await AuthDataRepository(Dependencies().getIt.get()).getUser();

    try {
      await InstitutionDataRepository(
              Dependencies().getIt.get(), Dependencies().getIt.get())
          .addInstitution(
              body: AddInstitutionBody(
                  databaseId: databaseId,
                  collectionId: institutionsCollectionId,
                  institution: Institution(
                      id: ID.custom(Generator.generateId()),
                      title: title.text.trim(),
                      shortTitle: shortTitle.text.trim(),
                      createdBy: user.$id,
                      cityId: ref.watch(settingsProvider).city!.id)))
          .then((value) {
        ref.invalidate(institutionsProvider);
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
        onSubmitted: addInstitution,
        children: [
          Form(
              key: titleState,
              child: TextFormField(
                  controller: title,
                  textInputAction: TextInputAction.next,
                  validator: (v) => Validator().text(v, checkLen: false),
                  onEditingComplete: () => titleState.currentState!.validate(),
                  onSaved: (newValue) => titleState.currentState!.validate(),
                  onFieldSubmitted: (value) =>
                      titleState.currentState!.validate(),
                  onChanged: (value) => titleState.currentState!.validate(),
                  decoration: InputDecoration(labelText: t.selection.title))),
          Padding(
              padding: const EdgeInsets.only(top: Insets.small),
              child: Form(
                  key: shortTitleState,
                  child: TextFormField(
                      controller: shortTitle,
                      onFieldSubmitted: (value) => addInstitution(),
                      validator: (v) => Validator().text(v, checkLen: false),
                      onChanged: (value) =>
                          shortTitleState.currentState!.validate(),
                      onSaved: (newValue) =>
                          shortTitleState.currentState!.validate(),
                      onEditingComplete: () =>
                          shortTitleState.currentState!.validate(),
                      decoration:
                          InputDecoration(labelText: t.selection.shortTitle)))),
        ]);
  }
}
