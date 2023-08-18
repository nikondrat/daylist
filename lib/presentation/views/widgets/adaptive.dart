import 'package:flutter/material.dart';

class AdaptiveWidget extends StatelessWidget {
  final Widget mobile;
  final Widget tablet;
  final Widget desktop;

  const AdaptiveWidget({
    Key? key,
    required this.mobile,
    required this.tablet,
    required this.desktop,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final double width = constraints.maxWidth;

        if (width < 600) {
          return mobile;
        } else if (width > 600 && width < 840) {
          return tablet;
        } else {
          return desktop;
        }
      },
    );
  }
}
