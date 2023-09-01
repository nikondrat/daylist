import 'package:daylist/domain/model/time.dart';
import 'package:daylist/domain/state/dialogs/subject_dialog_state.dart';
import 'package:daylist/domain/state/dialogs/time_dialog_state.dart';
import 'package:daylist/domain/state/settings/settings_state.dart';
import 'package:daylist/domain/state/week/week_state.dart';
import 'package:daylist/presentation/extensions/theme/context.dart';
import 'package:daylist/presentation/res/values.dart';
import 'package:daylist/presentation/translations/translations.g.dart';
import 'package:daylist/presentation/views/widgets/dialogs/add_time_dialog.dart';
import 'package:daylist/presentation/views/widgets/loader.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class TimeDropdownWidget extends HookConsumerWidget {
  const TimeDropdownWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final AsyncValue<List<Time>> times = ref.watch(timesProvider);
    final double radius = ref.watch(settingsProvider).radius;

    final String? timeId = ref.watch(selectedTimeProvider);

    return LoaderWidget(
        config: times,
        builder: (v) => Padding(
            padding: const EdgeInsets.only(top: Insets.small),
            child: DropdownButtonFormField(
                isExpanded: true,
                value: timeId,
                icon: GestureDetector(
                    onTap: () => showDialog(
                                context: context,
                                builder: (context) => const AddTimeDialog())
                            .then((value) {
                          ref
                              .read(startTimeProvider.notifier)
                              .update((state) => null);
                          ref
                              .read(endTimeProvider.notifier)
                              .update((state) => null);
                        }),
                    child: Icon(Icons.add, color: context.color.primaryColor)),
                hint: Text(t.selection.time, style: context.text.mediumText),
                items: v
                    .map((e) => DropdownMenuItem(
                        value: e.id,
                        child: Row(children: [
                          Container(
                              height: 30,
                              width: 30,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(radius),
                                  border: Border.all(
                                      color: context.color.primaryColor)),
                              margin:
                                  const EdgeInsets.only(right: Insets.small),
                              child: Center(child: Text('${e.number}'))),
                          Text('${e.start} - ${e.end}')
                        ])))
                    .toList(),
                onChanged: (v) {
                  ref.read(selectedTimeProvider.notifier).update((state) => v);
                })));
  }
}
