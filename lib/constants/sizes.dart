part of 'constants.dart';

class Sizes {
  Sizes._();

  static const double spacingXS = 3.0;
  
  static const double spacingSmall = 5.0;
  
  static const double spacingSmallRegular = 8.0;

  static const double spacingRegular = 10.0;

  static const double spacingMediumSmall = 12.0;

  static const double spacingMedium = 15.0;

  static const double spacingLarge = 20.0;

  static const double spacingXL = 30.0;

  static const double spacingXXL = 50.0;
  
  static const double iconXXS = 8.0;

  static const double iconXS = 10.0;

  static const double iconSmall = 12.0;

  static const double iconRegular = 15.0;

  static const double iconRegularMedium = 18.0;

  static const double iconMedium = 20.0;
  
  static const double iconLarge = 25.0;
  
  static const double iconXL = 40.0;
  
  static const double iconHuge = 70.0;
  
  static const double navBarHeight = 90.0;


  static BorderRadius get borderRadiusSmall =>
      BorderRadius.circular(spacingSmall);

  static BorderRadius get borderRadiusXS =>
      BorderRadius.circular(spacingXS);

  static BorderRadius get borderRadiusRegular =>
      BorderRadius.circular(spacingRegular);

  static EdgeInsets get paddingXS => EdgeInsets.all(spacingXS);

  static EdgeInsets get paddingSmall => EdgeInsets.all(spacingSmall);
  
  static EdgeInsets get paddingRegular => EdgeInsets.all(spacingRegular);

  static EdgeInsets get paddingMedium => EdgeInsets.all(spacingMedium);

  static EdgeInsets get paddingLarge => EdgeInsets.all(spacingLarge);
}
