import 'package:appwrite/appwrite.dart';
import 'package:appwrite/models.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:daylist/.env';
import 'package:daylist/data/api/request/add/add_city_body.dart';
import 'package:daylist/data/api/request/add/add_group_body.dart';
import 'package:daylist/data/api/request/add/add_institution_body.dart';
import 'package:daylist/data/repository/auth_repository.dart';
import 'package:daylist/data/repository/city_data_repository.dart';
import 'package:daylist/data/repository/group_repository.dart';
import 'package:daylist/data/repository/institution_repository.dart';
import 'package:daylist/domain/model/city.dart';
import 'package:daylist/domain/model/group.dart';
import 'package:daylist/domain/model/institution.dart';
import 'package:daylist/domain/state/home/home_state.dart';
import 'package:daylist/domain/state/settings/settings_state.dart';
import 'package:daylist/internal/dependencies/dependencies.dart';
import 'package:daylist/presentation/extensions/context.dart';
import 'package:daylist/presentation/res/values.dart';
import 'package:daylist/presentation/translations/translations.g.dart';
import 'package:daylist/presentation/utils/string_gen.dart';
import 'package:daylist/presentation/utils/validator.dart';
import 'package:daylist/presentation/views/router.dart';
import 'package:daylist/presentation/views/widgets/adaptive.dart';
import 'package:daylist/presentation/views/widgets/dialog.dart';
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
              ref.read(settingsProvider.notifier).city = v;
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
                ref.read(settingsProvider.notifier).institution = v;
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
                ref.read(settingsProvider.notifier).group = v;

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
  final FutureProvider<List<T>> provider;

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

class _AddButtonWidget extends StatelessWidget {
  final _Type type;
  const _AddButtonWidget({required this.type});

  @override
  Widget build(BuildContext context) {
    switch (type) {
      case _Type.city:
        return Text.rich(t.selection.addText.city(
            tapHere: (v) => TextSpan(
                text: v,
                style: context.text.mediumText
                    .copyWith(fontWeight: FontWeight.bold),
                recognizer: TapGestureRecognizer()
                  ..onTap = () => showDialog(
                      context: context,
                      builder: (context) => const _AddCityDialog()))));
      case _Type.institution:
        return Text.rich(t.selection.addText.institution(
            tapHere: (v) => TextSpan(
                text: v,
                style: context.text.mediumText
                    .copyWith(fontWeight: FontWeight.bold),
                recognizer: TapGestureRecognizer()
                  ..onTap = () => showDialog(
                      context: context,
                      builder: (context) => const _AddInstitutionDialog()))));
      case _Type.group:
        return Text.rich(t.selection.addText.group(
            tapHere: (v) => TextSpan(
                text: v,
                style: context.text.mediumText
                    .copyWith(fontWeight: FontWeight.bold),
                recognizer: TapGestureRecognizer()
                  ..onTap = () => showDialog(
                      context: context,
                      builder: (context) => const _AddGroupDialog()))));
      default:
    }

    return const Placeholder();
  }
}

class _AddCityDialog extends StatefulHookConsumerWidget {
  const _AddCityDialog();

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _AddCityDialogState();
}

class _AddCityDialogState extends ConsumerState<_AddCityDialog> {
  late GlobalKey<FormState> formKey;
  late TextEditingController controller;

  @override
  void initState() {
    controller = TextEditingController();
    formKey = GlobalKey();
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  Future addCity() async {
    final User user =
        await AuthDataRepository(Dependencies().getIt.get()).getUser();

    try {
      await CityDataRepository(
              Dependencies().getIt.get(), Dependencies().getIt.get())
          .addCity(
              body: AddCityBody(
                  databaseId: databaseId,
                  collectionId: citiesCollectionId,
                  city: City(
                      id: ID.custom(StringGenerator.generate()),
                      createdBy: user.$id,
                      title: controller.text)))
          .then((value) {
        ref.invalidate(citiesProvider);
        context.pop();
      });
    } catch (e) {
      if (context.mounted) {
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text('$e')));
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return CustomDialog(
        title: t.selection.add,
        onSubmitted: addCity,
        children: [
          Form(
              key: formKey,
              child: TextFormField(
                  controller: controller,
                  validator: (v) => Validator().initials(v, checkLen: false),
                  onEditingComplete: () => formKey.currentState!.validate(),
                  onSaved: (newValue) => formKey.currentState!.validate(),
                  onFieldSubmitted: (value) => addCity(),
                  onChanged: (value) => formKey.currentState!.validate(),
                  decoration: InputDecoration(labelText: t.selection.title)))
        ]);
  }
}

class _AddInstitutionDialog extends StatefulHookConsumerWidget {
  const _AddInstitutionDialog();

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      __AddInstitutionState();
}

class __AddInstitutionState extends ConsumerState<_AddInstitutionDialog> {
  late TextEditingController title;
  late GlobalKey<FormState> titleState;

  late TextEditingController shortTitle;
  late GlobalKey<FormState> shortTitleState;

  @override
  void initState() {
    title = TextEditingController();
    titleState = GlobalKey();

    shortTitle = TextEditingController();
    shortTitleState = GlobalKey();

    super.initState();
  }

  @override
  void dispose() {
    title.dispose();
    shortTitle.dispose();
    super.dispose();
  }

