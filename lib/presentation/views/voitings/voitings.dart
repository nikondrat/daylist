import 'package:daylist/domain/model/voiting.dart';
import 'package:daylist/domain/state/voitings/voitings_state.dart';
import 'package:daylist/presentation/translations/translations.g.dart';
import 'package:daylist/presentation/views/voitings/voiting_item.dart';
import 'package:daylist/presentation/views/widgets/list.dart';
import 'package:daylist/presentation/views/widgets/loader.dart';
import 'package:daylist/presentation/views/widgets/section.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class VoitingsView extends HookConsumerWidget {
  const VoitingsView({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final AsyncValue<List<Voiting>> voitings = ref.watch(voitingsProvider);

    return Scaffold(
        appBar: AppBar(
            leading: IconButton(
                onPressed: () => context.pop(),
                splashRadius: 20,
                icon: const Icon(Icons.arrow_back)),
            title: Text(t.voitings.title)),
        body: LoaderWidget(
            config: voitings,
            builder: (v) => CustomListWidget(
                    onRefresh: () {
                      ref.invalidate(voitingsProvider);
                    },
                    children: [
                      SectionWidget(
                          children: v
                              .map((e) => VoitingItemWidget(voiting: e))
                              .toList())
                    ])));
  }
}
