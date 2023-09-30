import 'package:daylist/presentation/views/widgets/dialogs/add_city_dialog.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:daylist/domain/state/home/home_state.dart';
import 'package:daylist/domain/state/settings/settings_state.dart';
import 'package:daylist/presentation/extensions/theme/context.dart';
import 'package:daylist/presentation/res/values.dart';
import 'package:daylist/presentation/translations/translations.g.dart';
import 'package:daylist/presentation/views/router.dart';
import 'package:daylist/presentation/views/widgets/adaptive.dart';
import 'package:daylist/presentation/views/widgets/loader.dart';

enum _Type { city, institution, group }

class SelectionCityView extends HookConsumerWidget {
  const SelectionCityView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return _Selection(
        type: _Type.city,
        title: t.selection.select(context: SelectType.city),
        isCanBack: false,
        provider: citiesProvider,
        itemBuilder: (v) => ListTile(
            onTap: () {
              ref.read(settingsProvider).city = v;
              context.goNamed(ViewsNames.selectionInstitution);
            },
            title: Text(v.title)));
  }
}

class SelectionInstitutionView extends HookConsumerWidget {
  const SelectionInstitutionView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return _Selection(
        type: _Type.institution,
        title: t.selection.select(context: SelectType.institution),
        provider: institutionsProvider,
        itemBuilder: (v) => ListTile(
              onTap: () {
                ref.read(settingsProvider).institution = v;
                context.goNamed(ViewsNames.selectionGroup);
              },
              title: Text(v.title),
            ));
  }
}

class SelectionGroupView extends HookConsumerWidget {
  const SelectionGroupView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return _Selection(
        type: _Type.group,
        title: t.selection.select(context: SelectType.group),
        provider: groupsProvider,
        itemBuilder: (v) => ListTile(
              onTap: () {
                ref.read(settingsProvider).group = v;

                context.goNamed(ViewsNames.home);
              },
              title: Text(v.title),
            ));
  }
}

class _Selection<T> extends HookConsumerWidget {
  final _Type type;
  final String title;
  final bool isCanBack;
  final Widget Function(T) itemBuilder;
  final AutoDisposeFutureProvider<List<T>> provider;

  const _Selection(
      {this.isCanBack = true,
      required this.type,
      required this.title,
      required this.provider,
      required this.itemBuilder});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final AsyncValue<List<T>> config = ref.watch(provider);

    return Material(
        color: context.color.backgroundColor,
        child: LoaderWidget(
            config: config,
            builder: (v) => AdaptiveWidget(
                mobile: _Mobile(
                    type: type,
                    data: v,
                    title: title,
                    itemBuilder: itemBuilder),
                tablet: _Tablet(
                    type: type,
                    data: v,
                    title: title,
                    itemBuilder: itemBuilder,
                    isCanBack: isCanBack),
                desktop: _Desktop(
                    type: type,
                    data: v,
                    title: title,
                    itemBuilder: itemBuilder,
                    isCanBack: isCanBack))));
  }
}

// class _AddButtonWidget extends StatelessWidget {
//   final _Type type;
//   const _AddButtonWidget({required this.type});

//   @override
//   Widget build(BuildContext context) {
//     switch (type) {
//       case _Type.city:
//         return Text.rich(t.selection.addText.city(
//             tapHere: (v) => TextSpan(
//                 text: v,
//                 style: context.text.mediumText
//                     .copyWith(fontWeight: FontWeight.bold),
//                 recognizer: TapGestureRecognizer()
//                   ..onTap = () => showDialog(
//                       context: context,
//                       builder: (context) => const AddCityDialog()))));
//       case _Type.institution:
//         return Text.rich(t.selection.addText.institution(
//             tapHere: (v) => TextSpan(
//                 text: v,
//                 style: context.text.mediumText
//                     .copyWith(fontWeight: FontWeight.bold),
//                 recognizer: TapGestureRecognizer()
//                   ..onTap = () => showDialog(
//                       context: context,
//                       builder: (context) => const AddInstitutionDialog()))));
//       case _Type.group:
//         return Text.rich(t.selection.addText.group(
//             tapHere: (v) => TextSpan(
//                 text: v,
//                 style: context.text.mediumText
//                     .copyWith(fontWeight: FontWeight.bold),
//                 recognizer: TapGestureRecognizer()
//                   ..onTap = () => showDialog(
//                       context: context,
//                       builder: (context) => const AddGroupDialog()))));
//       default:
//     }

