import 'package:daylist/domain/model/teacher.dart';
import 'package:daylist/domain/model/title.dart';
import 'package:daylist/domain/state/dialogs/subject_dialog_state.dart';
import 'package:daylist/domain/state/week/week_state.dart';
import 'package:daylist/presentation/views/widgets/dialogs/add_teacher_dialog.dart';
import 'package:daylist/presentation/views/widgets/list.dart';
import 'package:daylist/presentation/views/widgets/loader.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class TeachersView extends HookConsumerWidget {
  const TeachersView({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final AsyncValue<List<Teacher>> data = ref.watch(teachersProvider);
    final SubjectTitle? title = ref.watch(selectedSubjectTitleProvider);

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
                          builder: (context) => const AddTeacherDialog()),
                      splashRadius: 20,
                      icon: const Icon(Icons.add)))
            ]),
        body: LoaderWidget(
            config: data,
            builder: (v) {
              // final List<Teacher> teachers = v
              //     .where((e) => title != null ? e.title.id == title.id : true)
              //     .toList();

              return CustomListWidget(
                  children:
                      // teachers != null
                      //     ?
                      v
                          .map((e) => ListTile(
                                onTap: () {
                                  ref
                                      .read(selectedTeacherProvider.notifier)
                                      .update((state) => e);
                                  if (title == null) {
                                    ref
                                        .read(selectedSubjectTitleProvider
                                            .notifier)
                                        .update((state) => e.title);
                                  }
                                  context.pop();
                                },
                                title: Text(e.initials),
                              ))
                          .toList());
            }));
  }
}
