part of 'theme.dart';

abstract class ThemeColors{
  Color get primaryColor;
  Color get onPrimary => KnownColors.gray50;
  
  Color get textColor;
  
  Color get backgroundColor;
  Color get surfaceColor;
  Color get secondarySurface;
}