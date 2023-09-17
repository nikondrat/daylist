import 'package:daylist/domain/model/city.dart';
import 'package:daylist/domain/model/group.dart';
import 'package:daylist/domain/model/institution.dart';
import 'package:daylist/domain/state/settings/settings_state.dart';
import 'package:daylist/presentation/extensions/theme/context.dart';
import 'package:daylist/presentation/res/values.dart';
import 'package:daylist/presentation/translations/translations.g.dart';
import 'package:daylist/presentation/views/router.dart';
import 'package:daylist/presentation/views/widgets/list.dart';
import 'package:daylist/presentation/views/widgets/section.dart';
import 'package:daylist/presentation/views/widgets/subsection.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:unicons/unicons.dart';
import 'package:url_launcher/url_launcher.dart';

class SettingsView extends HookConsumerWidget {
  const SettingsView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
        appBar: AppBar(
            leading: IconButton(
                onPressed: () => context.pop(),
                splashRadius: 20,
                icon: const Icon(Icons.arrow_back)),
            title: Text(t.settings.title)),
        body: const CustomListWidget(children: [
          _GeneralSectionWidget(),
          _ThemeSectionWidget(),
          _OptionalSectionWidget(),
        ]));
    // const AdaptiveWidget(
    // mobile: _Mobile(), tablet: _Tablet(), desktop: _Desktop()));
  }
}

class _GeneralSectionWidget extends HookConsumerWidget {
  const _GeneralSectionWidget();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final bool isScheduler = ref.watch(settingsProvider).isScheduler;
    final City? city = ref.watch(cityProvider);
    final Institution? institution = ref.watch(institutionProvider);
    final Group? group = ref.watch(groupProvider);
    final int undergroup = ref.watch(undergroupProvider);

    return SectionWidget(title: t.settings.general, children: [
      isScheduler || kDebugMode
          ? SubsectionWidget(
              subsection: Subsection(
                  icon: const Icon(UniconsLine.constructor),
                  onTap: () => context.goNamed(ViewsNames.sheduler),
                  trailing: [const Icon(Icons.arrow_forward)],
                  title: t.settings.scheduler))
          : const SizedBox.shrink(),
      SubsectionWidget(
          subsection: Subsection(
              icon: const Icon(UniconsLine.building),
              onTap: () => router.pushNamed(ViewsNames.selectionCity),
              title: t.settings.city,
              trailing: [Text(city!.title)])),
      SubsectionWidget(
          subsection: Subsection(
              icon: const Icon(UniconsLine.graduation_cap),
              onTap: () => router.pushNamed(ViewsNames.selectionInstitution),
              title: t.settings.institution,
              trailing: [Text(institution!.shortTitle)])),
      SubsectionWidget(
          subsection: Subsection(
              icon: const Icon(UniconsLine.cell),
              onTap: () => router.pushNamed(ViewsNames.selectionGroup),
              title: t.settings.group,
              trailing: [Text(group!.title)])),
      SubsectionWidget(
          subsection: Subsection(
              icon: const Icon(UniconsLine.yin_yang),
              title: t.settings.undergroup,
              onTap: () => ref.read(settingsProvider).undergroup =
                  undergroup == 1 ? 2 : 1,
              trailing: [Text('$undergroup')]))
    ]);
  }
}

class _ColorSelector extends HookConsumerWidget {
  final Color color;
  final Function(Color) onColorChanged;
  const _ColorSelector({required this.color, required this.onColorChanged});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final double radius = ref.watch(radiusProvider);

    return AlertDialog(
        title: Text(t.settings.pick_color),
        content: SingleChildScrollView(
            child: ColorPicker(
                pickerAreaBorderRadius: BorderRadius.circular(radius),
                pickerColor: color,
                enableAlpha: false,
                onColorChanged: onColorChanged)));
  }
}

class _ThemeSectionWidget extends HookConsumerWidget {
  const _ThemeSectionWidget();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    const Size circleSize = Size(30, 30);
    final bool isDark = ref.watch(isDarkProvider);

    final Color? primaryColor = ref.watch(primaryColorProvider);
    final Color? backgroundColor = ref.watch(backgroundColorProvider);

    final double radius = ref.watch(radiusProvider);

