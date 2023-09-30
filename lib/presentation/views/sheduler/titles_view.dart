import 'package:daylist/domain/model/title.dart';
import 'package:daylist/domain/state/sheduler/subject_state.dart';
import 'package:daylist/domain/state/week/week_state.dart';
import 'package:daylist/presentation/translations/translations.g.dart';
import 'package:daylist/presentation/views/widgets/dialogs/add_subject_title_dialog.dart';
import 'package:daylist/presentation/views/widgets/list.dart';
import 'package:daylist/presentation/views/widgets/loader.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class TitlesView extends HookConsumerWidget {
  const TitlesView({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final AsyncValue<List<SubjectTitle>> items = ref.watch(titlesProvider);

    return Scaffold(
        appBar: AppBar(
            leading: IconButton(
                onPressed: () => context.pop(),
                splashRadius: 20,
                icon: const Icon(Icons.arrow_back)),
            title: Text(t.subject.title),
            actions: [
              Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: IconButton(
                      onPressed: () => showDialog(
                          context: context,
                          builder: (context) => const AddSubjectTitleDialog()),
                      splashRadius: 20,
                      icon: const Icon(Icons.add)))
            ]),
        body: LoaderWidget(
            config: items,
            builder: (v) {
              return CustomListWidget(
                  children: v
                      .map((e) => ListTile(
                            onTap: () {
                              ref
                                  .read(selectedSubjectTitleProvider.notifier)
                                  .update((state) => e);
                              context.pop();
                            },
                            title: Text(e.title),
                          ))
                      .toList());
            }));
  }
}
