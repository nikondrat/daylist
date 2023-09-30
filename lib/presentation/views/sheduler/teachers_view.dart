import 'package:daylist/domain/model/teacher.dart';
import 'package:daylist/domain/model/title.dart';
import 'package:daylist/domain/state/sheduler/subject_state.dart';
import 'package:daylist/domain/state/week/week_state.dart';
import 'package:daylist/presentation/translations/translations.g.dart';
import 'package:daylist/presentation/views/router.dart';
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
            title: Text(t.selection.teacher)),
        floatingActionButton: FloatingActionButton(
            child: const Icon(Icons.add),
            onPressed: () => context.goNamed(ViewsNames.addReplacementTeacher)),
        body: LoaderWidget(
            config: data,
            builder: (v) {
              return CustomListWidget(
                  children: v
                      .map((e) => ListTile(
                          onTap: () {
                            ref
                                .read(selectedTeacherProvider.notifier)
                                .update((state) => e);
                            if (title == null) {
                              ref
                                  .read(selectedSubjectTitleProvider.notifier)
                                  .update((state) => e.title);
                            }
                            context.pop();
                          },
                          title: Text(e.initials())))
                      .toList());
            }));
  }
}
