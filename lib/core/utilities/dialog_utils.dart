import 'dart:ui';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:oktoast/oktoast.dart';
import 'package:portfolio/core/utilities/extensions.dart';
import 'package:portfolio/widgets/desktop/skill_chips.dart' as desktop;
import 'package:portfolio/widgets/mobile/skill_chips.dart' as mobile;
import 'package:resize/resize.dart';

void showMore({
  required BuildContext context,
  required String text,
  required List<String> skills,
}) {
  return context.isMobile
      ? showMoreMobile(context: context, text: text, skills: skills)
      : showMoreDesktop(context: context, text: text, skills: skills);
}

void showMoreDesktop({
  required BuildContext context,
  required String text,
  required List<String> skills,
}) {
  showGeneralDialog(
    context: context,
    barrierDismissible: true,
    barrierLabel: '',
    pageBuilder: (_, __, ___) => Container(),
    transitionDuration: 500.milliseconds,
    transitionBuilder: (_, a, __, ___) => BackdropFilter(
      filter: ImageFilter.blur(
        sigmaY: 15.sp * Curves.easeInOut.transform(a.value),
        sigmaX: 15.sp * Curves.easeInOut.transform(a.value),
      ),
      child: Transform.scale(
        scale: Curves.easeInOut.transform(a.value),
        child: AlertDialog(
          contentPadding: EdgeInsets.zero,
          content: Container(
            width: context.width / 2.5,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(13.sp),
              color: Theme.of(context).colorScheme.secondary,
            ),
            padding: EdgeInsets.all(15.sp),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                if (text.isNotEmpty)
                  Text(
                    text,
                    style: TextStyle(fontSize: 16.sp),
                    textAlign: TextAlign.justify,
                  ),
                if (text.isNotEmpty) Gap(15.sp),
                Text(
                  'Tech Stack & Tools',
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 14.sp,
                  ),
                ),
                Gap(15.sp),
                desktop.SkillChips(skills: skills),
              ],
            ),
          ),
        ),
      ),
    ),
  );
}

void showMoreMobile({
  required BuildContext context,
  required String text,
  required List<String> skills,
}) {
  showGeneralDialog(
    context: context,
    barrierDismissible: true,
    barrierLabel: '',
    pageBuilder: (_, __, ___) => Container(),
    transitionDuration: 500.milliseconds,
    transitionBuilder: (_, a, __, ___) => BackdropFilter(
      filter: ImageFilter.blur(
        sigmaY: 15.sp * Curves.easeInOut.transform(a.value),
        sigmaX: 15.sp * Curves.easeInOut.transform(a.value),
      ),
      child: Transform.scale(
        scale: Curves.easeInOut.transform(a.value),
        child: AlertDialog(
          contentPadding: EdgeInsets.zero,
          content: Container(
            width: context.width / 1.2,
            height: context.height / 1.5,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(13.sp),
              color: Theme.of(context).colorScheme.secondary,
            ),
            padding: EdgeInsets.all(15.sp),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                if (text.isNotEmpty)
                  Flexible(
                    child: AutoSizeText(
                      text,
                      minFontSize: 10,
                      stepGranularity: 0.1,
                      style: TextStyle(
                        fontSize: 12.sp,
                      ),
                      textAlign: TextAlign.justify,
                    ),
                  ),
                if (text.isNotEmpty) Gap(15.sp),
                Text(
                  'Tech Stack & Tools',
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 12.sp,
                  ),
                ),
                Gap(15.sp),
                mobile.SkillChips(skills: skills),
              ],
            ),
          ),
        ),
      ),
    ),
  );
}

void showToast(BuildContext ctx, String text) {
  showToastWidget(
    Stack(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(13.sp),
          child: BackdropFilter(
            filter: ImageFilter.blur(
              sigmaY: 10.sp,
              sigmaX: 10.sp,
            ),
            child: Container(
              constraints: BoxConstraints(
                minWidth: 100.sp,
                maxWidth: ctx.width / 2.5,
              ),
              height: 40.sp,
              color: Colors.white.withOpacity(0.05),
            ),
          ),
        ),
        Container(
          height: 40.sp,
          constraints: BoxConstraints(
            minWidth: 100.sp,
            maxWidth: ctx.width / 2.5,
          ),
          padding: EdgeInsets.symmetric(
            horizontal: 8.sp,
            vertical: 3.sp,
          ),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(13.sp),
            color: Colors.transparent,
          ),
          alignment: Alignment.center,
          child: Text(
            text,
            style: TextStyle(
              fontSize: ctx.isMobile ? 12.sp : 18.sp,
              color: Theme.of(ctx).colorScheme.tertiary,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ],
    ),
    position: ToastPosition.bottom,
    duration: 2500.milliseconds,
  );
}
