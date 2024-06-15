import 'dart:ui';

import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:portfolio/core/constants/app_constants.dart';
import 'package:portfolio/core/constants/color_constants.dart';
import 'package:portfolio/core/utilities/extensions.dart';
import 'package:portfolio/core/utilities/utils.dart';
import 'package:portfolio/providers/ui_provider.dart';
import 'package:portfolio/widgets/connect_button.dart';
import 'package:resize/resize.dart';

class HomeName extends ConsumerStatefulWidget {
  const HomeName({super.key});

  @override
  ConsumerState<HomeName> createState() => _HomeNameState();
}

class _HomeNameState extends ConsumerState<HomeName> {
  final key = GlobalKey();
  double? boxHeight;

  @override
  Widget build(BuildContext context) {
    final themeMode = ref.watch(themeModeProvider);

    SchedulerBinding.instance.addPostFrameCallback((timeStamp) {
      if (boxHeight == null) {
        final box = key.currentContext?.findRenderObject() as RenderBox;
        setState(() {
          boxHeight = box.size.height + 20.sp;
        });
      }
    });

    return Container(
      width: context.width / 1.2,
      height: boxHeight ?? context.height / 3,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(13.sp),
      ),
      clipBehavior: Clip.hardEdge,
      child: Stack(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(13.sp),
            child: isDarkMode(themeMode)
                ? Image.asset(
                    key: const ValueKey<String>('night'),
                    darkGIF,
                    fit: BoxFit.fill,
                    width: context.width,
                    height: boxHeight ?? context.height / 3,
                  )
                : Image.asset(
                    key: const ValueKey<String>('day'),
                    lightGIF,
                    fit: BoxFit.fill,
                    width: context.width,
                    height: boxHeight ?? context.height / 3,
                  ),
          ),
          Align(
            alignment: Alignment.center,
            child: ClipRRect(
              child: BackdropFilter(
                filter: ImageFilter.blur(
                  sigmaX: 15.sp,
                  sigmaY: 15.sp,
                ),
                child: Container(),
              ),
            ),
          ),
          Align(
            alignment: Alignment.center,
            child: Container(
              key: key,
              padding: EdgeInsets.all(15.sp),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(13.sp),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  FittedBox(
                    fit: BoxFit.scaleDown,
                    child: Text(
                      'Hello 👋🏻, I\'m\nYashas H Majmudar',
                      style: TextStyle(
                        color: darkText,
                        fontSize: 24.sp,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  Row(
                    children: [
                      AutoSizeText(
                        'I can build ',
                        minFontSize: 11,
                        stepGranularity: 0.1,
                        style: TextStyle(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w500,
                          color: darkText,
                        ),
                      ),
                      AnimatedTextKit(
                        pause: 1.5.seconds,
                        displayFullTextOnTap: true,
                        animatedTexts: buildWriterText(),
                        repeatForever: true,
                      )
                    ],
                  ),
                  Gap(10.sp),
                  Text(
                    'Let\'s Connect 🤝🏻',
                    style: TextStyle(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w400,
                      color: darkText,
                    ),
                  ),
                  Gap(20.sp),
                  SizedBox(
                    width: context.width / 3,
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SocialButton(
                          icon: github,
                          link: githubLink,
                          color: const ColorFilter.mode(
                            darkText,
                            BlendMode.srcIn,
                          ),
                          size: Size(25.sp, 25.sp),
                        ),
                        SocialButton(
                          icon: linkedin,
                          link: linkedinLink,
                          size: Size(25.sp, 25.sp),
                        ),
                        SocialButton(
                          icon: instagram,
                          link: instaLink,
                          size: Size(25.sp, 25.sp),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  List<TypewriterAnimatedText> buildWriterText() {
    final textList = [
      'Mobile Apps',
      'Web Apps',
      'Websites',
      'Databases',
      'APIs',
      'ML Models'
    ];
    final textWidgets = <TypewriterAnimatedText>[];
    for (var text in textList) {
      textWidgets.add(
        TypewriterAnimatedText(
          text,
          textStyle: TextStyle(
            fontSize: 20.sp,
            fontWeight: FontWeight.w600,
            color: Theme.of(context).colorScheme.primary,
          ),
        ),
      );
    }
    return textWidgets;
  }
}
