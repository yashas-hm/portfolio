import 'package:flutter/material.dart';
import 'package:flutter_advanced_drawer/flutter_advanced_drawer.dart';
import 'package:get/get.dart';
import 'package:portfolio/controller/nav_controller.dart';
import 'package:portfolio/core/constants/app_constants.dart';
import 'package:portfolio/core/constants/color_constants.dart';
import 'package:portfolio/core/data/data.dart';
import 'package:portfolio/screens/about_screen.dart';
import 'package:portfolio/screens/experience_screen.dart';
import 'package:portfolio/screens/home_screen.dart';
import 'package:portfolio/screens/project_screen.dart';
import 'package:portfolio/widgets/appbar.dart';
import 'package:portfolio/widgets/bottom_bar.dart';
import 'package:portfolio/widgets/connect_button.dart';
import 'package:resize/resize.dart';

class CustomScaffold extends StatelessWidget {
  CustomScaffold({
    super.key,
  });

  final advancedDrawerController = AdvancedDrawerController();
  final ctr = Get.find<NavController>();

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

    return screenSize.height > screenSize.width
        ? AdvancedDrawer(
            controller: advancedDrawerController,
            backdropColor: AppColor.bottomBar,
            drawer: SafeArea(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  ListView.builder(
                    itemCount: Data.navItems.length,
                    shrinkWrap: true,
                    itemBuilder: (ctx, index) => GestureDetector(
                      onTap: () {
                        advancedDrawerController.hideDrawer();
                        ctr.page.value = index;
                      },
                      child: Obx(
                        () => Container(
                          height: screenSize.height / 15,
                          margin: EdgeInsets.only(
                            left: 25.sp,
                            bottom: 15.sp,
                          ),
                          decoration: BoxDecoration(
                            color: AppColor.bottomBar,
                            borderRadius: BorderRadius.circular(10.sp),
                            border: Border.all(
                              color: AppColor.primary,
                              width: 1.sp,
                            ),
                            boxShadow: ctr.page.value == index
                                ? [
                                    BoxShadow(
                                      color: AppColor.primary,
                                      blurRadius: 5.sp,
                                    ),
                                  ]
                                : [],
                          ),
                          alignment: Alignment.center,
                          child: Text(
                            Data.navItems[index],
                            style: TextStyle(
                              fontSize: 18.sp,
                              fontWeight: ctr.page.value == index
                                  ? FontWeight.w600
                                  : FontWeight.w400,
                              color: AppColor.textColor,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    width: screenSize.width / 2,
                    margin: EdgeInsets.only(left: 25.sp),
                    child: FittedBox(
                      fit: BoxFit.scaleDown,
                      child: Text(
                        'Connect with me at:',
                        style: TextStyle(
                          fontFamily: 'roboto',
                          fontSize: 20.sp,
                          fontWeight: FontWeight.w300,
                          color: AppColor.textColor,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10.sp,
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 25.sp),
                    width: screenSize.width / 2,
                    child: const Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        ConnectButton(
                          animation: AppConstants.githubAnim,
                          link: AppConstants.githubLink,
                        ),
                        ConnectButton(
                          animation: AppConstants.linkedinAnim,
                          link: AppConstants.linkedinLink,
                        ),
                        ConnectButton(
                          animation: AppConstants.instaAnim,
                          link: AppConstants.instaLink,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            child: Scaffold(
              extendBodyBehindAppBar: true,
              appBar: CustomAppbar.mobileAppBar(
                context,
                advancedDrawerController,
              ),
              body: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Obx(() => getScreen(),),
                    const BottomBar(),
                  ],
                ),
              ),
            ),
          )
        : Scaffold(
            extendBodyBehindAppBar: true,
            appBar: CustomAppbar.appbar(context, 0),
            body: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Obx(() => getScreen()),
                  const BottomBar(),
                ],
              ),
            ),
          );
  }

  Widget getScreen() {
    switch (ctr.page.value) {
      case 0:
        return const HomeScreen();
      case 1:
        return const AboutScreen();
      case 2:
        return const ExperienceScreen();
      case 3:
        return const ProjectsScreen();
      // case 4:
      //   return const CertificationsScreen();
      default:
        return const HomeScreen();
    }
  }
}
