import 'package:appwrite/appwrite.dart';
import 'package:daylist/data/repository/user_data_repository.dart';
import 'package:daylist/domain/state/settings/settings_state.dart';
import 'package:daylist/presentation/extensions/theme/context.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:unicons/unicons.dart';

import 'package:daylist/data/api/request/auth/sign_up_body.dart';
import 'package:daylist/data/repository/auth_data_repository.dart';
import 'package:daylist/domain/state/auth/auth_state.dart';
import 'package:daylist/internal/dependencies/dependencies.dart';
import 'package:daylist/presentation/res/values.dart';
import 'package:daylist/presentation/translations/translations.g.dart';
import 'package:daylist/presentation/utils/validator.dart';
import 'package:daylist/presentation/views/router.dart';
import 'package:daylist/presentation/views/widgets/adaptive.dart';

class SignUpView extends StatefulHookConsumerWidget {
  const SignUpView({super.key});

  @override
  ConsumerState<SignUpView> createState() => _SignUpViewState();
}

class _SignUpViewState extends ConsumerState<SignUpView> {
  late GlobalKey<FormState> emailState;
  late GlobalKey<FormState> passwordState;
  late TextEditingController email;
  late TextEditingController password;

  @override
  void initState() {
    emailState = GlobalKey();
    passwordState = GlobalKey();
    email = TextEditingController();
    password = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    emailState.currentState?.dispose();
    passwordState.currentState?.dispose();
    email.dispose();
    password.dispose();
    super.dispose();
  }

  Future signUp() async {
    if (!emailState.currentState!.validate() ||
        !passwordState.currentState!.validate()) return;

    try {
      await AuthDataRepository(Dependencies().getIt.get())
          .signUp(
              body: SignUpBody(
                  email: email.text.trim(), password: password.text.trim()))
          .then((value) {
        UserDataRepository(Dependencies().getIt.get()).setIsAuthorized(true);

        context.goNamed(ViewsNames.selectionCity);
      });
    } on AppwriteException catch (e) {
      switch (e.code) {
        case 409:
          ref.read(authErrorProvider.notifier).update((state) => t.errors.used);
          break;
        default:
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return AdaptiveWidget(
        mobile: _Mobile(
            passwordState: passwordState,
            emailState: emailState,
            password: password,
            email: email,
            signUp: signUp),
        tablet: _Tablet(
            passwordState: passwordState,
            emailState: emailState,
            password: password,
            email: email,
            signUp: signUp),
        desktop: _Desktop(
            passwordState: passwordState,
            emailState: emailState,
            password: password,
            email: email,
            signUp: signUp));
  }
}

class _Logo extends StatelessWidget {
  final Color? color;
  const _Logo({this.color});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.symmetric(vertical: context.value.padding),
        child: Align(
            alignment: Alignment.center,
            child: Text(t.settings.app_name,
                style: context.text.largeText
                    .copyWith(fontSize: 28, color: color))));
  }
}

class _Error extends HookConsumerWidget {
  const _Error();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final String? error = ref.watch(authErrorProvider);
    if (error != null) {
      return Padding(
          padding: const EdgeInsets.only(top: Insets.small / 2),
          child: Text(error,
              style: context.text.mediumText.copyWith(color: Colors.red)));
    }
    return const SizedBox.shrink();
  }
}

class _Fields extends HookConsumerWidget {
  final GlobalKey<FormState> emailState;
  final GlobalKey<FormState> passwordState;
  final TextEditingController email;
  final TextEditingController password;
  final Future Function() signUp;

  const _Fields(
      {Key? key,
      required this.emailState,
      required this.passwordState,
      required this.email,
      required this.password,
      required this.signUp})
      : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final bool isShowPassword = ref.watch(isShowPasswordProvider);

    return Column(children: [
      Padding(
          padding: EdgeInsets.only(top: context.value.padding / 2),
          child: Form(
              key: emailState,
              child: TextFormField(
                  controller: email,
                  keyboardType: TextInputType.emailAddress,
                  textInputAction: TextInputAction.next,
                  validator: (v) => Validator().email(v),
                  onFieldSubmitted: (value) =>
                      emailState.currentState!.validate(),
                  onChanged: (value) => emailState.currentState!.validate(),
                  decoration: InputDecoration(labelText: t.auth.email)))),
      Padding(
          padding: EdgeInsets.only(top: context.value.padding / 2),
          child: Form(
              key: passwordState,
              child: TextFormField(
                  controller: password,
                  obscureText: !isShowPassword,
                  keyboardType: TextInputType.visiblePassword,
                  validator: (v) => Validator.standart(v),
                  onFieldSubmitted: (value) => signUp(),
                  onChanged: (value) => passwordState.currentState!.validate(),
                  decoration: InputDecoration(
                      labelText: t.auth.password,
                      suffix: GestureDetector(
                          onTap: () => ref
                              .read(isShowPasswordProvider.notifier)
                              .update((state) => !state),
                          child: isShowPassword
                              ? const Icon(UniconsLine.eye_slash)
                              : const Icon(UniconsLine.eye))))))
    ]);
  }
}

