import 'package:daylist/domain/state/dialogs/subject_dialog_state.dart';
import 'package:daylist/presentation/extensions/theme/context.dart';
import 'package:daylist/presentation/res/values.dart';
import 'package:daylist/presentation/translations/translations.g.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class DayDropdownWidget extends HookConsumerWidget {
  const DayDropdownWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final int weekday = ref.watch(selectedWeekdayProvider);

    return Padding(
        padding: const EdgeInsets.only(top: Insets.small),
        child: DropdownButtonFormField(
            iconEnabledColor: context.color.primaryColor,
            iconDisabledColor: context.color.primaryColor,
            value: weekday,
            hint: Text(t.selection.day, style: context.text.mediumText),
            items: t.week.days.full
                .map((e) => DropdownMenuItem(
                    value: t.week.days.full.indexOf(e) + 1, child: Text(e)))
                .toList(),
            onChanged: (v) {
              ref.read(selectedWeekdayProvider.notifier).update((state) => v!);
            }));
  }
}
