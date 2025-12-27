import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_advanced_drawer/flutter_advanced_drawer.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:portfolio/constants/portfolio_data.dart';
import 'package:portfolio/providers/nav_provider.dart';
import 'package:portfolio/utilities/extensions.dart';
import 'package:resize/resize.dart';

class MobileNavItem extends ConsumerStatefulWidget {
  const MobileNavItem({
    super.key,
    required this.advancedDrawerController,
    required this.initialIndex,
  });

  final AdvancedDrawerController advancedDrawerController;

  final int initialIndex;

  @override
  ConsumerState<MobileNavItem> createState() => _NavItemState();
}

class _NavItemState extends ConsumerState<MobileNavItem>
    with TickerProviderStateMixin {
  final Map<GlobalKey, Widget> list = {};
  final List<GlobalKey> keys = [];
  late Animation<double> scaleAnim;
  late Animation<double> slideAnim;
  late AnimationController animationController;

  double from = 0;
  double to = 0;
  int newIndex = 0;

  @override
  void didUpdateWidget(covariant MobileNavItem oldWidget) {
    if (oldWidget.initialIndex != widget.initialIndex) {
      setState(() {
        from = getYOffset(oldWidget.initialIndex);
        to = 0;
        createSlideAnim();
      });
      animationController.reset();
    }
    super.didUpdateWidget(oldWidget);
  }

  @override
  void initState() {
    generateKeys();

    animationController = AnimationController(
      vsync: this,
      duration: 800.milliseconds,
    );

    scaleAnim = TweenSequence<double>([
      TweenSequenceItem(tween: Tween<double>(begin: 1, end: 0.2), weight: 1),
      TweenSequenceItem(tween: Tween<double>(begin: 0.2, end: 1), weight: 1),
    ]).animate(
      CurvedAnimation(
        parent: animationController,
        curve: Curves.linear,
      ),
    );

    createSlideAnim();

    animationController.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        widget.advancedDrawerController.hideDrawer();
        updateIndex(context, ref, newIndex);
        animationController.reset();
      }
    });

    super.initState();
  }

  @override
  void didChangeDependencies() {
    buildChildren();
    if (from == 0) {
      SchedulerBinding.instance.addPostFrameCallback((_) {
        if (mounted) {
          setState(() {
            from = getYOffset(widget.initialIndex);
            to = 0;
            createSlideAnim();
          });
        }
      });
    }
    super.didChangeDependencies();
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  void createSlideAnim() {
    slideAnim = Tween<double>(
      begin: from,
      end: to,
    ).animate(
      CurvedAnimation(
        parent: animationController,
        curve: const Interval(
          0.375,
          0.625,
          curve: Curves.linear,
        ),
      ),
    );
  }

  double getYOffset(int index) {
    if (index >= list.keys.length) {
      return context.height + 40.sp;
    } else if (index < 0) {
      return -40.sp;
    } else {
      final GlobalKey iconKey = list.keys.toList()[index];
      RenderBox box = iconKey.currentContext?.findRenderObject() as RenderBox;
      Offset offset = box.localToGlobal(Offset.zero);
      return offset.dy + 10.sp;
    }
  }

  void animate(int index) {
    if (index != widget.initialIndex) {
      setState(() {
        newIndex = index;
        from = getYOffset(widget.initialIndex);
        to = getYOffset(index);
        createSlideAnim();
      });
      SchedulerBinding.instance.addPostFrameCallback((_) {
        if (mounted) animationController.forward(from: 0);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Stack(
        children: [
          AnimatedBuilder(
            animation: animationController,
            builder: (context, _) {
              return Container(
                transform: Matrix4.translationValues(
                  90.sp,
                  slideAnim.value,
                  0,
                ),
                height: 40.sp,
                width: 150.sp,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: Colors.transparent,
                  boxShadow: [
                    BoxShadow(
                      color: Theme.of(context).colorScheme.primary,
                      blurRadius: 150.sp * scaleAnim.value,
                      spreadRadius: 30.sp * scaleAnim.value,
                    ),
                  ],
                ),
              );
            },
          ),
          Align(
            alignment: Alignment.center,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: list.values.toList(),
            ),
          ),
        ],
      ),
    );
  }

  void generateKeys() {
    for (var index = 0; index < navItems.length; index++) {
      final key = GlobalKey();
      keys.add(key);
    }
  }

  void buildChildren() {
    list.clear();
    for (var index = 0; index < navItems.length; index++) {
      list[keys[index]] = GestureDetector(
        onTap: () => animate(index),
        child: Container(
          key: keys[index],
          height: 60.sp,
          width: 180.sp,
          margin: EdgeInsets.only(
            left: 25.sp,
            bottom: navItems.length - 1 == index ? 0.sp : 35.sp,
          ),
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.secondary,
            borderRadius: BorderRadius.circular(10.sp),
          ),
          alignment: Alignment.center,
          child: Text(
            navItems[index],
            style: TextStyle(
              fontSize: 18.sp,
              fontWeight: widget.initialIndex == index
                  ? FontWeight.w600
                  : FontWeight.w400,
              color: Theme.of(context).colorScheme.tertiary,
            ),
          ),
        ),
      );
    }
  }
}