class _SignUpButton extends HookConsumerWidget {
  final Future Function() signUp;
  const _SignUpButton({required this.signUp});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Padding(
        padding: EdgeInsets.only(top: context.value.padding),
        child: Row(children: [
          Expanded(
              child: ElevatedButton(
                  onPressed: signUp,
                  child: Text(t.auth.signUp,
                      style: context.text.mediumText
                          .copyWith(color: context.color.backgroundColor))))
        ]));
  }
}

class _Mobile extends StatelessWidget {
  final GlobalKey<FormState> emailState;
  final GlobalKey<FormState> passwordState;
  final TextEditingController email;
  final TextEditingController password;
  final Future Function() signUp;

  const _Mobile({
    Key? key,
    required this.emailState,
    required this.passwordState,
    required this.email,
    required this.password,
    required this.signUp,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: ScrollConfiguration(
            behavior: ScrollConfiguration.of(context).copyWith(dragDevices: {
              PointerDeviceKind.mouse,
              PointerDeviceKind.touch
            }),
            child: Center(
              child: ListView(
                  shrinkWrap: true,
                  physics: const BouncingScrollPhysics(),
                  padding: const EdgeInsets.symmetric(horizontal: Insets.small),
                  children: [
                    const _Logo(),
                    Text(t.auth.helpers.titles.signUp),
                    const _Error(),
                    _Fields(
                        emailState: emailState,
                        passwordState: passwordState,
                        email: email,
                        password: password,
                        signUp: signUp),
                    _SignUpButton(signUp: signUp)
                  ]),
            )));
  }
}

class _Tablet extends HookConsumerWidget {
  final GlobalKey<FormState> emailState;
  final GlobalKey<FormState> passwordState;
  final TextEditingController email;
  final TextEditingController password;
  final Future Function() signUp;

  const _Tablet({
    Key? key,
    required this.emailState,
    required this.passwordState,
    required this.email,
    required this.password,
    required this.signUp,
  }) : super(key: key);

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
                    Column(children: [
                      _Logo(color: context.color.backgroundColor),
                      Text(t.auth.helpers.titles.signUp,
                          style: context.text.mediumText
                              .copyWith(color: context.color.backgroundColor))
                    ]),
                    Padding(
                        padding: const EdgeInsets.only(top: Insets.standart),
                        child: ElevatedButton.icon(
                            style: ButtonStyle(
                                backgroundColor: MaterialStatePropertyAll(
                                    context.color.backgroundColor)),
                            onPressed: () => context.pop(),
                            icon: const Icon(Icons.arrow_back),
                            label: Text(t.settings.back)))
                  ]))),
      Expanded(
          flex: 2,
          child: Center(
              child: ScrollConfiguration(
                  behavior: ScrollConfiguration.of(context).copyWith(
                      dragDevices: {
                        PointerDeviceKind.mouse,
                        PointerDeviceKind.touch
                      }),
                  child: ListView(
                      shrinkWrap: true,
                      physics: const BouncingScrollPhysics(),
                      padding:
                          const EdgeInsets.symmetric(horizontal: Insets.small),
                      children: [
                        const _Error(),
                        _Fields(
                            emailState: emailState,
                            passwordState: passwordState,
                            email: email,
                            password: password,
                            signUp: signUp),
                        _SignUpButton(signUp: signUp)
                      ]))))
    ]));
  }
}

class _Desktop extends HookConsumerWidget {
  final GlobalKey<FormState> emailState;
  final GlobalKey<FormState> passwordState;
  final TextEditingController email;
  final TextEditingController password;
  final Future Function() signUp;

  const _Desktop({
    Key? key,
    required this.emailState,
    required this.passwordState,
    required this.email,
    required this.password,
    required this.signUp,
  }) : super(key: key);

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
                    Column(children: [
                      _Logo(color: context.color.backgroundColor),
                      Text(t.auth.helpers.titles.signUp,
                          style: context.text.mediumText
                              .copyWith(color: context.color.backgroundColor))
                    ]),
                    Padding(
                        padding: const EdgeInsets.only(top: Insets.standart),
                        child: ElevatedButton.icon(
                            style: ButtonStyle(
                                backgroundColor: MaterialStatePropertyAll(
                                    context.color.backgroundColor)),
                            onPressed: () => context.pop(),
                            icon: const Icon(Icons.arrow_back),
                            label: Text(t.settings.back)))
                  ]))),
      Expanded(
          child: Center(
              child: ScrollConfiguration(
                  behavior: ScrollConfiguration.of(context).copyWith(
                      dragDevices: {
                        PointerDeviceKind.mouse,
                        PointerDeviceKind.touch
                      }),
                  child: ListView(
                      shrinkWrap: true,
                      physics: const BouncingScrollPhysics(),
                      padding:
                          const EdgeInsets.symmetric(horizontal: Insets.small),
                      children: [
                        const _Error(),
                        _Fields(
                            emailState: emailState,
                            passwordState: passwordState,
                            email: email,
                            password: password,
                            signUp: signUp),
                        _SignUpButton(signUp: signUp)
                      ]))))
    ]));
  }
}
