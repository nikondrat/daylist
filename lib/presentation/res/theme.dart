import 'package:daylist/presentation/extensions/theme/colors.dart';
import 'package:daylist/presentation/extensions/theme/text.dart';
import 'package:daylist/presentation/extensions/theme/values.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'colors.dart';
import 'text.dart';
import 'values.dart';

ThemeData theme(
    {bool isDark = false,
    required double radius,
    double? padding,
    double? width,
    TextStyle? customLargeText,
    TextStyle? customMediumText,
    TextStyle? customSmallText,
    Color? customBackgroundColor,
    Color? customPrimaryColor,
    Color? customSecondaryColor}) {
  ThemeTextStyles textStyles = ThemeTextStyles(
      largeText: customLargeText ??
          kLargeText.copyWith(color: isDark ? Colors.white : Colors.black),
      mediumText: customMediumText ??
          kMediumText.copyWith(color: isDark ? Colors.white : Colors.black),
      smallText: customSmallText ??
          kSmallText.copyWith(color: isDark ? Colors.white : Colors.black));

  ThemeValues values = ThemeValues(
      padding: padding ?? Insets.standart,
      // radius: radius ?? kDefaultRadius,
      width: width ?? kDefaultWidth);

  ThemeColors colors = ThemeColors(
      backgroundColor: customBackgroundColor ??=
          isDark ? AppColors.darkBackground : AppColors.background,
      primaryColor: customPrimaryColor ??=
          isDark ? AppColors.darkPrimaryColor : AppColors.primaryColor,
      secondaryColor: customSecondaryColor ??=
          isDark ? AppColors.darkSecondaryColor : AppColors.secondaryColor);

  return ThemeData(
      extensions: [textStyles, colors, values],
      textTheme: TextTheme(
          titleLarge: textStyles.largeText,
          titleMedium: textStyles.mediumText,
          titleSmall: textStyles.mediumText,
          bodyLarge: textStyles.mediumText,
          bodyMedium: textStyles.mediumText,
          bodySmall: textStyles.smallText),
      colorScheme: ColorScheme(
          background: colors.backgroundColor,
          brightness: isDark ? Brightness.light : Brightness.dark,
          error: Colors.red,
          onBackground: colors.backgroundColor,
          onError: Colors.red,
          onPrimary: colors.backgroundColor,
          onSecondary: colors.secondaryColor,
          onSurface: colors.secondaryColor,
          primary: colors.primaryColor,
          secondary: colors.secondaryColor,
          surface: colors.backgroundColor),
      splashFactory: NoSplash.splashFactory,
      canvasColor: colors.backgroundColor,
      primaryColor: colors.primaryColor,
      textSelectionTheme: TextSelectionThemeData(
          cursorColor: colors.primaryColor,
          selectionColor: colors.secondaryColor),
      appBarTheme: AppBarTheme(
          elevation: 0,
          color: colors.backgroundColor,
          iconTheme: IconThemeData(color: colors.primaryColor),
          titleTextStyle: textStyles.mediumText.copyWith(fontSize: 18),
          toolbarTextStyle: textStyles.mediumText,
          systemOverlayStyle: SystemUiOverlayStyle(
              statusBarColor: Colors.transparent,
              statusBarIconBrightness:
                  isDark ? Brightness.light : Brightness.dark)),
      snackBarTheme: SnackBarThemeData(
          behavior: SnackBarBehavior.floating,
          backgroundColor: colors.backgroundColor,
          contentTextStyle: textStyles.mediumText,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(radius),
              side: BorderSide(color: colors.primaryColor))),
      listTileTheme: ListTileThemeData(
          iconColor: colors.primaryColor,
          textColor: textStyles.mediumText.color),
      timePickerTheme: TimePickerThemeData(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(radius)),
          hourMinuteShape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(radius)),
          backgroundColor: colors.backgroundColor,
          helpTextStyle: textStyles.smallText,
          hourMinuteTextStyle: textStyles.largeText.copyWith(fontSize: 32),
          dayPeriodTextStyle: textStyles.mediumText,
          dialTextColor: colors.backgroundColor,
          entryModeIconColor: colors.primaryColor,
          dialBackgroundColor: colors.secondaryColor,
          dayPeriodTextColor: colors.primaryColor,
          dialHandColor: colors.primaryColor),
      dialogTheme: DialogTheme(
          titleTextStyle: textStyles.largeText,
          contentTextStyle: textStyles.mediumText,
          backgroundColor: colors.backgroundColor,
          shape: RoundedRectangleBorder(
              side: BorderSide(color: colors.primaryColor),
              borderRadius: BorderRadius.circular(radius))),
      switchTheme: SwitchThemeData(
          thumbColor: MaterialStatePropertyAll(colors.primaryColor),
          overlayColor: const MaterialStatePropertyAll(Colors.transparent),
          trackColor:
              MaterialStatePropertyAll(colors.primaryColor.withOpacity(.6))),
      iconTheme: IconThemeData(size: kIconSize, color: colors.primaryColor),
      iconButtonTheme: const IconButtonThemeData(
          style: ButtonStyle(
              splashFactory: NoSplash.splashFactory,
              overlayColor: MaterialStatePropertyAll(Colors.transparent))),
      textButtonTheme: TextButtonThemeData(
          style: ButtonStyle(
              splashFactory: NoSplash.splashFactory,
              foregroundColor: MaterialStatePropertyAll(colors.primaryColor),
              shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                  side: BorderSide(color: colors.primaryColor),
                  borderRadius: BorderRadius.circular(radius))),
              overlayColor:
                  MaterialStatePropertyAll(colors.primaryColor.withAlpha(30)),
              textStyle: MaterialStatePropertyAll(textStyles.mediumText))),
      datePickerTheme: DatePickerThemeData(
          dayStyle: textStyles.mediumText,
          headerHelpStyle: textStyles.smallText,
          yearStyle: textStyles.mediumText,
          weekdayStyle: textStyles.smallText),
      elevatedButtonTheme: ElevatedButtonThemeData(
          style: ButtonStyle(
              elevation: const MaterialStatePropertyAll(0),
              foregroundColor: MaterialStatePropertyAll(colors.primaryColor),
              padding: MaterialStatePropertyAll(EdgeInsets.all(values.padding)),
              textStyle: MaterialStatePropertyAll(textStyles.mediumText),
              side: MaterialStatePropertyAll(
                  BorderSide(color: colors.primaryColor)),
              overlayColor: const MaterialStatePropertyAll(Colors.transparent),
              shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(radius))))),
      dropdownMenuTheme:
          DropdownMenuThemeData(menuStyle: MenuStyle(shape: MaterialStatePropertyAll(RoundedRectangleBorder(side: BorderSide(color: colors.primaryColor), borderRadius: BorderRadius.circular(radius))))),
      outlinedButtonTheme: OutlinedButtonThemeData(style: ButtonStyle(elevation: const MaterialStatePropertyAll(0), foregroundColor: MaterialStatePropertyAll(colors.primaryColor), padding: MaterialStatePropertyAll(EdgeInsets.all(values.padding)), textStyle: MaterialStatePropertyAll(textStyles.mediumText), side: MaterialStatePropertyAll(BorderSide(color: colors.primaryColor)), overlayColor: const MaterialStatePropertyAll(Colors.transparent), shape: MaterialStatePropertyAll(RoundedRectangleBorder(borderRadius: BorderRadius.circular(radius))))),
      inputDecorationTheme: InputDecorationTheme(
          // filled: true, fillColor: Colors.grey.shade300,
          labelStyle: textStyles.mediumText.copyWith(color: colors.secondaryColor),
          floatingLabelStyle: textStyles.mediumText.copyWith(color: colors.primaryColor),
          disabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(radius), borderSide: BorderSide(color: colors.primaryColor)),
          focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(radius), borderSide: BorderSide(color: colors.primaryColor)),
          enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(radius), borderSide: BorderSide(color: colors.primaryColor)),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(radius), borderSide: BorderSide(color: colors.primaryColor))),
      sliderTheme: SliderThemeData(activeTrackColor: colors.primaryColor, thumbColor: colors.primaryColor, inactiveTrackColor: colors.primaryColor.withOpacity(.6), overlayColor: Colors.transparent),
      popupMenuTheme: PopupMenuThemeData(color: colors.backgroundColor, textStyle: textStyles.mediumText, shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(radius / 2), side: BorderSide(color: colors.primaryColor))),
      toggleButtonsTheme: ToggleButtonsThemeData(color: colors.primaryColor, textStyle: textStyles.mediumText, fillColor: colors.primaryColor, selectedColor: colors.backgroundColor, borderColor: colors.secondaryColor),
      floatingActionButtonTheme: FloatingActionButtonThemeData(elevation: 0, backgroundColor: colors.backgroundColor, foregroundColor: colors.primaryColor, shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(radius), side: BorderSide(color: colors.primaryColor))));
}
