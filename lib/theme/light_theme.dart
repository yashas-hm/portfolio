part of 'theme.dart';

class LightThemeColors extends ThemeColors {
  @override
  Color get primaryColor => KnownColors.lightPrimary;

  @override
  Color get backgroundColor => KnownColors.lightBackground;

  @override
  Color get surfaceColor => KnownColors.lightSurface;

  @override
  Color get secondarySurface => KnownColors.lightSurfaceSecondary;

  @override
  Color get textColor => KnownColors.lightText;

  @override
  Color get textSecondary => KnownColors.lightTextSecondary;

  @override
  Color get borderColor => KnownColors.lightBorder;

  @override
  Color get secondaryBorderColor => KnownColors.lightBorderSecondary;

  @override
  ThemeColors copyWith() => LightThemeColors();
}
