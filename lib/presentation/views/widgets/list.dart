import 'dart:ui';

import 'package:daylist/presentation/res/values.dart';
import 'package:flutter/material.dart';

class CustomListWidget extends StatelessWidget {
  final List<Widget> children;
  const CustomListWidget({super.key, required this.children});

  @override
  Widget build(BuildContext context) {
    return ScrollConfiguration(
        behavior: ScrollConfiguration.of(context).copyWith(
            dragDevices: {PointerDeviceKind.mouse, PointerDeviceKind.touch}),
        child: ListView(
            padding: const EdgeInsets.symmetric(horizontal: Insets.small),
            physics: const BouncingScrollPhysics(),
            children: children));
  }
}
