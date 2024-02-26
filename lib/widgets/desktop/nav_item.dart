import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:portfolio/controller/nav_controller.dart';
import 'package:portfolio/core/constants/color_constants.dart';
import 'package:portfolio/core/constants/portfolio_data.dart';
import 'package:resize/resize.dart';

class NavItem extends StatefulWidget {
  const NavItem({
    Key? key,
    required this.index,
  }) : super(key: key);

  final int index;

  @override
  State<NavItem> createState() => _NavItemState();
}

class _NavItemState extends State<NavItem> with SingleTickerProviderStateMixin {
  late final AnimationController animController;
  final ctr = Get.find<NavController>();

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
    return Obx(
      () {
        if (ctr.currentIndex.value == widget.index) {
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
                if (ctr.currentIndex.value != widget.index) {
                  animController.forward();
                }
              },
              onExit: (mouse) {
                if (ctr.currentIndex.value != widget.index) {
                  animController.reverse();
                }
              },
              child: GestureDetector(
                onTap: () => ctr.updateIndex(widget.index),
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
                        fontWeight: ctr.currentIndex.value == widget.index
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
      },
    );
  }
}
