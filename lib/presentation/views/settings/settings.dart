import 'package:daylist/domain/state/settings/settings_state.dart';
import 'package:daylist/presentation/extensions/context.dart';
import 'package:daylist/presentation/res/values.dart';
import 'package:daylist/presentation/translations/translations.g.dart';
import 'package:daylist/presentation/views/router.dart';
import 'package:daylist/presentation/views/widgets/adaptive.dart';
import 'package:daylist/presentation/views/widgets/section.dart';
import 'package:daylist/presentation/views/widgets/subsection.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:unicons/unicons.dart';

class SettingsView extends HookConsumerWidget {
  const SettingsView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Material(
        color: context.color.backgroundColor,
        child: AdaptiveWidget(
            mobile: _Mobile(), tablet: _Tablet(), desktop: _Desktop()));
  }
}

class _GeneralSectionWidget extends HookConsumerWidget {
  const _GeneralSectionWidget();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final settings = ref.watch(settingsProvider);

    return SectionWidget(title: t.settings.general, children: [
      SubsectionWidget(
          subsection: Subsection(
              icon: const Icon(UniconsLine.building),
              onTap: () => router.pushNamed(ViewsNames.selectionCity),
              title: t.settings.city,
              trailing: [Text(settings.city!.title)])),
      SubsectionWidget(
          subsection: Subsection(
              icon: const Icon(UniconsLine.graduation_cap),
              onTap: () => router.pushNamed(ViewsNames.selectionInstitution),
              title: t.settings.institution,
              trailing: [Text(settings.institution!.shortTitle)])),
      SubsectionWidget(
          subsection: Subsection(
              icon: const Icon(UniconsLine.cell),
              onTap: () => router.pushNamed(ViewsNames.selectionGroup),
              title: t.settings.group,
              trailing: [Text(settings.group!.title)])),
      SubsectionWidget(
          subsection: Subsection(
              icon: const Icon(UniconsLine.yin_yang),
              title: t.settings.undergroup,
              onTap: () => ref.read(settingsProvider.notifier).undergroup =
                  settings.undergroup == 1 ? 2 : 1,
              trailing: [Text('${settings.undergroup}')]))
    ]);
  }
}

class _ColorSelector extends HookConsumerWidget {
  final Color pickerColor;
  final Function(Color) onColorChanged;
  const _ColorSelector(
      {required this.pickerColor, required this.onColorChanged});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return AlertDialog(
        title: Text(t.settings.pick_color),
        content: SingleChildScrollView(
            child: ColorPicker(
                pickerAreaBorderRadius:
                    BorderRadius.circular(context.value.radius),
                pickerColor: pickerColor,
                onColorChanged: onColorChanged)));
  }
}

class _ThemeSectionWidget extends HookConsumerWidget {
  const _ThemeSectionWidget();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    const Size circleSize = Size(30, 30);
    final bool isDark = ref.watch(settingsProvider).isDark;

    return SectionWidget(
        title: t.settings.theme,
        margin: const EdgeInsets.only(top: Insets.small),
        children: [
          SubsectionWidget(
              subsection: Subsection(
                  title: t.settings.primary_color,
                  icon: const Icon(UniconsLine.dice_one),
                  onTap: () => showDialog(
                      context: context,
                      builder: (context) => _ColorSelector(
                          pickerColor: context.color.primaryColor,
                          onColorChanged: (v) => ref
                              .read(settingsProvider.notifier)
                              .primaryColor = v)),
                  trailing: [
                ref.read(settingsProvider.notifier).primaryColor != null
                    ? IconButton(
                        onPressed: () => ref
                            .read(settingsProvider.notifier)
                            .primaryColor = null,
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
                          pickerColor: context.color.backgroundColor,
                          onColorChanged: (v) => ref
                              .read(settingsProvider.notifier)
                              .backgroundColor = v)),
                  trailing: [
                ref.read(settingsProvider.notifier).backgroundColor != null
                    ? IconButton(
                        onPressed: () => ref
                            .read(settingsProvider.notifier)
                            .backgroundColor = null,
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
                  onTap: () =>
                      ref.read(settingsProvider.notifier).switchTheme(),
                  trailing: [
                Switch(
                    value: isDark,
                    onChanged: (value) =>
                        ref.read(settingsProvider.notifier).switchTheme())
              ])),
          SubsectionWidget(subsection: Subsection(title: 'Углы блоков')),
          Slider(
              max: 40,
              value: ref.watch(settingsProvider).radius,
              onChanged: (value) =>
                  ref.read(settingsProvider.notifier).radius = value),
        ]);
  }
}

class _Mobile extends StatelessWidget {
  const _Mobile();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text(t.settings.title)),
        body: ScrollConfiguration(
            behavior: ScrollConfiguration.of(context).copyWith(dragDevices: {
              PointerDeviceKind.mouse,
              PointerDeviceKind.touch
            }),
            child: ListView(
                physics: const BouncingScrollPhysics(),
                padding: const EdgeInsets.symmetric(horizontal: Insets.small),
                children: [_GeneralSectionWidget(), _ThemeSectionWidget()])));
  }
}

class _Tablet extends StatelessWidget {
  const _Tablet();

  @override
  Widget build(BuildContext context) {
    return const Scaffold();
  }
}

class _Desktop extends StatelessWidget {
  const _Desktop();

  @override
  Widget build(BuildContext context) {
    return const Scaffold();
  }
}