//     return const Placeholder();
//   }
// }

class _List<T> extends HookConsumerWidget {
  final _Type type;
  final List<T> data;
  final Widget Function(T) itemBuilder;

  const _List({
    Key? key,
    required this.type,
    required this.data,
    required this.itemBuilder,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ScrollConfiguration(
        behavior: ScrollConfiguration.of(context).copyWith(
            dragDevices: {PointerDeviceKind.mouse, PointerDeviceKind.touch}),
        child: ListView.builder(
            physics: const BouncingScrollPhysics(),
            padding: const EdgeInsets.symmetric(horizontal: Insets.small),
            itemCount: data.length,
            itemBuilder: (context, index) => itemBuilder(data[index])));
  }
}

class _Mobile<T> extends StatelessWidget {
  final _Type type;
  final String title;
  final List<T> data;
  final Widget Function(T) itemBuilder;

  const _Mobile(
      {Key? key,
      required this.type,
      required this.title,
      required this.data,
      required this.itemBuilder})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(title),
          actions: [
            IconButton(
                onPressed: () {
                  showDialog(
                      context: context, builder: (context) => AddCityDialog());
                },
                icon: Icon(Icons.add))
          ],
        ),
        body: _List(type: type, data: data, itemBuilder: itemBuilder));
  }
}

class _Tablet<T> extends HookConsumerWidget {
  final _Type type;
  final String title;
  final List<T> data;
  final bool isCanBack;
  final Widget Function(T) itemBuilder;
  const _Tablet(
      {Key? key,
      required this.type,
      required this.title,
      required this.data,
      required this.itemBuilder,
      required this.isCanBack})
      : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final double radius = ref.watch(settingsProvider).radius;

    return Scaffold(
        body: Row(children: [
      Expanded(
          child: DecoratedBox(
              decoration: BoxDecoration(
                  color: context.color.primaryColor,
                  borderRadius:
                      BorderRadius.horizontal(right: Radius.circular(radius))),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(title,
                        style: context.text.largeText
                            .copyWith(color: context.color.backgroundColor)),
                    isCanBack
                        ? Padding(
                            padding:
                                const EdgeInsets.only(top: Insets.standart),
                            child: ElevatedButton.icon(
                                style: ButtonStyle(
                                    backgroundColor: MaterialStatePropertyAll(
                                        context.color.backgroundColor)),
                                onPressed: () => context.pop(),
                                icon: const Icon(Icons.arrow_back),
                                label: Text(t.settings.back)))
                        : const SizedBox.shrink()
                  ]))),
      Expanded(
          flex: 2,
          child: _List(type: type, data: data, itemBuilder: itemBuilder))
    ]));
  }
}

class _Desktop<T> extends HookConsumerWidget {
  final _Type type;
  final String title;
  final List<T> data;
  final bool isCanBack;
  final Widget Function(T) itemBuilder;
  const _Desktop(
      {Key? key,
      required this.type,
      required this.title,
      required this.data,
      required this.itemBuilder,
      required this.isCanBack})
      : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final double radius = ref.watch(settingsProvider).radius;

    return Scaffold(
        body: Row(children: [
      Expanded(
          flex: 2,
          child: DecoratedBox(
              decoration: BoxDecoration(
                  color: context.color.primaryColor,
                  borderRadius:
                      BorderRadius.horizontal(right: Radius.circular(radius))),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(title,
                        style: context.text.largeText
                            .copyWith(color: context.color.backgroundColor)),
                    isCanBack
                        ? Padding(
                            padding:
                                const EdgeInsets.only(top: Insets.standart),
                            child: ElevatedButton.icon(
                                style: ButtonStyle(
                                    backgroundColor: MaterialStatePropertyAll(
                                        context.color.backgroundColor)),
                                onPressed: () => context.pop(),
                                icon: const Icon(Icons.arrow_back),
                                label: Text(t.settings.back)))
                        : const SizedBox.shrink()
                  ]))),
      Expanded(
          flex: 2,
          child: _List(type: type, data: data, itemBuilder: itemBuilder))
    ]));
  }
}
