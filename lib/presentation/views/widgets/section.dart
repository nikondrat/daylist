import 'package:daylist/presentation/extensions/theme/context.dart';
import 'package:daylist/presentation/res/values.dart';
import 'package:flutter/material.dart';

class SectionWidget extends StatelessWidget {
  final String? title;
  final List<Widget> children;
  final List<Widget>? actions;
  final EdgeInsets? margin;

  const SectionWidget(
      {super.key,
      this.title,
      this.actions,
      this.margin,
      required this.children});

  @override
  Widget build(BuildContext context) {
    return _Decoration(
        margin: margin,
        child: _Body(title: title, actions: actions, children: children));
  }
}

class _Decoration extends StatelessWidget {
  final Widget child;
  final EdgeInsets? margin;
  const _Decoration({required this.child, this.margin});

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: margin,
        decoration: BoxDecoration(
            border: Border.all(
                width: context.value.width, color: context.color.primaryColor),
            borderRadius: BorderRadius.circular(context.value.radius)),
        child: child);
  }
}

class _Body extends StatelessWidget {
  final String? title;
  final List<Widget> children;
  final List<Widget>? actions;

  const _Body({
    Key? key,
    required this.title,
    required this.actions,
    required this.children,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _Title(title: title, actions: actions),
          Column(children: children)
          // ??
          //     Column(
          //         mainAxisSize: MainAxisSize.min,
          //         children: items!
          //             .map((e) => SubsectionWidget(title: e.title))
          //             .toList())
        ]);
  }
}

class _Title extends StatelessWidget {
  final String? title;
  final List<Widget>? actions;
  const _Title({required this.title, required this.actions});

  @override
  Widget build(BuildContext context) {
    return title != null
        ? Padding(
            padding: const EdgeInsets.all(Insets.small),
            child: actions != null
                ? Row(children: [
                    Expanded(
                        child: Text(title!, style: context.text.largeText)),
                    Row(children: actions!)
                  ])
                : Text(title!, style: context.text.largeText))
        : const SizedBox.shrink();
  }
}
