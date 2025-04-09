import 'package:daylist/domain/state/settings/settings_state.dart';
import 'package:daylist/presentation/extensions/theme/context.dart';
import 'package:daylist/presentation/res/values.dart';
import 'package:daylist/presentation/views/widgets/section.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:unicons/unicons.dart';

class CourseView extends HookConsumerWidget {
  const CourseView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final double radius = ref.watch(settingsProvider).radius;

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () => context.pop(),
            splashRadius: 20,
            icon: const Icon(UniconsLine.arrow_left)),
        // title: Text(t.settings.app_name),
        // actions: [
        //   Padding(
        //       padding: const EdgeInsets.all(8),
        //       child: IconButton(
        //           onPressed: () => context.goNamed(ViewsNames.week),
        //           color: context.color.primaryColor,
        //           splashRadius: 20,
        //           icon: const Icon(UniconsLine.schedule))),
        // ]),
      ),
      body: CustomScrollView(
        slivers: [
          SliverPadding(
            padding: EdgeInsets.symmetric(horizontal: Insets.small),
            sliver: SliverList.list(children: [
              SectionWidget(
                  title: 'Основы программирования на Python',
                  children: [
                    Container(
                      height: 250,
                      margin: EdgeInsets.fromLTRB(8, 0, 8, 8),
                      decoration: BoxDecoration(
                        image: DecorationImage(
                            fit: BoxFit.cover,
                            image: NetworkImage(
                              'https://i.pinimg.com/originals/0a/74/42/0a74428d831ea6f84702a980ccb00bed.jpg',
                            )),
                        borderRadius: BorderRadius.circular(radius - 4),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text('2 часа', style: context.text.largeText),
                        Text('5 уроков', style: context.text.largeText)
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(8, 4, 8, 8),
                      child: Row(
                        children: [
                          Expanded(
                            child: Text(
                              'Краткий курс для начинающих: от переменных до функций. Практические задания и поддержка.',
                              style: context.text.mediumText,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(
                        Insets.small / 2,
                      ),
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Expanded(
                              child: Text(
                                '1499 руб',
                                style: context.text.largeText.copyWith(
                                  fontWeight: FontWeight.bold,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ),
                            // Spacer(),
                            Expanded(
                              child: TextButton(
                                onPressed: () {},
                                child: Text('Купить',
                                    style: context.text.mediumText
                                    // .copyWith(color: Colors.white),
                                    ),
                              ),
                            )
                          ]),
                    )
                  ]),
              SizedBox(
                height: Insets.small,
              ),
              SectionWidget(
                children: [
                  ExpansionTile(
                    textColor: context.color.primaryColor,
                    collapsedTextColor: context.color.primaryColor,
                    title: Text(
                      'Дополнительные материалы',
                      // style: context.text.mediumText
                    ),
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          'Дополнительные материалы',
                          style: context.text.mediumText,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          'Дополнительные материалы',
                          style: context.text.mediumText,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          'Дополнительные материалы',
                          style: context.text.mediumText,
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ]),
          ),
        ],
      ),
    );
  }
}
