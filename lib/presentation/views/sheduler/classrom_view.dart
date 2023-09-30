import 'package:daylist/domain/model/classroom.dart';
import 'package:daylist/domain/state/sheduler/subject_state.dart';
import 'package:daylist/domain/state/week/week_state.dart';
import 'package:daylist/presentation/translations/translations.g.dart';
import 'package:daylist/presentation/views/widgets/dialogs/add_classroom_dialog.dart';
import 'package:daylist/presentation/views/widgets/list.dart';
import 'package:daylist/presentation/views/widgets/loader.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:slang/builder/utils/string_extensions.dart';

class ClassroomView extends HookConsumerWidget {
  const ClassroomView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final AsyncValue<List<Classroom>> items = ref.watch(classroomsProvider);

    return Scaffold(
        appBar: AppBar(
            leading: IconButton(
                onPressed: () => context.pop(),
                splashRadius: 20,
                icon: const Icon(Icons.arrow_back)),
            title: Text(t.subject.classroom.capitalize()),
            actions: [
              Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: IconButton(
                      onPressed: () => showDialog(
                          context: context,
                          builder: (context) => const AddClassroomDialog()),
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
                                  .read(selectedClassroomProvider.notifier)
                                  .update((state) => e);
                              context.pop();
                            },
                            title: Text(e.title),
                          ))
                      .toList());
            }));
  }
}
