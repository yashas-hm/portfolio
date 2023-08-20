import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:portfolio/core/constants/color_constants.dart';

class AppTheme{
  static ThemeData _darkMode(BuildContext context) => ThemeData(
    primaryColor: AppColor.primaryDark,
    scaffoldBackgroundColor: AppColor.bgDark,
    textTheme: Theme.of(context).textTheme.apply(
      fontFamily: 'noto',
      bodyColor: AppColor.bgLight,
      displayColor: AppColor.bgLight,
    ),
    appBarTheme: const AppBarTheme(
      centerTitle: true,
      systemOverlayStyle: SystemUiOverlayStyle(
        statusBarBrightness: Brightness.light,
        statusBarColor: AppColor.primaryDark,
        statusBarIconBrightness: Brightness.dark,
      ),
      elevation: 0,
      iconTheme: IconThemeData(
        color: AppColor.bgLight,
      ),
      backgroundColor: AppColor.primaryDark,
    ),
    colorScheme: ColorScheme.fromSeed(
      seedColor: AppColor.primaryDark,
      primary: AppColor.primaryDark,
      background: AppColor.bgDark,
    ),
    textSelectionTheme: const TextSelectionThemeData(
      selectionHandleColor: Colors.transparent,
    ),
  );

  static ThemeData _lightMode(BuildContext context) => ThemeData(
    primaryColor: AppColor.primaryLight,
    scaffoldBackgroundColor: AppColor.bgLight,
    textTheme: Theme.of(context).textTheme.apply(
      fontFamily: 'noto',
      bodyColor: Colors.white,
      displayColor: Colors.white,
    ),
    appBarTheme: const AppBarTheme(
      centerTitle: true,
      systemOverlayStyle: SystemUiOverlayStyle(
        statusBarBrightness: Brightness.light,
        statusBarColor: AppColor.primaryLight,
        statusBarIconBrightness: Brightness.dark,
      ),
      elevation: 0,
      iconTheme: IconThemeData(
        color: Colors.white,
      ),
      backgroundColor: AppColor.primaryLight,
    ),
    colorScheme: ColorScheme.fromSeed(
      seedColor: AppColor.primaryLight,
      primary: AppColor.primaryLight,
      background: AppColor.bgLight,
    ),
    textSelectionTheme: const TextSelectionThemeData(
      selectionHandleColor: Colors.transparent,
    ),
  );

  static ThemeData getTheme(bool darkMode, BuildContext ctx) => darkMode?_darkMode(ctx):_lightMode(ctx);
}