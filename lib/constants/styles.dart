part of 'constants.dart';

class Styles {
  Styles._();

  static TextStyle extraSmallText({Color? textColor}) => TextStyle(
        fontSize: 10,
        color: textColor,
      );

  static TextStyle extraSmallTextBold({Color? textColor}) => TextStyle(
        fontSize: 10,
        color: textColor,
        fontWeight: FontWeight.bold,
      );

  static TextStyle smallText({Color? textColor}) => TextStyle(
        fontSize: 12,
        color: textColor,
      );

  static TextStyle smallTextBold({Color? textColor}) => TextStyle(
    fontSize: 12,
    color: textColor,
    fontWeight: FontWeight.bold,
  );

  static TextStyle smallTextThin({Color? textColor}) => TextStyle(
        fontSize: 12,
        color: textColor,
        fontWeight: FontWeight.w200,
      );

  static TextStyle regularText({Color? textColor}) => TextStyle(
        fontSize: 14,
        color: textColor,
      );

  static TextStyle regularTextBold({Color? textColor}) => TextStyle(
        fontSize: 14,
        color: textColor,
        fontWeight: FontWeight.bold,
      );

  static TextStyle mediumText({Color? textColor}) => TextStyle(
        fontSize: 16,
        color: textColor,
      );

  static TextStyle mediumTextBold({Color? textColor}) => TextStyle(
        fontSize: 16,
        color: textColor,
        fontWeight: FontWeight.bold,
      );

  static TextStyle largeText({Color? textColor}) => TextStyle(
        fontSize: 18,
        color: textColor,
      );

  static TextStyle largeTextBold({Color? textColor}) => TextStyle(
        fontSize: 18,
        color: textColor,
        fontWeight: FontWeight.bold,
      );

  static TextStyle emphasisText({Color? textColor}) => TextStyle(
        fontSize: 50,
        color: textColor,
        fontWeight: FontWeight.bold,
      );

  static TextStyle headlineText({Color? textColor, bool isMobile = false}) =>
      TextStyle(
        fontSize: isMobile ? 30 : 40,
        color: textColor,
      );

  static TextStyle headlineTextBold(
          {Color? textColor, bool isMobile = false}) =>
      TextStyle(
        fontSize: isMobile ? 30 : 40,
        color: textColor,
        fontWeight: FontWeight.bold,
      );

  static TextStyle subText({Color? textColor, bool isMobile = false}) =>
      TextStyle(
        fontSize: isMobile ? 14 : 16,
        color: textColor,
      );
}
