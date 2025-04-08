import 'dart:ui';

import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:portfolio/core/constants/app_constants.dart';
import 'package:portfolio/core/constants/color_constants.dart';
import 'package:portfolio/core/constants/portfolio_data.dart';
import 'package:portfolio/core/utilities/extensions.dart';
import 'package:portfolio/core/utilities/utils.dart';
import 'package:portfolio/core/utilities/widget_generators.dart';
import 'package:portfolio/providers/nav_provider.dart';
import 'package:portfolio/providers/ui_provider.dart';
import 'package:portfolio/widgets/connect_button.dart';
import 'package:portfolio/widgets/lava_painter.dart';
import 'package:resize/resize.dart';

class HomeName extends ConsumerStatefulWidget {
  const HomeName({super.key, this.retHeight});

  final Function(double)? retHeight;

  @override
  ConsumerState<HomeName> createState() => _HomeNameState();
}

class _HomeNameState extends ConsumerState<HomeName> {
  final key = GlobalKey();
  double? boxHeight;

  @override
  void initState() {
    SchedulerBinding.instance.addPostFrameCallback((timeStamp) {
      if (boxHeight == null) {
        final box = key.currentContext?.findRenderObject() as RenderBox;
        setState(() => boxHeight = box.size.height + 20.sp);
        if (widget.retHeight != null) {
          widget.retHeight!(boxHeight!);
        }
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final themeMode = ref.watch(themeModeProvider);
    final size = Size(
      context.width / 1.2,
      boxHeight ?? context.height / 3,
    );

    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          width: size.width,
          height: size.height,
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
                          typerWidget(
                            textList: introTyperText,
                            fontSize: 20.sp,
                            fontWeight: FontWeight.w600,
                            color: Theme.of(context).colorScheme.primary,
                            pauseDuration: 1.5.seconds,
                          ),
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
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        spacing: size.width / 10,
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
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        Gap(15.sp),
        GestureDetector(
          onTap: () => updateIndex(
            context,
            ref,
            chatIndex,
            force: true,
          ),
          child: Container(
            width: size.width,
            height: size.height,
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.secondary,
              borderRadius: BorderRadius.circular(13.sp),
            ),
            clipBehavior: Clip.hardEdge,
            child: Stack(
              children: [
                Center(
                  child: ChatPrompterAnimation(
                    size: size,
                    lavaCount: 4,
                  ),
                ),
                Center(
                  child: Padding(
                    padding: EdgeInsets.all(10.sp),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        RichText(
                          text: TextSpan(
                            children: [
                              TextSpan(
                                text: 'Ask ',
                                style: TextStyle(
                                  fontSize: 18.sp,
                                  fontStyle: FontStyle.italic,
                                  fontWeight: FontWeight.w600,
                                  color: Theme.of(context).colorScheme.tertiary,
                                ),
                              ),
                              TextSpan(
                                text: 'Yashas',
                                style: TextStyle(
                                  fontSize: 18.sp,
                                  fontWeight: FontWeight.w600,
                                  color: Theme.of(context).colorScheme.tertiary,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Text(
                          'It knows my story',
                          style: TextStyle(
                            fontSize: 14.sp,
                          ),
                        ),
                        Expanded(
                          child: Center(
                            child: SizedBox(
                              width: size.width / 1.5,
                              child: AutoSizeText(
                                'Sure, there\'s a dazzling portfolio below; but '
                                    'hey, wouldn’t it be easier to just ask me? 😉',
                                style: TextStyle(
                                  fontSize: 12.sp,
                                ),
                                textAlign: TextAlign.center,
                                maxLines: 3,
                                minFontSize: 5,
                                stepGranularity: 0.1,
                                softWrap: true,
                              ),
                            ),
                          ),
                        ),
                        Container(
                          height: 40.sp,
                          width: double.infinity,
                          padding: EdgeInsets.symmetric(
                            vertical: 5.sp,
                            horizontal: 10.sp,
                          ),
                          decoration: BoxDecoration(
                            color: Theme.of(context).scaffoldBackgroundColor,
                            borderRadius: BorderRadius.circular(10.sp),
                            border: Border.all(
                              color: Theme.of(context).colorScheme.tertiary,
                            ),
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Expanded(
                                child: Align(
                                  alignment: Alignment.centerLeft,
                                  child: FittedBox(
                                    fit: BoxFit.scaleDown,
                                    child: typerWidget(
                                      textList: chatTyperText,
                                      fontSize: 12.sp,
                                      fontWeight: FontWeight.w400,
                                      color: Theme.of(context)
                                          .colorScheme
                                          .tertiary,
                                      pauseDuration: 1.5.seconds,
                                    ),
                                  ),
                                ),
                              ),
                              Gap(8.sp),
                              FittedBox(
                                fit: BoxFit.scaleDown,
                                child: Icon(
                                  Icons.send_outlined,
                                  color: Theme.of(context).colorScheme.tertiary,
                                  size: 14.sp,
                                ),
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
          ),
        ),
      ],
    );
  }
}
