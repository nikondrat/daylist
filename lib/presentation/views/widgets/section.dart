import 'package:daylist/presentation/res/values.dart';
import 'package:flutter/material.dart';
import 'package:daylist/presentation/extensions/context.dart';

class SectionWidget extends StatelessWidget {
  final String? title;
  final List<Widget> children;
  final EdgeInsets? margin;

  const SectionWidget(
      {super.key, this.title, this.margin, required this.children});

  @override
  Widget build(BuildContext context) {
    return _Decoration(
        margin: margin, child: _Body(title: title, children: children));
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

  const _Body({
    Key? key,
    required this.title,
    required this.children,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          title != null
              ? Padding(
                  padding: EdgeInsets.only(
                      left: Insets.small,
                      top: Insets.small,
                      bottom: Insets.small),
                  child: Text(title!, style: context.text.largeText))
              : const SizedBox.shrink(),
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
