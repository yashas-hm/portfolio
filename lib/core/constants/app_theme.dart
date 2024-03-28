import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:portfolio/core/constants/color_constants.dart';

ThemeData lightTheme(BuildContext context) => ThemeData(
      primaryColor: lightPrimary,
      scaffoldBackgroundColor: lightBackground,
      textTheme: Theme.of(context).textTheme.apply(
            fontFamily: 'space_grotesk',
            bodyColor: lightText,
            displayColor: lightText,
          ),
      appBarTheme: const AppBarTheme(
        centerTitle: true,
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarBrightness: Brightness.light,
          statusBarColor: lightPrimary,
          statusBarIconBrightness: Brightness.light,
        ),
        elevation: 0,
        iconTheme: IconThemeData(
          color: lightText,
        ),
        backgroundColor: lightPrimary,
      ),
      colorScheme: ColorScheme.fromSeed(
        seedColor: lightPrimary,
        primary: lightPrimary,
        secondary: lightBox,
        tertiary: lightText,
        background: lightBackground,
      ),
      textSelectionTheme: TextSelectionThemeData(
        selectionHandleColor: lightPrimary.withOpacity(0.3),
      ),
    );

ThemeData darkTheme(BuildContext context) => ThemeData(
      primaryColor: darkPrimary,
      scaffoldBackgroundColor: darkBackground,
      textTheme: Theme.of(context).textTheme.apply(
            fontFamily: 'space_grotesk',
            bodyColor: darkText,
            displayColor: darkText,
          ),
      appBarTheme: const AppBarTheme(
        centerTitle: true,
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarBrightness: Brightness.dark,
          statusBarColor: darkPrimary,
          statusBarIconBrightness: Brightness.dark,
        ),
        elevation: 0,
        iconTheme: IconThemeData(
          color: darkText,
        ),
        backgroundColor: darkPrimary,
      ),
      colorScheme: ColorScheme.fromSeed(
        seedColor: darkPrimary,
        primary: darkPrimary,
        secondary: darkBox,
        tertiary: darkText,
        background: darkBackground,
      ),
      textSelectionTheme: TextSelectionThemeData(
        selectionHandleColor: darkPrimary.withOpacity(0.3),
      ),
    );

class AppTheme {
  static ThemeData _theme(BuildContext context) => ThemeData(
        primaryColor: lightPrimary,
        scaffoldBackgroundColor: lightBackground,
        textTheme: Theme.of(context).textTheme.apply(
              fontFamily: 'space_grotesk',
              bodyColor: lightText,
              displayColor: lightText,
            ),
        appBarTheme: const AppBarTheme(
          centerTitle: true,
          systemOverlayStyle: SystemUiOverlayStyle(
            statusBarBrightness: Brightness.dark,
            statusBarColor: lightPrimary,
            statusBarIconBrightness: Brightness.light,
          ),
          elevation: 0,
          iconTheme: IconThemeData(
            color: lightText,
          ),
          backgroundColor: lightPrimary,
        ),
        colorScheme: ColorScheme.fromSeed(
          seedColor: lightPrimary,
          primary: lightPrimary,
          background: lightBackground,
        ),
        textSelectionTheme: TextSelectionThemeData(
          selectionHandleColor: lightPrimary.withOpacity(0.3),
        ),
      );

  static ThemeData getTheme(BuildContext ctx) => _theme(ctx);
}
