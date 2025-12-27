part of 'constants.dart';

class Styles {
  Styles._();

  static TextStyle smallText({Color? textColor}) => TextStyle(
    fontSize: 12,
    color: textColor,
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
}
