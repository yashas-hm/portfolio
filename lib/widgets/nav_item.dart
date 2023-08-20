import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:portfolio/core/constants/color_constants.dart';
import 'package:portfolio/core/data/data.dart';
import 'package:portfolio/screens/about_screen.dart';
import 'package:portfolio/screens/certifications_screen.dart';
import 'package:portfolio/screens/education_screen.dart';
import 'package:portfolio/screens/experience_screen.dart';
import 'package:portfolio/screens/home_screen.dart';
import 'package:portfolio/screens/project_screen.dart';
import 'package:resize/resize.dart';

class NavItem extends StatefulWidget {
  const NavItem({
    Key? key,
    required this.index,
    required this.page,
  }) : super(key: key);

  final int index;
  final int page;

  @override
  State<NavItem> createState() => _NavItemState();
}

class _NavItemState extends State<NavItem> with SingleTickerProviderStateMixin {
  late final AnimationController animController;

  @override
  void initState() {
    animController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 200),
    );
    if(widget.page==widget.index){
      animController.forward();
    }
    super.initState();
  }

  @override
  void dispose() {
    animController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 95.sp,
      width: 190.sp,
      alignment: Alignment.center,
      padding: EdgeInsets.symmetric(vertical: 8.sp),
      child: MouseRegion(
        onEnter: (mouse) {
          if(widget.page!=widget.index){
            animController.forward();
          }
        },
        onExit: (mouse) {
          if(widget.page!=widget.index){
            animController.reverse();
          }
        },
        child: GestureDetector(
          onTap: widget.page == widget.index ? null : navigateToScreen,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                Data.navItems[widget.index],
                style: TextStyle(
                  fontSize: 25.sp,
                  color: widget.page == widget.index
                      ? AppColor.primaryLight
                      : AppColor.bgLight,
                  fontWeight: widget.page == widget.index
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
                  decoration: BoxDecoration(
                    color: AppColor.primaryLight,
                    borderRadius: BorderRadius.circular(10.sp),
                  ),
                  height: 5.sp,
                  width: 190.sp,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void navigateToScreen() {
    switch (widget.index) {
      case 0:
        Get.to(() => const HomeScreen());
        break;
      case 1:
        Get.to(() => const AboutScreen());
        break;
      case 2:
        Get.to(() => const ExperienceScreen());
        break;
      case 3:
        Get.to(() => const EducationScreen());
        break;
      case 4:
        Get.to(() => const ProjectsScreen());
        break;
      case 5:
        Get.to(() => const CertificationsScreen());
        break;
    }
  }
}