  Future addInstitution() async {
    final User user =
        await AuthDataRepository(Dependencies().getIt.get()).getUser();

    try {
      await InstitutionDataRepository(
              Dependencies().getIt.get(), Dependencies().getIt.get())
          .addInstitution(
              body: AddInstitutionBody(
                  databaseId: databaseId,
                  collectionId: institutionsCollectionId,
                  institution: Institution(
                      id: ID.custom(StringGenerator.generate()),
                      title: title.text.trim(),
                      shortTitle: shortTitle.text.trim(),
                      createdBy: user.$id,
                      cityId: ref.watch(settingsProvider).city!.id)))
          .then((value) {
        ref.invalidate(institutionsProvider);
        context.pop();
      });
    } catch (e) {
      if (context.mounted) {
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text('$e')));
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return CustomDialog(
        title: t.selection.add,
        onSubmitted: addInstitution,
        children: [
          Form(
              key: titleState,
              child: TextFormField(
                  controller: title,
                  textInputAction: TextInputAction.next,
                  validator: (v) => Validator().initials(v, checkLen: false),
                  onEditingComplete: () => titleState.currentState!.validate(),
                  onSaved: (newValue) => titleState.currentState!.validate(),
                  onFieldSubmitted: (value) =>
                      titleState.currentState!.validate(),
                  onChanged: (value) => titleState.currentState!.validate(),
                  decoration: InputDecoration(labelText: t.selection.title))),
          Padding(
            padding: const EdgeInsets.only(top: Insets.small),
            child: Form(
                key: shortTitleState,
                child: TextFormField(
                    controller: shortTitle,
                    onFieldSubmitted: (value) => addInstitution(),
                    validator: (v) => Validator().initials(v, checkLen: false),
                    onChanged: (value) =>
                        shortTitleState.currentState!.validate(),
                    onSaved: (newValue) =>
                        shortTitleState.currentState!.validate(),
                    onEditingComplete: () =>
                        shortTitleState.currentState!.validate(),
                    decoration:
                        InputDecoration(labelText: t.selection.shortTitle))),
          ),
        ]);
  }
}

class _AddGroupDialog extends StatefulHookConsumerWidget {
  const _AddGroupDialog();

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      __AddGroupDialogState();
}

class __AddGroupDialogState extends ConsumerState<_AddGroupDialog> {
  late GlobalKey<FormState> formKey;
  late TextEditingController controller;

  @override
  void initState() {
    controller = TextEditingController();
    formKey = GlobalKey();
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  Future addGroup() async {
    final User user =
        await AuthDataRepository(Dependencies().getIt.get()).getUser();

    try {
      await GroupDataRepository(
              Dependencies().getIt.get(), Dependencies().getIt.get())
          .addGroup(
              body: AddGroupBody(
                  databaseId: databaseId,
                  collectionId: groupsCollectionId,
                  group: Group(
                      id: ID.custom(StringGenerator.generate()),
                      title: controller.text.trim(),
                      createdBy: user.$id,
                      institutionId:
                          ref.watch(settingsProvider).institution!.id)))
          .then((value) {
        ref.invalidate(groupsProvider);
        context.pop();
      });
    } catch (e) {
      if (context.mounted) {
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text('$e')));
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return CustomDialog(
        title: t.selection.add,
        onSubmitted: addGroup,
        children: [
          Form(
              key: formKey,
              child: TextFormField(
                  controller: controller,
                  validator: (v) => Validator.standart(v, checkLen: false),
                  onEditingComplete: () => formKey.currentState!.validate(),
                  onSaved: (newValue) => formKey.currentState!.validate(),
                  onFieldSubmitted: (value) => addGroup(),
                  onChanged: (value) => formKey.currentState!.validate(),
                  decoration: InputDecoration(labelText: t.selection.title)))
        ]);
  }
}

class _List<T> extends StatelessWidget {
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
  Widget build(BuildContext context) {
    return ScrollConfiguration(
        behavior: ScrollConfiguration.of(context).copyWith(
            dragDevices: {PointerDeviceKind.mouse, PointerDeviceKind.touch}),
        child: ListView.builder(
            physics: const BouncingScrollPhysics(),
            padding: const EdgeInsets.symmetric(horizontal: Insets.small),
            itemCount: data.length + 1,
            itemBuilder: (context, index) => (index != data.length)
                ? itemBuilder(data[index])
                : Center(
                    child: Container(
                        margin: const EdgeInsets.only(top: Insets.small),
                        padding: const EdgeInsets.all(Insets.small),
                        decoration: BoxDecoration(
                            border:
                                Border.all(color: context.color.primaryColor),
                            borderRadius:
                                BorderRadius.circular(context.value.radius)),
                        child: _AddButtonWidget(type: type)))));
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
        appBar: AppBar(title: Text(title)),
        body: _List(type: type, data: data, itemBuilder: itemBuilder));
  }
}

class _Tablet<T> extends StatelessWidget {
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
  Widget build(BuildContext context) {
    return Scaffold(
        body: Row(children: [
      Expanded(
          child: DecoratedBox(
              decoration: BoxDecoration(
                  color: context.color.primaryColor,
                  borderRadius: BorderRadius.horizontal(
                      right: Radius.circular(context.value.radius))),
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

class _Desktop<T> extends StatelessWidget {
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
  Widget build(BuildContext context) {
    return Scaffold(
        body: Row(children: [
      Expanded(
          flex: 2,
          child: DecoratedBox(
              decoration: BoxDecoration(
                  color: context.color.primaryColor,
                  borderRadius: BorderRadius.horizontal(
                      right: Radius.circular(context.value.radius))),
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
