import 'package:daylist/domain/model/time.dart';
import 'package:daylist/domain/state/sheduler/subject_state.dart';
import 'package:daylist/domain/state/settings/settings_state.dart';
import 'package:daylist/domain/state/week/week_state.dart';
import 'package:daylist/presentation/extensions/theme/context.dart';
import 'package:daylist/presentation/translations/translations.g.dart';
import 'package:daylist/presentation/views/widgets/dialogs/add_time_dialog.dart';
import 'package:daylist/presentation/views/widgets/list.dart';
import 'package:daylist/presentation/views/widgets/loader.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class TimesView extends HookConsumerWidget {
  const TimesView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final AsyncValue<List<Time>> items = ref.watch(timesProvider);

    final double radius = ref.watch(settingsProvider).radius;

    return Scaffold(
        appBar: AppBar(
            leading: IconButton(
                onPressed: () => context.pop(),
                splashRadius: 20,
                icon: const Icon(Icons.arrow_back)),
            title: Text(t.selection.time),
            actions: [
              Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: IconButton(
                      onPressed: () => showDialog(
                          context: context,
                          builder: (context) => const AddTimeDialog()),
                      splashRadius: 20,
                      icon: const Icon(Icons.add)))
            ]),
        body: LoaderWidget(
            config: items,
            builder: (v) {
              return CustomListWidget(
                  onRefresh: () => ref.invalidate(timesProvider),
                  children: v
                      .map((e) => ListTile(
                          onTap: () {
                            ref
                                .read(selectedTimeProvider.notifier)
                                .update((state) => e);
                            context.pop();
                          },
                          leading: Container(
                              height: 30,
                              width: 30,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(radius),
                                  border: Border.all(
                                      color: context.color.primaryColor)),
                              child: Center(child: Text('${e.number}'))),
                          title: Text('${e.start} - ${e.end}')))
                      .toList());
            }));
  }
}
