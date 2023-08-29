import 'package:appwrite/models.dart';
import 'package:daylist/data/repository/auth_repository.dart';
import 'package:daylist/domain/model/replacement.dart';
import 'package:daylist/internal/dependencies/dependencies.dart';
import 'package:daylist/presentation/extensions/theme/context.dart';
import 'package:daylist/presentation/res/values.dart';
import 'package:daylist/presentation/translations/translations.g.dart';
import 'package:daylist/presentation/views/widgets/dialog.dart';
import 'package:daylist/presentation/views/widgets/dialogs/widgets/teachers_dropdown.dart';
import 'package:daylist/presentation/views/widgets/dialogs/widgets/time_dropdown.dart';
import 'package:daylist/presentation/views/widgets/dialogs/widgets/title_dropdown.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class AddReplacementDialog extends StatefulHookConsumerWidget {
  const AddReplacementDialog({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _AddCityDialogState();
}

class _AddCityDialogState extends ConsumerState<AddReplacementDialog> {
  String? timeId;
  ReplacementMode mode = ReplacementMode.usual;

  Future addReplacement() async {
    final User user =
        await AuthDataRepository(Dependencies().getIt.get()).getUser();

    try {
      // await CityDataRepository(
      //         Dependencies().getIt.get(), Dependencies().getIt.get())
      //     .addCity(
      //         body: AddCityBody(
      //             databaseId: databaseId,
      //             collectionId: citiesCollectionId,
      //             city: City(
      //                 id: ID.custom(StringGenerator.generate()),
      //                 createdBy: user.$id,
      //                 title: controller.text)))
      //     .then((value) {
      //   ref.invalidate(citiesProvider);
      //   context.pop();
      // });
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
        onSubmitted: addReplacement,
        children: [
          const TitleDropdownWidget(),
          const TeachersDropdownWidget(),
          TimeDropdownWidget(onSelected: (v) => timeId = v),
          Padding(
              padding: const EdgeInsets.only(top: Insets.small),
              child: DropdownButtonFormField(
                  iconEnabledColor: context.color.primaryColor,
                  iconDisabledColor: context.color.primaryColor,
                  value: mode,
                  hint: Text(t.selection.day, style: context.text.mediumText),
                  items: ReplacementMode.values.map((e) {
                    final String title = t.dialog.subject_mode[e.index];

                    // final int i = t.week.isEven.indexOf(e);

                    // final bool? isEven = i == 0
                    //     ? true
                    //     : i == 1
                    //         ? false
                    //         : null;

                    return DropdownMenuItem(value: e, child: Text(title));
                  }).toList(),
                  onChanged: (v) {
                    mode = v!;
                  })),
        ]);
  }
}
