import 'package:day_night_themed_switcher/day_night_themed_switcher.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:portfolio/constants/portfolio_constants.dart';
import 'package:portfolio/constants/portfolio_data.dart';
import 'package:portfolio/utilities/extensions.dart';
import 'package:portfolio/utilities/utils.dart';
import 'package:portfolio/providers/nav_provider.dart';
import 'package:portfolio/providers/ui_provider.dart';
import 'package:portfolio/widgets/web/web_nav_item.dart';
import 'package:resize/resize.dart';

AppBar webAppBar(BuildContext context) => AppBar(
      automaticallyImplyLeading: false,
      leadingWidth: 0.sp,
      centerTitle: false,
      toolbarHeight: 70.sp,
      backgroundColor: Colors.transparent,
      surfaceTintColor: Colors.transparent,
      title: Container(
        alignment: Alignment.center,
        width: context.width,
        height: 60.sp,
        color: Colors.transparent,
        padding: EdgeInsets.all(10.sp),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            MouseRegion(
              opaque: false,
              cursor: SystemMouseCursors.click,
              child: Consumer(builder: (_, ref, __) {
                return GestureDetector(
                  onTap: () => updateIndex(context, ref, homeIndex),
                  child: Container(
                    height: 60.sp,
                    width: 60.sp,
                    clipBehavior: Clip.hardEdge,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.transparent,
                    ),
                    child: SvgPicture.asset(avatar),
                  ),
                );
              }),
            ),
            Expanded(
              child: Align(
                alignment: Alignment.centerRight,
                child: ListView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemExtent: context.width / 18,
                  itemCount: navItems.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (ctx, index) => WebNavItem(
                    index: index,
                  ),
                ),
              ),
            ),
            Gap(25.sp),
            Consumer(
              builder: (_, ref, __) => DayNightSwitch(
                size: 30.sp,
                initiallyDark: isDarkMode(ref.read(themeModeProvider)),
                onChange: (darkMode) => toggleThemeMode(ref, darkMode),
              ),
            ),
          ],
        ),
      ),
    );
