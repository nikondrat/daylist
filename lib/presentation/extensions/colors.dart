import 'package:flutter/material.dart';

import '../res/colors.dart';

class ThemeColors extends ThemeExtension<ThemeColors> {
  Color backgroundColor;
  Color primaryColor;
  Color secondaryColor;

  ThemeColors(
      {required this.backgroundColor,
      required this.primaryColor,
      required this.secondaryColor});

  @override
  ThemeExtension<ThemeColors> copyWith(
      {Color? backgroundColor, Color? primaryColor, Color? secondaryColor}) {
    return ThemeColors(
        backgroundColor: backgroundColor ?? this.backgroundColor,
        primaryColor: primaryColor ?? this.primaryColor,
        secondaryColor: secondaryColor ?? this.secondaryColor);
  }

  @override
  ThemeExtension<ThemeColors> lerp(
    ThemeExtension<ThemeColors>? other,
    double t,
  ) {
    if (other is! ThemeColors) {
      return this;
    }

    return ThemeColors(
      backgroundColor: Color.lerp(backgroundColor, other.backgroundColor, t)!,
      primaryColor: Color.lerp(primaryColor, other.primaryColor, t)!,
      secondaryColor: Color.lerp(secondaryColor, other.secondaryColor, t)!,
    );
  }

  static get light => ThemeColors(
      backgroundColor: AppColors.background,
      primaryColor: AppColors.primaryColor,
      secondaryColor: AppColors.secondaryColor);

  static get dark => ThemeColors(
      backgroundColor: AppColors.darkBackground,
      primaryColor: AppColors.darkPrimaryColor,
      secondaryColor: AppColors.darkSecondaryColor);
}
