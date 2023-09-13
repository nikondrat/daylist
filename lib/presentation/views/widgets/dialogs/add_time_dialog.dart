import 'package:appwrite/appwrite.dart';
import 'package:appwrite/models.dart';
import 'package:daylist/data/api/request/add/add_time_body.dart';
import 'package:daylist/data/repository/auth_repository.dart';
import 'package:daylist/data/repository/time_repository.dart';
import 'package:daylist/domain/model/time.dart';
import 'package:daylist/domain/state/dialogs/time_dialog_state.dart';
import 'package:daylist/domain/state/week/week_state.dart';
import 'package:daylist/internal/dependencies/dependencies.dart';
import 'package:daylist/presentation/extensions/theme/context.dart';
import 'package:daylist/presentation/res/values.dart';
import 'package:daylist/presentation/translations/translations.g.dart';
import 'package:daylist/presentation/utils/generator.dart';
import 'package:daylist/presentation/views/widgets/dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class AddTimeDialog extends StatefulHookConsumerWidget {
  const AddTimeDialog({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _AddTimeDialogState();
}

class _AddTimeDialogState extends ConsumerState<AddTimeDialog> {
  int number = 1;

  Future addTime(TimeOfDay? start, TimeOfDay? end) async {
    final User user =
        await AuthDataRepository(Dependencies().getIt.get()).getUser();

    if (start != null && end != null) {
      final String startString =
          '${'${start.hour}'.padLeft(2, '0')}:${'${start.minute}'.padLeft(2, '0')}';
      final String endString =
          '${'${end.hour}'.padLeft(2, '0')}:${'${end.minute}'.padLeft(2, '0')}';

      try {
        TimeDataRepository(Dependencies().getIt.get())
            .addTime(
                body: AddTimeBody(
                    databaseId: dotenv.env['databaseId']!,
                    collectionId: dotenv.env['timesCollectionId']!,
                    time: Time(
                        id: ID.custom(Generator.generateId()),
                        start: startString,
                        end: endString,
                        number: number,
                        createdBy: user.$id)))
            .then((value) {
          ref.invalidate(timesProvider);
          context.pop();
        });
      } catch (e) {
        if (context.mounted) {
          ScaffoldMessenger.of(context)
              .showSnackBar(SnackBar(content: Text('$e')));
        }
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    const ButtonStyle style =
        ButtonStyle(minimumSize: MaterialStatePropertyAll(Size(100, 50)));

    final TimeOfDay? start = ref.watch(startTimeProvider);
    final TimeOfDay? end = ref.watch(endTimeProvider);

    return CustomDialog(
        title: t.selection.add,
        onSubmitted: () => addTime(start, end),
        children: [
          DropdownButtonFormField(
              iconDisabledColor: context.color.primaryColor,
              iconEnabledColor: context.color.primaryColor,
              value: number,
              hint: Text(t.dialog.number, style: context.text.mediumText),
              items: List.generate(6, (int index) => index + 1)
                  .map((e) => DropdownMenuItem(value: e, child: Text('$e')))
                  .toList(),
              onChanged: (v) => number = v!),
          Padding(
            padding: const EdgeInsets.only(top: Insets.small),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  TextButton(
                      style: style,
                      onPressed: () {
                        showTimePicker(
                                context: context,
                                initialTime: start ??
                                    const TimeOfDay(hour: 8, minute: 15))
                            .then((value) {
                          if (value != null) {
                            ref
                                .read(startTimeProvider.notifier)
                                .update((state) => value);

                            DateTime today = DateTime.now();
                            final DateTime dateTime = DateTime(
                                today.year,
                                today.month,
                                today.day,
                                value.hour,
                                value.minute);
                            final TimeOfDay end = TimeOfDay.fromDateTime(
                                dateTime.add(
                                    const Duration(hours: 1, minutes: 30)));
                            ref
                                .read(endTimeProvider.notifier)
                                .update((state) => end);
                          }
                        });
                      },
                      child: Text(start != null
                          ? '${'${start.hour}'.padLeft(2, '0')}:${'${start.minute}'.padLeft(2, '0')}'
                          : t.dialog.start)),
                  const Text('-'),
                  TextButton(
                      style: style,
                      onPressed: () {
                        showTimePicker(
                                context: context,
                                initialTime:
                                    end ?? const TimeOfDay(hour: 9, minute: 55))
                            .then((value) => ref
                                .read(endTimeProvider.notifier)
                                .update((state) => value));
                      },
                      child: Text(end != null
                          ? '${'${end.hour}'.padLeft(2, '0')}:${'${end.minute}'.padLeft(2, '0')}'
                          : t.dialog.end))
                ]),
          )
        ]);
  }
}
