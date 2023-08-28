import 'package:appwrite/appwrite.dart';
import 'package:daylist/domain/state/auth/auth_state.dart';
import 'package:daylist/presentation/extensions/theme/context.dart';
import 'package:daylist/presentation/utils/validator.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:unicons/unicons.dart';

import 'package:daylist/presentation/res/values.dart';
import 'package:daylist/presentation/translations/translations.g.dart';
import 'package:daylist/presentation/views/widgets/adaptive.dart';

class LoginView extends StatefulHookConsumerWidget {
  const LoginView({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _LoginViewState();
}

class _LoginViewState extends ConsumerState<LoginView> {
  late GlobalKey<FormState> emailState;
  late GlobalKey<FormState> passwordState;
  late TextEditingController emailController;
  late TextEditingController passwordController;

  @override
  void initState() {
    emailState = GlobalKey();
    passwordState = GlobalKey();
    emailController = TextEditingController();
    passwordController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    emailState.currentState?.dispose();
    passwordState.currentState?.dispose();
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  Future signIn() async {
    if (!emailState.currentState!.validate() ||
        !passwordState.currentState!.validate()) return;

    try {
      throw Exception();
      // await AuthDataRepository(Dependencies().getIt.get())
      //     .login(
      //         body: SignInBody(
      //             email: emailController.text.trim(),
      //             password: passwordController.text.trim()))
      //     .then((value) => context.goNamed(ViewsNames.home));
    } on AppwriteException catch (e) {
      switch (e.code) {
        case 401:
          ref
              .read(authErrorProvider.notifier)
              .update((state) => t.auth.errors.wrong);
          break;
        default:
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return AdaptiveWidget(
        mobile: _Mobile(
            emailState: emailState,
            passwordState: passwordState,
            emailController: emailController,
            passwordController: passwordController,
            signIn: signIn),
        tablet: _Tablet(
            emailState: emailState,
            passwordState: passwordState,
            emailController: emailController,
            passwordController: passwordController,
            signIn: signIn),
        desktop: _Desktop(
            emailState: emailState,
            passwordState: passwordState,
            emailController: emailController,
            passwordController: passwordController,
            signIn: signIn));
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
              style:
                  context.text.largeText.copyWith(fontSize: 28, color: color)),
        ));
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
  final TextEditingController emailController;
  final TextEditingController passwordController;
  final Future Function() signIn;

  const _Fields(
      {Key? key,
      required this.emailState,
      required this.passwordState,
      required this.emailController,
      required this.passwordController,
      required this.signIn})
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
                  controller: emailController,
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
                  controller: passwordController,
                  validator: (v) => Validator.standart(v),
                  onFieldSubmitted: (value) => signIn(),
                  obscureText: !isShowPassword,
                  onChanged: (value) => passwordState.currentState!.validate(),
                  keyboardType: TextInputType.visiblePassword,
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

class _SignInButton extends StatelessWidget {
  final Future Function() signIn;
  const _SignInButton({required this.signIn});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(top: context.value.padding),
        child: Row(children: [
          Expanded(
              child: ElevatedButton(
                  onPressed: signIn,
                  child: Text(t.auth.signIn,
                      style: context.text.mediumText
                          .copyWith(color: context.color.backgroundColor))))
        ]));
  }
}

class _Helper extends HookConsumerWidget {
  const _Helper();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Padding(
        padding: EdgeInsets.only(top: context.value.padding),
        child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
          Text.rich(t.auth.helpers.signUp(
              tapHere: (v) => TextSpan(
                  text: v,
                  style: context.text.mediumText
                      .copyWith(fontWeight: FontWeight.bold),
                  recognizer: TapGestureRecognizer()
                    ..onTap = () {
                      ref
                          .read(authErrorProvider.notifier)
                          .update((state) => null);
                      ref
                          .read(isShowPasswordProvider.notifier)
                          .update((state) => false);
                      // context.goNamed(ViewsNames.signUp);
                    })))
        ]));
  }
}

class _Mobile extends StatelessWidget {
  final GlobalKey<FormState> emailState;
  final GlobalKey<FormState> passwordState;
  final TextEditingController emailController;
  final TextEditingController passwordController;
  final Future Function() signIn;
  const _Mobile({
    Key? key,
    required this.emailState,
    required this.passwordState,
    required this.emailController,
    required this.passwordController,
    required this.signIn,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
            child: ScrollConfiguration(
                behavior:
                    ScrollConfiguration.of(context).copyWith(dragDevices: {
                  PointerDeviceKind.mouse,
                  PointerDeviceKind.touch,
                }),
                child: ListView(
                    shrinkWrap: true,
                    physics: const BouncingScrollPhysics(),
                    padding:
                        const EdgeInsets.symmetric(horizontal: Insets.small),
                    children: [
                      const _Logo(),
                      Text(t.auth.helpers.titles.signIn),
                      const _Error(),
                      _Fields(
                          emailState: emailState,
                          passwordState: passwordState,
                          emailController: emailController,
                          passwordController: passwordController,
                          signIn: signIn),
                      _SignInButton(signIn: signIn),
                      const _Helper()
                    ]))));
  }
}

class _Tablet extends StatelessWidget {
  final GlobalKey<FormState> emailState;
  final GlobalKey<FormState> passwordState;
  final TextEditingController emailController;
  final TextEditingController passwordController;
  final Future Function() signIn;
  const _Tablet({
    Key? key,
    required this.emailState,
    required this.passwordState,
    required this.emailController,
    required this.passwordController,
    required this.signIn,
  }) : super(key: key);

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
                    _Logo(color: context.color.backgroundColor),
                    Text(t.auth.helpers.titles.signIn,
                        style: context.text.mediumText
                            .copyWith(color: context.color.backgroundColor))
                  ]))),
      Expanded(
          flex: 2,
          child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: Insets.standart),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const _Error(),
                    _Fields(
                        emailState: emailState,
                        passwordState: passwordState,
                        emailController: emailController,
                        passwordController: passwordController,
                        signIn: signIn),
                    _SignInButton(signIn: signIn),
                    const _Helper()
                  ])))
    ]));
  }
}

class _Desktop extends StatelessWidget {
  final GlobalKey<FormState> emailState;
  final GlobalKey<FormState> passwordState;
  final TextEditingController emailController;
  final TextEditingController passwordController;
  final Future Function() signIn;

  const _Desktop({
    Key? key,
    required this.emailState,
    required this.passwordState,
    required this.emailController,
    required this.passwordController,
    required this.signIn,
  }) : super(key: key);

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
                    _Logo(color: context.color.backgroundColor),
                    Text(t.auth.helpers.titles.signIn,
                        style: context.text.mediumText
                            .copyWith(color: context.color.backgroundColor))
                  ]))),
      Expanded(
          child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: Insets.standart),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const _Error(),
                    _Fields(
                        emailState: emailState,
                        passwordState: passwordState,
                        emailController: emailController,
                        passwordController: passwordController,
                        signIn: signIn),
                    _SignInButton(signIn: signIn),
                    const _Helper()
                  ])))
    ]));
  }
}
