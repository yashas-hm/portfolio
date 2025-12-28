part of 'constants.dart';

class Sizes {
  Sizes._();

  static const double spacingSmall = 5.0;

  static const double spacingRegular = 10.0;

  static const double spacingMediumSmall = 12.0;

  static const double spacingMedium = 15.0;

  static const double spacingLarge = 20.0;

  static const double spacingExtraLarge = 30.0;

  static const double iconExtraSmall = 10.0;

  static const double iconSmall = 12.0;

  static const double iconRegular = 15.0;

  static const double iconMedium = 20.0;
  
  static const double iconLarge = 25.0;
  
  static const double iconHuge = 70.0;


  static BorderRadius get borderRadiusSmall =>
      BorderRadius.circular(spacingSmall);

  static BorderRadius get borderRadiusRegular =>
      BorderRadius.circular(spacingRegular);

  static EdgeInsets get paddingRegular => EdgeInsets.all(spacingRegular);

  static EdgeInsets get paddingLarge => EdgeInsets.all(spacingLarge);
}
