part of 'theme.dart';

abstract class ThemeColors {
  Color get primaryColor;

  Color get onPrimary => KnownColors.gray50;

  Color get textColor;

  Color get textSecondary;

  Color get backgroundColor;

  Color get surfaceColor;

  Color get secondarySurface;
  
  Color get borderColor;
  
  Color get secondaryBorderColor;
}
