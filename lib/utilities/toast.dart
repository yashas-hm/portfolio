import 'package:flutter/material.dart';
import 'package:oktoast/oktoast.dart';
import 'package:portfolio/constants/constants.dart';
import 'package:portfolio/utilities/extensions.dart';

class Toast {
  Toast._();

  static void showToast(BuildContext context, String text, bool success) =>
      success ? showSuccessToast(context, text) : showErrorToast(context, text);

  static void showErrorToast(BuildContext context, String text) {
    showToastWidget(
      Container(
        width: context.isMobile ? context.width * 0.9 : context.width * 0.6,
        padding: Sizes.paddingRegular,
        decoration: BoxDecoration(
          borderRadius: Sizes.borderRadiusXS,
          gradient: LinearGradient(
            colors: [
              KnownColors.red600,
              KnownColors.red100,
              KnownColors.red600,
            ],
          ),
        ),
        child: Text(
          text,
          style: Styles.regularTextBold(textColor: KnownColors.white),
          textAlign: TextAlign.center,
        ),
      ),
      context: context,
      dismissOtherToast: true,
      handleTouch: true,
      position: ToastPosition.bottom,
      duration: 2500.milliseconds,
    );
  }

  static void showSuccessToast(BuildContext context, String text) {
    showToastWidget(
      Container(
        width: context.isMobile ? context.width * 0.9 : context.width * 0.6,
        padding: Sizes.paddingRegular,
        decoration: BoxDecoration(
          borderRadius: Sizes.borderRadiusXS,
          gradient: LinearGradient(
            colors: [
              KnownColors.green600,
              KnownColors.green100,
              KnownColors.green600,
            ],
          ),
        ),
        child: Text(
          text,
          style: Styles.regularTextBold(textColor: KnownColors.black),
          textAlign: TextAlign.center,
        ),
      ),
      context: context,
      dismissOtherToast: true,
      handleTouch: true,
      position: ToastPosition.bottom,
      duration: 2500.milliseconds,
    );
  }
}
