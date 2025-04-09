import 'package:daylist/presentation/res/values.dart';
import 'package:daylist/presentation/translations/translations.g.dart';
import 'package:daylist/presentation/views/courses/course.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:unicons/unicons.dart';

class CoursesView extends StatelessWidget {
  const CoursesView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          leading: IconButton(
              onPressed: () => context.pop(),
              splashRadius: 20,
              icon: const Icon(UniconsLine.arrow_left)),
          title: Text(t.courses.title),
          actions: [
            // Padding(
            //     padding: const EdgeInsets.all(8),
            //     child: IconButton(
            //         onPressed: () => context.goNamed(ViewsNames.week),
            //         color: context.color.primaryColor,
            //         splashRadius: 20,
            //         icon: const Icon(UniconsLine.schedule))),
          ]),
      body: ListView.separated(
        itemCount: 20,
        padding: EdgeInsets.symmetric(
          horizontal: Insets.small,
        ),
        separatorBuilder: (context, index) {
          return SizedBox(
            height: Insets.small,
          );
        },
        itemBuilder: (context, index) {
          return CourseWidget();
        },
      ),
    );
  }
}
