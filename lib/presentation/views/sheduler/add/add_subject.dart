import 'package:daylist/data/api/request/add/add_subject_body.dart';
import 'package:daylist/data/api/request/add/add_voiting_body.dart';
import 'package:daylist/data/repository/subject_data_repository.dart';
import 'package:daylist/domain/model/subject.dart';
import 'package:daylist/domain/model/teacher.dart';
import 'package:daylist/domain/model/time.dart';
import 'package:daylist/domain/model/title.dart';
import 'package:daylist/domain/state/sheduler/subject_state.dart';
import 'package:daylist/domain/state/settings/settings_state.dart';
import 'package:daylist/domain/state/week/week_state.dart';
import 'package:daylist/internal/dependencies/dependencies.dart';
import 'package:daylist/presentation/extensions/theme/context.dart';
import 'package:daylist/presentation/res/values.dart';
import 'package:daylist/presentation/translations/translations.g.dart';
import 'package:daylist/presentation/utils/generator.dart';
import 'package:daylist/presentation/views/widgets/dialogs/widgets/day_dropdown.dart';
import 'package:daylist/presentation/views/widgets/list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class AddSubjectView extends StatefulHookConsumerWidget {
  const AddSubjectView({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _AddSubjectViewState();
}

class _AddSubjectViewState extends ConsumerState<AddSubjectView> {
  bool? isEven;

  addSubject() {
    final String groupId = ref.watch(settingsProvider).group!.id;

    final Teacher? teacher = ref.watch(selectedTeacherProvider);
    final SubjectTitle? titleId = ref.watch(selectedSubjectTitleProvider);
    final Time? time = ref.watch(selectedTimeProvider);
    final int weekday = ref.watch(selectedWeekdayProvider);

    if (titleId != null && teacher != null && context.mounted) {
      final Subject subject = Subject(
          id: Generator.generateId(),
          teacher: teacher,
          time: time!,
          groupId: groupId,
          // TODO
          showInWeek: [],
          weekday: weekday);

      try {
        SubjectDataRepository(
                Dependencies().getIt.get(), Dependencies().getIt.get())
            .addSubject(
                body: AddSubjectBody(
                    databaseId: dotenv.env['databaseId']!,
                    collectionId: dotenv.env['subjectsCollectionId']!,
                    voitingBody: AddVoitingBody(
                        databaseId: dotenv.env['databaseId']!,
                        collectionId: dotenv.env['voitingCollectionId']!,
                        subject: subject,
                        groupId: groupId),
                    subject: subject))
            .then((value) {
          ref.invalidate(subjectsProvider);
          context.pop();
        });
      } catch (e) {
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text('$e')));
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    const ButtonStyle buttonStyle = ButtonStyle(
        alignment: Alignment.centerLeft,
        padding: MaterialStatePropertyAll(EdgeInsets.only(left: Insets.small)),
        minimumSize: MaterialStatePropertyAll(Size(double.infinity, 60)));

    final SubjectTitle? title = ref.watch(selectedSubjectTitleProvider);
    final Teacher? teacher = ref.watch(selectedTeacherProvider);
    final Time? time = ref.watch(selectedTimeProvider);

    return Scaffold(
      appBar: AppBar(
          title: Text(t.selection.add),
          leading: IconButton(
              onPressed: () => context.pop(),
              splashRadius: 20,
              icon: const Icon(Icons.arrow_back)),
          actions: [
            Padding(
                padding: const EdgeInsets.all(8.0),
                child: IconButton(
                    onPressed: addSubject,
                    splashRadius: 20,
                    icon: const Icon(Icons.done)))
          ]),
      body: CustomListWidget(children: [
        Padding(
            padding: const EdgeInsets.only(bottom: Insets.small),
            child: TextButton(
                style: buttonStyle,
                onPressed: () {},
                // onPressed: () => context.goNamed(ViewsNames.subjectTitles),
                child: Text(title?.title ?? t.subject.title))),
        Padding(
            padding: const EdgeInsets.only(bottom: Insets.small),
            child: TextButton(
                style: buttonStyle,
                onPressed: () {},
                // onPressed: () => context.goNamed(ViewsNames.subjectTeachers),
                child: Text(teacher?.shortInitials() ?? t.selection.teacher))),
        TextButton(
            style: buttonStyle,
            onPressed: () {},
            // onPressed: () => context.goNamed(ViewsNames.subjectTimes),
            child: Text(time != null
                ? '${time.start} - ${time.end}'
                : t.selection.time)),
        Padding(
            padding: const EdgeInsets.only(top: Insets.small),
            child: DropdownButtonFormField(
                iconEnabledColor: context.color.primaryColor,
                iconDisabledColor: context.color.primaryColor,
                hint: Text(t.selection.day, style: context.text.mediumText),
                items: t.week.isEven.reversed.map((e) {
                  final int i = t.week.isEven.indexOf(e);

                  final bool? isEven = i == 0
                      ? true
                      : i == 1
                          ? false
                          : null;

                  return DropdownMenuItem(value: isEven, child: Text(e));
                }).toList(),
                onChanged: (v) {
                  isEven = v;
                })),
        const DayDropdownWidget()
      ]),
    );
  }
}