    return SectionWidget(
        title: t.settings.theme,
        margin: const EdgeInsets.symmetric(vertical: Insets.small),
        children: [
          SubsectionWidget(
              subsection: Subsection(
                  title: t.settings.primary_color,
                  icon: const Icon(UniconsLine.dice_one),
                  onTap: () => showDialog(
                      context: context,
                      builder: (context) => _ColorSelector(
                          color: ref.watch(primaryColorProvider) ??
                              context.color.primaryColor,
                          onColorChanged: (v) {
                            ref.read(settingsProvider).primaryColor = v;
                          })).then(
                      (value) => ref.watch(settingsProvider).updateSettings()),
                  trailing: [
                primaryColor != null
                    ? IconButton(
                        onPressed: () {
                          ref.read(settingsProvider).primaryColor = null;
                          ref.watch(settingsProvider).updateSettings();
                        },
                        icon: const Icon(UniconsLine.history_alt))
                    : const SizedBox.shrink(),
                DecoratedBox(
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: context.color.primaryColor),
                    child: SizedBox(
                        height: circleSize.height, width: circleSize.width))
              ])),
          SubsectionWidget(
              subsection: Subsection(
                  title: t.settings.background_color,
                  icon: const Icon(UniconsLine.dice_two),
                  onTap: () => showDialog(
                      context: context,
                      builder: (context) => _ColorSelector(
                          color: ref.watch(backgroundColorProvider) ??
                              context.color.backgroundColor,
                          onColorChanged: (v) => ref
                              .read(settingsProvider)
                              .backgroundColor = v)).then(
                      (value) => ref.watch(settingsProvider).updateSettings()),
                  trailing: [
                backgroundColor != null
                    ? IconButton(
                        onPressed: () {
                          ref.read(settingsProvider).backgroundColor = null;
                          ref.watch(settingsProvider).updateSettings();
                        },
                        icon: const Icon(UniconsLine.history_alt))
                    : const SizedBox.shrink(),
                DecoratedBox(
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(
                            color: context.color.primaryColor,
                            width: context.value.width),
                        color: context.color.backgroundColor),
                    child: SizedBox(
                        height: circleSize.height, width: circleSize.width))
              ])),
          SubsectionWidget(
              subsection: Subsection(
                  icon: Icon(isDark ? UniconsLine.moon : UniconsLine.sun),
                  title: isDark
                      ? t.settings.theme_mode.dark
                      : t.settings.theme_mode.light,
                  onTap: () => ref.read(settingsProvider).isDark = !isDark,
                  trailing: [
                Switch(
                    value: isDark,
                    onChanged: (value) =>
                        ref.read(settingsProvider).isDark = !isDark)
              ])),
          SubsectionWidget(
              subsection: Subsection(title: t.settings.radius, trailing: [
            radius != kDefaultRadius
                ? IconButton(
                    onPressed: () {
                      ref.read(settingsProvider).radius = kDefaultRadius;
                      ref.watch(settingsProvider).updateSettings();
                    },
                    splashRadius: 20,
                    icon: const Icon(UniconsLine.history_alt))
                : const SizedBox.shrink()
          ])),
          Slider(
              max: 40,
              value: radius,
              onChangeEnd: (value) {
                ref.watch(settingsProvider).updateSettings();
              },
              onChanged: (value) => ref.read(settingsProvider).radius = value),
        ]);
  }
}

class _OptionalSectionWidget extends HookConsumerWidget {
  const _OptionalSectionWidget();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final bool isShowTime = ref.watch(isShowTimeProvider);
    final bool isShortInitials = ref.watch(isShortInitialsProvider);
    final bool isEvenWeek = ref.watch(isEvenWeekProvider);

    return SectionWidget(
        title: t.settings.optional,
        margin: const EdgeInsets.only(bottom: Insets.small),
        children: [
          SubsectionWidget(
              subsection: Subsection(
                  icon: !isEvenWeek
                      ? const Icon(FontAwesomeIcons.squarePlus)
                      : const Icon(FontAwesomeIcons.squareMinus),
                  title: !isEvenWeek ? t.week.isEven[0] : t.week.isEven[1],
                  trailing: [
                    Switch(
                        value: !isEvenWeek,
                        onChanged: (v) =>
                            ref.read(settingsProvider).isEvenWeek = v)
                  ],
                  onTap: () =>
                      ref.read(settingsProvider).isEvenWeek = !isEvenWeek)),
          SubsectionWidget(
              subsection: Subsection(
                  title: t.settings.show_time,
                  icon: const Icon(UniconsLine.clock),
                  trailing: [
                    Switch(
                        value: isShowTime,
                        onChanged: (v) =>
                            ref.read(settingsProvider).isShowTime = v)
                  ],
                  onTap: () =>
                      ref.read(settingsProvider).isShowTime = !isShowTime)),
          SubsectionWidget(
              subsection: Subsection(
                  title: t.settings.short_initials,
                  icon: const Icon(UniconsLine.text),
                  trailing: [
                    Switch(
                        value: isShortInitials,
                        onChanged: (v) =>
                            ref.read(settingsProvider).isShortInitials = v)
                  ],
                  onTap: () => ref.read(settingsProvider).isShortInitials =
                      !isShortInitials)),
          SubsectionWidget(
              subsection: Subsection(
                  onTap: () async {
                    if (!await launchUrl(
                            Uri.parse('https://t.me/${t.settings.support.tag}'),
                            mode: LaunchMode.externalApplication) &&
                        context.mounted) {
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                          content: Text('ERROR!'),
                          backgroundColor: Colors.red));
                    }
                  },
                  icon: const Icon(UniconsLine.comment_alt_exclamation),
                  title: t.settings.support.questions,
                  trailing: [const Icon(UniconsLine.external_link_alt)])),
          SubsectionWidget(
              subsection: Subsection(
                  onTap: () async {
                    if (!await launchUrl(
                            Uri.parse(t.settings.support.money.url)) &&
                        context.mounted) {
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                          content: Text('ERROR!'),
                          backgroundColor: Colors.red));
                    }
                  },
                  icon: const Icon(UniconsLine.dollar_sign),
                  trailing: [const Icon(UniconsLine.external_link_alt)],
                  title: t.settings.support.money.title)),
        ]);
  }
}


// class _Mobile extends StatelessWidget {
//   const _Mobile();

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         appBar: AppBar(title: Text(t.settings.title)),
//         body: ScrollConfiguration(
//             behavior: ScrollConfiguration.of(context).copyWith(dragDevices: {
//               PointerDeviceKind.mouse,
//               PointerDeviceKind.touch
//             }),
//             child: ListView(
//                 physics: const BouncingScrollPhysics(),
//                 padding: const EdgeInsets.symmetric(horizontal: Insets.small),
//                 children: [_GeneralSectionWidget(), _ThemeSectionWidget()])));
//   }
// }

// class _Tablet extends StatelessWidget {
//   const _Tablet();

//   @override
//   Widget build(BuildContext context) {
//     return const Scaffold();
//   }
// }

// class _Desktop extends StatelessWidget {
//   const _Desktop();

//   @override
//   Widget build(BuildContext context) {
//     return const Scaffold();
//   }
// }
