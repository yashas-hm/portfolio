import 'package:day_night_themed_switcher/day_night_themed_switcher.dart';
import 'package:flutter/material.dart';
import 'package:flutter_advanced_drawer/flutter_advanced_drawer.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:portfolio/core/constants/constants.dart';
import 'package:portfolio/core/utilities/extensions.dart';
import 'package:portfolio/core/utilities/utils.dart';
import 'package:portfolio/providers/nav_provider.dart';
import 'package:portfolio/providers/ui_provider.dart';
import 'package:resize/resize.dart';

AppBar customAppBar(
  BuildContext context,
  AdvancedDrawerController advancedDrawerController,
) =>
    AppBar(
      automaticallyImplyLeading: false,
      centerTitle: true,
      toolbarHeight: 70.sp,
      backgroundColor: Colors.transparent,
      surfaceTintColor: Colors.transparent,
      title: Container(
        alignment: Alignment.center,
        width: context.width,
        height: 60.sp,
        padding: EdgeInsets.all(10.sp),
        child: Row(
          children: [
            ValueListenableBuilder<AdvancedDrawerValue>(
              valueListenable: advancedDrawerController,
              builder: (_, value, __) {
                return GestureDetector(
                  onTap: () => value.visible
                      ? advancedDrawerController.hideDrawer()
                      : advancedDrawerController.showDrawer(),
                  child: AnimatedSwitcher(
                    duration: const Duration(microseconds: 500),
                    child: Padding(
                      padding: EdgeInsets.only(left: 15.sp),
                      child: Icon(
                        key: ValueKey<bool>(value.visible),
                        value.visible ? Icons.clear : Icons.menu,
                        size: 20.sp,
                      ),
                    ),
                  ),
                );
              },
            ),
            Expanded(
              child: Consumer(
                builder: (_, ref, __) => GestureDetector(
                  onTap: () => updateIndex(context, ref, homeIndex),
                  child: Container(
                    height: 50.sp,
                    width: 50.sp,
                    clipBehavior: Clip.hardEdge,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.transparent,
                    ),
                    child: SvgPicture.asset(avatar),
                  ),
                ),
              ),
            ),
            Consumer(
              builder: (_, ref, __) => DayNightSwitch(
                size: 20.sp,
                initiallyDark: isDarkMode(ref.read(themeModeProvider)),
                onChange: (darkMode) => toggleThemeMode(ref, darkMode),
              ),
            ),
          ],
        ),
      ),
    );
