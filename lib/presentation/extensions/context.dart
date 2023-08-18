import 'package:flutter/material.dart';

import '../res/colors.dart';
import 'colors.dart';
import 'text.dart';
import 'values.dart';

extension BuildContextExt on BuildContext {
  ThemeValues get value => Theme.of(this).extension<ThemeValues>()!;

  ThemeColors get color =>
      Theme.of(this).extension<ThemeColors>() ??
      ThemeColors(
          backgroundColor: AppColors.background,
          primaryColor: AppColors.primaryColor,
          secondaryColor: AppColors.secondaryColor);

  ThemeTextStyles get text => Theme.of(this).extension<ThemeTextStyles>()!;
}
