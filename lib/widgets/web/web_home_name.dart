import 'dart:ui';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:lava_lamp_effect/lava_lamp_effect.dart';
import 'package:portfolio/constants/constants.dart' show KnownColors;
import 'package:portfolio/constants/legacy_constants/portfolio_constants.dart';
import 'package:portfolio/constants/legacy_constants/portfolio_data.dart';
import 'package:portfolio/providers/nav_provider.dart';
import 'package:portfolio/repositories/theme_repository.dart';
import 'package:portfolio/utilities/extensions.dart';
import 'package:portfolio/utilities/widget_generators.dart';
import 'package:portfolio/widgets/connect_button.dart';
import 'package:resize/resize.dart';

class WebHomeName extends ConsumerStatefulWidget {
  const WebHomeName({super.key});

  @override
  ConsumerState<WebHomeName> createState() => _HomeNameState();
}

class _HomeNameState extends ConsumerState<WebHomeName> {
  final key = GlobalKey();
  double? boxHeight;

  @override
  void initState() {
    SchedulerBinding.instance.addPostFrameCallback((_) {
      if (mounted && boxHeight == null) {
        final box = key.currentContext?.findRenderObject() as RenderBox;
        setState(() => boxHeight = box.size.height + 30.sp);
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final size = Size(
      context.width / 3.3,
      boxHeight ?? context.width / 5,
    );

    return Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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
                child: AnimatedSwitcher(
                  duration: 500.milliseconds,
                  child: ValueListenableBuilder<ThemeMode>(
                    valueListenable: ThemeRepository.instance.state,
                    builder: (_, themeMode, __) {
                      return themeMode.isDarkMode
                          ? Image.asset(
                              key: const ValueKey<String>('night'),
                              darkGIF,
                              fit: BoxFit.fill,
                              width: size.width,
                              height: size.height,
                            )
                          : Image.asset(
                              key: const ValueKey<String>('day'),
                              lightGIF,
                              fit: BoxFit.fill,
                              width: size.width,
                              height: size.height,
                            );
                    },
                  ),
                ),
              ),
              Center(
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
              Center(
                child: Container(
                  key: key,
                  padding: EdgeInsets.all(25.sp),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(13.sp),
                  ),
                  clipBehavior: Clip.hardEdge,
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
                            color: KnownColors.gray50,
                            fontSize: 40.sp,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                      Row(
                        children: [
                          FittedBox(
                            fit: BoxFit.scaleDown,
                            child: Text(
                              'I can build ',
                              style: TextStyle(
                                fontSize: 28.sp,
                                fontWeight: FontWeight.w500,
                                color: KnownColors.gray50,
                              ),
                            ),
                          ),
                          FittedBox(
                            fit: BoxFit.scaleDown,
                            child: typerWidget(
                              textList: introTyperText,
                              fontSize: 28.sp,
                              fontWeight: FontWeight.w600,
                              color: Theme.of(context).colorScheme.primary,
                              pauseDuration: 1.5.seconds,
                            ),
                          ),
                        ],
                      ),
                      Gap(10.sp),
                      Container(
                        alignment: Alignment.centerLeft,
                        width: context.width / 5,
                        child: FittedBox(
                          fit: BoxFit.scaleDown,
                          child: Text(
                            'Let\'s Connect 🤝🏻',
                            style: TextStyle(
                              fontSize: 20.sp,
                              fontWeight: FontWeight.w400,
                              color: KnownColors.gray50,
                            ),
                          ),
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
                              KnownColors.gray50,
                              BlendMode.srcIn,
                            ),
                            size: Size(40.sp, 40.sp),
                          ),
                          SocialButton(
                            icon: linkedin,
                            link: linkedinLink,
                            size: Size(40.sp, 40.sp),
                          ),
                          SocialButton(
                            icon: instagram,
                            link: instaLink,
                            size: Size(40.sp, 40.sp),
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
        MouseRegion(
          opaque: false,
          cursor: SystemMouseCursors.click,
          child: GestureDetector(
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
                    child: LavaLampEffect(
                      size: size,
                      lavaCount: 4,
                    ),
                  ),
                  Center(
                    child: Padding(
                      padding: EdgeInsets.all(20.sp),
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
                                    fontSize: 25.sp,
                                    fontStyle: FontStyle.italic,
                                    fontWeight: FontWeight.w600,
                                    color:
                                        Theme.of(context).colorScheme.tertiary,
                                  ),
                                ),
                                TextSpan(
                                  text: 'Yashas',
                                  style: TextStyle(
                                    fontSize: 25.sp,
                                    fontWeight: FontWeight.w600,
                                    color:
                                        Theme.of(context).colorScheme.tertiary,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Text(
                            'It knows my story',
                            style: TextStyle(
                              fontSize: 20.sp,
                            ),
                          ),
                          Expanded(
                            child: Center(
                              child: SizedBox(
                                width: size.width / 1.5,
                                child: AutoSizeText(
                                  'Sure, there\'s a dazzling portfolio below; but '
                                  'hey, wouldn\'t it be easier to just ask me? 😉',
                                  style: TextStyle(
                                    fontSize: 14.sp,
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
                          Hero(
                            tag: 'heroChat',
                            child: Container(
                              height: 40.sp,
                              width: double.infinity,
                              padding: EdgeInsets.symmetric(
                                vertical: 5.sp,
                                horizontal: 10.sp,
                              ),
                              decoration: BoxDecoration(
                                color:
                                    Theme.of(context).scaffoldBackgroundColor,
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
                                          textList: chatRecommendations,
                                          fontSize: 14.sp,
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
                                      color: Theme.of(context)
                                          .colorScheme
                                          .tertiary,
                                      size: 14.sp,
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
              ),
            ),
          ),
        ),
      ],
    );
  }
}
