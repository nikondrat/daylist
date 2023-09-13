import 'package:appwrite/appwrite.dart';
import 'package:appwrite/models.dart';
import 'package:daylist/data/api/request/add/add_city_body.dart';
import 'package:daylist/data/repository/auth_repository.dart';
import 'package:daylist/data/repository/city_data_repository.dart';
import 'package:daylist/domain/model/city.dart';
import 'package:daylist/domain/state/home/home_state.dart';
import 'package:daylist/internal/dependencies/dependencies.dart';
import 'package:daylist/presentation/translations/translations.g.dart';
import 'package:daylist/presentation/utils/generator.dart';
import 'package:daylist/presentation/utils/validator.dart';
import 'package:daylist/presentation/views/widgets/dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class AddCityDialog extends StatefulHookConsumerWidget {
  const AddCityDialog({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _AddCityDialogState();
}

class _AddCityDialogState extends ConsumerState<AddCityDialog> {
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
      await CityDataRepository(Dependencies().getIt.get())
          .addCity(
              body: AddCityBody(
                  databaseId: dotenv.env['databaseId']!,
                  collectionId: dotenv.env['citiesCollectionId']!,
                  city: City(
                      id: ID.custom(Generator.generateId()),
                      createdBy: user.$id,
                      title: controller.text)))
          .then((value) {
        ref.invalidate(citiesProvider);
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
                  validator: (v) => Validator().text(v, checkLen: false),
                  onEditingComplete: () => formKey.currentState!.validate(),
                  onSaved: (newValue) => formKey.currentState!.validate(),
                  onFieldSubmitted: (value) => addCity(),
                  onChanged: (value) => formKey.currentState!.validate(),
                  decoration: InputDecoration(labelText: t.selection.title)))
        ]);
  }
}
