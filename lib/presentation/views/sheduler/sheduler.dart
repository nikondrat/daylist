import 'package:daylist/domain/model/group.dart';
import 'package:daylist/domain/state/settings/settings_state.dart';
import 'package:daylist/domain/state/sheduler/sheduler_state.dart';
import 'package:daylist/domain/state/home/home_state.dart';
import 'package:daylist/presentation/translations/translations.g.dart';
import 'package:daylist/presentation/views/router.dart';
import 'package:daylist/presentation/views/widgets/dialogs/add_group_dialog.dart';
import 'package:daylist/presentation/views/widgets/list.dart';
import 'package:daylist/presentation/views/widgets/loader.dart';
import 'package:daylist/presentation/views/widgets/section.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class ShedulerView extends HookConsumerWidget {
  const ShedulerView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isOnlyScheduler = ref.watch(settingsProvider).city == null;

    return Scaffold(
        appBar: AppBar(
            title: Text(t.settings.scheduler),
            leading: isOnlyScheduler
                ? null
                : IconButton(
                    onPressed: () => context.goNamed(ViewsNames.home),
                    splashRadius: 20,
                    icon: const FaIcon(FontAwesomeIcons.house, size: 14))),
        body: CustomListWidget(children: [
          SectionWidget(title: t.settings.group, actions: [
            GestureDetector(
                onTap: () => showDialog(
                    context: context,
                    builder: (context) => const AddGroupDialog()),
                child: const Icon(Icons.add))
          ], children: const [
            _Body()
          ])
        ]));
  }
}

class _Body extends HookConsumerWidget {
  const _Body();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final AsyncValue<List<Group>> groups = ref.watch(groupsProvider);

    return LoaderWidget(
        config: groups,
        builder: (v) {
          return Column(
              children: v
                  .map((e) => ListTile(
                      onTap: () {
                        ref.read(selectedGroup.notifier).update((state) => e);
                        context.goNamed(ViewsNames.groupSheduler);
                      },
                      title: Text(e.title)))
                  .toList());
        });
  }
}
