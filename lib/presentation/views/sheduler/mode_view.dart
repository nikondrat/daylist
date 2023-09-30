import 'package:daylist/domain/model/replacement.dart';
import 'package:daylist/domain/state/sheduler/subject_state.dart';
import 'package:daylist/presentation/translations/translations.g.dart';
import 'package:daylist/presentation/views/widgets/dialogs/add_time_dialog.dart';
import 'package:daylist/presentation/views/widgets/list.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class ModeView extends HookConsumerWidget {
  const ModeView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    List<ReplacementMode> mods = List.from(ReplacementMode.values);
    mods.removeLast();

    return Scaffold(
        appBar: AppBar(
            leading: IconButton(
                onPressed: () => context.pop(),
                splashRadius: 20,
                icon: const Icon(Icons.arrow_back)),
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
        body: CustomListWidget(
            children: mods
                .map((e) => ListTile(
                    onTap: () {
                      ref
                          .read(selectedModeProvider.notifier)
                          .update((state) => e);
                      context.pop();
                    },
                    title: Text(t.dialog.subject_mode[e.index])))
                .toList()));
  }
}
