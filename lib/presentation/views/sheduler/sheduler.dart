import 'package:daylist/domain/model/group.dart';
import 'package:daylist/domain/state/sheduler/sheduler_state.dart';
import 'package:daylist/domain/state/home/home_state.dart';
import 'package:daylist/presentation/res/values.dart';
import 'package:daylist/presentation/translations/translations.g.dart';
import 'package:daylist/presentation/views/router.dart';
import 'package:daylist/presentation/views/widgets/loader.dart';
import 'package:daylist/presentation/views/widgets/section.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class ShedulerView extends StatelessWidget {
  const ShedulerView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('gg'),
        ),
        body: ListView(
            physics: const BouncingScrollPhysics(),
            padding: const EdgeInsets.symmetric(horizontal: Insets.small),
            children: [
              SectionWidget(title: t.settings.group, children: const [_Body()])
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
