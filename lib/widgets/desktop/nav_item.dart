import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';import 'package:portfolio/core/constants/color_constants.dart';
import 'package:portfolio/core/constants/portfolio_data.dart';
import 'package:portfolio/providers/nav_provider.dart';
import 'package:resize/resize.dart';

class NavItem extends ConsumerStatefulWidget {
  const NavItem({
    Key? key,
    required this.index,
  }) : super(key: key);

  final int index;

  @override
  ConsumerState<NavItem> createState() => _NavItemState();
}

class _NavItemState extends ConsumerState<NavItem>
    with SingleTickerProviderStateMixin {
  late final AnimationController animController;

  @override
  void initState() {
    animController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 200),
    );
    super.initState();
  }

  @override
  void dispose() {
    animController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final currentIndex = ref.watch(currentIndexProvider);

    if (currentIndex == widget.index) {
      animController.forward();
    } else {
      animController.reverse();
    }
    return FittedBox(
      fit: BoxFit.scaleDown,
      child: Container(
        height: 50.sp,
        margin: EdgeInsets.symmetric(
          horizontal: 5.sp,
        ),
        alignment: Alignment.center,
        padding: EdgeInsets.symmetric(vertical: 5.sp),
        child: MouseRegion(
          opaque: false,
          cursor: SystemMouseCursors.click,
          onEnter: (mouse) {
            if (currentIndex != widget.index) {
              animController.forward();
            }
          },
          onExit: (mouse) {
            if (currentIndex != widget.index) {
              animController.reverse();
            }
          },
          child: GestureDetector(
            onTap: () => updateIndex(context, ref, widget.index),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  PortfolioData.navItems[widget.index],
                  style: TextStyle(
                    fontSize: 18.sp,
                    color: AppColor.textColor,
                    fontWeight: currentIndex == widget.index
                        ? FontWeight.w800
                        : FontWeight.normal,
                  ),
                ),
                SizedBox(
                  height: 5.sp,
                ),
                ScaleTransition(
                  scale: Tween<double>(
                    begin: 0,
                    end: 1,
                  ).animate(
                    CurvedAnimation(
                      parent: animController,
                      curve: Curves.bounceInOut,
                    ),
                  ),
                  child: Container(
                    width: MediaQuery.of(context).size.width / 18,
                    decoration: BoxDecoration(
                      color: AppColor.textColor,
                      borderRadius: BorderRadius.circular(10.sp),
                    ),
                    height: 3.sp,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
