import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:portfolio/constants/portfolio_data.dart';
import 'package:portfolio/utilities/extensions.dart';
import 'package:portfolio/providers/nav_provider.dart';
import 'package:resize/resize.dart';

class WebNavItem extends ConsumerStatefulWidget {
  const WebNavItem({
    super.key,
    required this.index,
  });

  final int index;

  @override
  ConsumerState<WebNavItem> createState() => _NavItemState();
}

class _NavItemState extends ConsumerState<WebNavItem>
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
                  navItems[widget.index],
                  style: TextStyle(
                    fontSize: 18.sp,
                    color: Theme.of(context).colorScheme.tertiary,
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
                    width: context.width / 18,
                    decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.tertiary,
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
