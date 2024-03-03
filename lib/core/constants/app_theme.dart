import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:portfolio/core/constants/color_constants.dart';

class AppTheme {
  static ThemeData _theme(BuildContext context) => ThemeData(
        primaryColor: AppColor.primary,
        scaffoldBackgroundColor: AppColor.background,
        textTheme: Theme.of(context).textTheme.apply(
              fontFamily: 'space_grotesk',
              bodyColor: AppColor.textColor,
              displayColor: AppColor.textColor,
            ),
        appBarTheme: const AppBarTheme(
          centerTitle: true,
          systemOverlayStyle: SystemUiOverlayStyle(
            statusBarBrightness: Brightness.light,
            statusBarColor: AppColor.primary,
            statusBarIconBrightness: Brightness.dark,
          ),
          elevation: 0,
          iconTheme: IconThemeData(
            color: AppColor.textColor,
          ),
          backgroundColor: AppColor.primary,
        ),
        colorScheme: ColorScheme.fromSeed(
          seedColor: AppColor.primary,
          primary: AppColor.primary,
          background: AppColor.background,
        ),
        textSelectionTheme: TextSelectionThemeData(
          selectionHandleColor: AppColor.primary.withOpacity(0.3),
        ),
      );

  static ThemeData getTheme(BuildContext ctx) => _theme(ctx);
}
