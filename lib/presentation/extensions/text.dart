import 'package:flutter/material.dart';

import '../res/text.dart';

class ThemeTextStyles extends ThemeExtension<ThemeTextStyles> {
  TextStyle largeText;
  TextStyle mediumText;
  TextStyle smallText;

  ThemeTextStyles(
      {required this.largeText,
      required this.mediumText,
      required this.smallText});

  static get light => ThemeTextStyles(
      largeText: kLargeText.copyWith(color: Colors.black),
      mediumText: kMediumText.copyWith(color: Colors.black),
      smallText: kSmallText.copyWith(color: Colors.black));

  static get dark => ThemeTextStyles(
      largeText: kLargeText.copyWith(color: Colors.white),
      mediumText: kMediumText.copyWith(color: Colors.white),
      smallText: kSmallText.copyWith(color: Colors.grey.shade400));

  @override
  ThemeExtension<ThemeTextStyles> copyWith() {
    return ThemeTextStyles(
        largeText: largeText, mediumText: mediumText, smallText: smallText);
  }

  @override
  ThemeExtension<ThemeTextStyles> lerp(
      covariant ThemeExtension<ThemeTextStyles>? other, double t) {
    if (other is! ThemeTextStyles) {
      return this;
    }
    return ThemeTextStyles(
        largeText: largeText, mediumText: mediumText, smallText: smallText);
  }
}
