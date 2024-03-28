import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_advanced_drawer/flutter_advanced_drawer.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:portfolio/core/constants/portfolio_data.dart';
import 'package:portfolio/core/utilities/extensions.dart';
import 'package:portfolio/providers/nav_provider.dart';
import 'package:resize/resize.dart';

class NavItem extends ConsumerStatefulWidget {
  const NavItem(
      {super.key,
      required this.advancedDrawerController,
      required this.initialIndex});

  final AdvancedDrawerController advancedDrawerController;

  final int initialIndex;

  @override
  ConsumerState<NavItem> createState() => _NavItemState();
}

class _NavItemState extends ConsumerState<NavItem>
    with TickerProviderStateMixin {
  final Map<GlobalKey, Widget> list = {};
  final List<GlobalKey> keys = [];

  int currIndex = 0;

  late Animation<double> scaleAnim;
  late Animation<double> slideAnim;
  late AnimationController animationController;

  int oldIndex = 0;
  double? from;
  double? to;

  @override
  void didUpdateWidget(covariant NavItem oldWidget) {
    if (oldIndex != widget.initialIndex) {
      if (widget.initialIndex < keys.length) {
        setState(() {
          to = getYOffset(widget.initialIndex);
          createSlideAnim(from!, to!);
          oldIndex = widget.initialIndex;
          buildChildren();
        });
      } else {
        setState(() {
          to = 0;
          createSlideAnim(from!, to!);
          oldIndex = -1;
          buildChildren();
        });
      }
      oldIndex = widget.initialIndex;
      animationController.forward();
    }
    super.didUpdateWidget(oldWidget);
  }

  @override
  void didChangeDependencies() {
    buildChildren();
    super.didChangeDependencies();
  }

  @override
  void initState() {
    oldIndex = widget.initialIndex;
    generateKeys();
    // buildChildren();

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

    createSlideAnim(0, 0);

    animationController.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        setState(() {
          from = to!;
          to = null;
          buildChildren();
          createSlideAnim(from!, 0);
        });
        animationController.reset();
        widget.advancedDrawerController.hideDrawer();
      }
    });

    super.initState();
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  void createSlideAnim(
    double begin,
    double end,
  ) {
    slideAnim = Tween<double>(
      begin: begin,
      end: end,
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

  double getYOffset(index) {
    final GlobalKey iconKey = list.keys.toList()[index];
    RenderBox box = iconKey.currentContext?.findRenderObject() as RenderBox;
    Offset offset = box.localToGlobal(Offset.zero);
    return offset.dy + 10.sp;
  }

  void startAnimation(int index) {
    if (index != oldIndex) {
      setState(() {
        to = getYOffset(index);
        createSlideAnim(from!, to!);
        oldIndex = -1;
        buildChildren();
      });
      updateIndex(
        context,
        ref,
        index,
      );
      oldIndex = index;
      animationController.forward();
    }
  }

  @override
  Widget build(BuildContext context) {
    SchedulerBinding.instance.addPostFrameCallback((timeStamp) {
      if (from == null) {
        setState(() {
          from = getYOffset(oldIndex);
          createSlideAnim(from!, 0);
        });
      }
    });
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
              children: getChildren(),
            ),
          ),
        ],
      ),
    );
  }

  List<Widget> getChildren() {
    return list.values.toList();
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
        onTap: () => startAnimation(index),
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
              fontWeight: oldIndex == index ? FontWeight.w600 : FontWeight.w400,
              color: Theme.of(context).colorScheme.tertiary,
            ),
          ),
        ),
      );
    }
  }
}
