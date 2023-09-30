import 'dart:ui';

import 'package:daylist/presentation/res/values.dart';
import 'package:flutter/material.dart';

class CustomListWidget extends StatelessWidget {
  final Function()? onRefresh;
  final List<Widget> children;
  const CustomListWidget({super.key, this.onRefresh, required this.children});

  @override
  Widget build(BuildContext context) {
    return ScrollConfiguration(
        behavior: ScrollConfiguration.of(context).copyWith(
            dragDevices: {PointerDeviceKind.mouse, PointerDeviceKind.touch}),
        child: onRefresh != null
            ? RefreshIndicator(
                onRefresh: () async {
                  return onRefresh!();
                },
                child: _Body(children: children))
            : _Body(children: children));
  }
}

class _Body extends StatelessWidget {
  final List<Widget> children;
  const _Body({required this.children});

  @override
  Widget build(BuildContext context) {
    return ListView(
        padding: const EdgeInsets.symmetric(horizontal: Insets.small),
        physics: const BouncingScrollPhysics(),
        children: children);
  }
}
