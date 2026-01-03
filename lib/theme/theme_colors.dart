part of 'theme.dart';

abstract class ThemeColors extends ThemeExtension<ThemeColors> {
  Color get primaryColor;

  Color get onPrimary => KnownColors.gray50;

  Color get textColor;

  Color get textSecondary;

  Color get backgroundColor;

  Color get surfaceColor;

  Color get secondarySurface;

  Color get borderColor;

  Color get secondaryBorderColor;

  @override
  ThemeColors lerp(ThemeColors? other, double t) {
    if (other == null) return this;
    return _LerpedThemeColors(
      primaryColor: Color.lerp(primaryColor, other.primaryColor, t)!,
      onPrimary: Color.lerp(onPrimary, other.onPrimary, t)!,
      textColor: Color.lerp(textColor, other.textColor, t)!,
      textSecondary: Color.lerp(textSecondary, other.textSecondary, t)!,
      backgroundColor: backgroundColor,
      surfaceColor: Color.lerp(surfaceColor, other.surfaceColor, t)!,
      secondarySurface:
          Color.lerp(secondarySurface, other.secondarySurface, t)!,
      borderColor: Color.lerp(borderColor, other.borderColor, t)!,
      secondaryBorderColor:
          Color.lerp(secondaryBorderColor, other.secondaryBorderColor, t)!,
    );
  }

  @override
  ThemeColors copyWith() => this;
}

/// Internal class for lerped colors during theme transitions
class _LerpedThemeColors extends ThemeColors {
  @override
  final Color primaryColor;
  @override
  final Color onPrimary;
  @override
  final Color textColor;
  @override
  final Color textSecondary;
  @override
  final Color backgroundColor;
  @override
  final Color surfaceColor;
  @override
  final Color secondarySurface;
  @override
  final Color borderColor;
  @override
  final Color secondaryBorderColor;

  _LerpedThemeColors({
    required this.primaryColor,
    required this.onPrimary,
    required this.textColor,
    required this.textSecondary,
    required this.backgroundColor,
    required this.surfaceColor,
    required this.secondarySurface,
    required this.borderColor,
    required this.secondaryBorderColor,
  });

  @override
  ThemeColors copyWith() => this;
}
