import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:portfolio/core/constants/colors.dart';

ThemeData lightTheme(BuildContext context) => ThemeData(
      primaryColor: lightPrimary,
      scaffoldBackgroundColor: lightBackground,
      textTheme: Theme.of(context).textTheme.apply(
            fontFamily: 'space_grotesk',
            bodyColor: lightText,
            displayColor: lightText,
          ),
      fontFamily: 'space_grotesk',
      fontFamilyFallback: const [
        'roboto',
        'arial',
      ],
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
      ),
      textSelectionTheme: TextSelectionThemeData(
        selectionHandleColor: lightPrimary.withValues(alpha: 0.3),
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
      fontFamily: 'space_grotesk',
      fontFamilyFallback: const [
        'roboto',
        'arial',
      ],
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
      ),
      textSelectionTheme: TextSelectionThemeData(
        selectionHandleColor: darkPrimary.withValues(alpha: 0.3),
      ),
    );
