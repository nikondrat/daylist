import 'package:flutter/material.dart';

import '../res/values.dart';

class ThemeValues extends ThemeExtension<ThemeValues> {
  double padding;
  double radius;
  double width;

  ThemeValues(
      {required this.padding, required this.radius, required this.width});

  static get standart => ThemeValues(
      padding: Insets.standart, radius: kDefaultRadius, width: kDefaultWidth);

  @override
  ThemeExtension<ThemeValues> copyWith() {
    return ThemeValues(padding: padding, radius: radius, width: width);
  }

  @override
  ThemeExtension<ThemeValues> lerp(
      covariant ThemeExtension<ThemeValues>? other, double t) {
    if (other is! ThemeValues) {
      return this;
    }
    return ThemeValues(padding: padding, radius: radius, width: width);
  }
}
