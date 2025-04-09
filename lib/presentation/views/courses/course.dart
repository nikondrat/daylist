import 'package:daylist/domain/state/settings/settings_state.dart';
import 'package:daylist/presentation/extensions/theme/context.dart';
import 'package:daylist/presentation/views/router.dart';
import 'package:daylist/presentation/views/widgets/section.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class CourseWidget extends HookConsumerWidget {
  const CourseWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final double radius = ref.watch(settingsProvider).radius;

    return GestureDetector(
      onTap: () {
        context.pushNamed(ViewsNames.course);
      },
      child: SectionWidget(children: [
        Row(
          children: [
            Expanded(
              flex: 4,
              child: Container(
                height: 250,
                margin: EdgeInsets.all(8),
                decoration: BoxDecoration(
                  image: DecorationImage(
                      fit: BoxFit.cover,
                      image: NetworkImage(
                        'https://i.pinimg.com/originals/0a/74/42/0a74428d831ea6f84702a980ccb00bed.jpg',
                      )),
                  borderRadius: BorderRadius.circular(radius - 4),
                ),
              ),
            ),
            Expanded(
                flex: 4,
                child: Column(
                  children: [
                    Text(
                      'Основы программирования на Python',
                      maxLines: 4,
                      overflow: TextOverflow.ellipsis,
                      style: context.text.largeText.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text('2 часа', style: context.text.largeText),
                        Text('5 уроков', style: context.text.largeText)
                      ],
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: Text(
                            'Краткий курс для начинающих: от переменных до функций. Практические задания и поддержка.',
                          ),
                        ),
                      ],
                    ),
                    Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Text(
                            '1499 руб',
                            style: context.text.largeText.copyWith(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          TextButton(
                            onPressed: () {},
                            child: Text('Купить', style: context.text.mediumText
                                // .copyWith(color: Colors.white),
                                ),
                          )
                        ])
                  ],
                ))
          ],
        )
      ]),
    );
  }
}
