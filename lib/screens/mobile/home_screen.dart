import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:portfolio/controller/nav_controller.dart';
import 'package:portfolio/screens/mobile/home_screen/page1.dart';
import 'package:portfolio/screens/mobile/home_screen/page2.dart';
import 'package:portfolio/screens/mobile/home_screen/page3.dart';
import 'package:portfolio/screens/mobile/home_screen/page4.dart';
import 'package:portfolio/screens/mobile/home_screen/page5.dart';
import 'package:portfolio/widgets/bottom_bar.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final ctr = Get.find<NavController>();
  final pages = <Widget>[
    const Page1(),
    const Page2(),
    const Page3(),
    const Page4(),
    const Page5(),
    BottomBar(),
  ];

  @override
  void initState() {
    ctr.controller = ItemScrollController();
    ctr.listener = ItemPositionsListener.create();

    ctr.listener.itemPositions.addListener(() {
      final item = ctr.listener.itemPositions.value;

      if (item.last.itemLeadingEdge <= 0.5 &&
          ctr.currentIndex.value != item.last.index) {
        ctr.currentIndex.value = item.last.index;
      } else if (item.last.itemLeadingEdge > 0.7 &&
          ctr.currentIndex.value != item.toList()[item.length - 2].index) {
        ctr.currentIndex.value = item.toList()[item.length - 2].index;
      }
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height,
      child: ScrollablePositionedList.builder(
        shrinkWrap: true,
        itemScrollController: ctr.controller,
        itemPositionsListener: ctr.listener,
        physics: const BouncingScrollPhysics(
          parent: AlwaysScrollableScrollPhysics(),
        ),
        itemCount: pages.length,
        itemBuilder: (ctx, index) => pages[index],
      ),
    );

    // return Container(
    //   width: screenSize.width,
    //   padding: EdgeInsets.only(top: 80.sp),
    //   decoration: BoxDecoration(
    //     gradient: LinearGradient(
    //       colors: [
    //         AppColor.primary.withOpacity(0.9),
    //         Colors.transparent,
    //       ],
    //       // stops: const [0, 0.8],
    //       begin: Alignment.topCenter,
    //       end: Alignment.bottomCenter,
    //     ),
    //   ),
    //   child: Column(
    //     mainAxisSize: MainAxisSize.min,
    //     mainAxisAlignment: MainAxisAlignment.start,
    //     crossAxisAlignment: CrossAxisAlignment.center,
    //     children: [
    //       Image.asset(
    //         AppConstants.photo,
    //         height: screenSize.width / 1.3,
    //       ),
    //       Gap(10.sp),
    //       SizedBox(
    //         width: screenSize.width *0.9,
    //         child: Column(
    //           mainAxisAlignment: MainAxisAlignment.center,
    //           crossAxisAlignment: CrossAxisAlignment.start,
    //           mainAxisSize: MainAxisSize.min,
    //           children: [
    //             FittedBox(
    //               fit: BoxFit.scaleDown,
    //               child: Text(
    //                 'Hello 👋🏻, I\'m\nYashas H Majmudar',
    //                 style: TextStyle(
    //                   color: AppColor.textColor,
    //                   fontSize: 35.sp,
    //                   fontWeight: FontWeight.w600,
    //                 ),
    //               ),
    //             ),
    //             Gap(10.sp),
    //             Row(
    //               children: [
    //                 Text(
    //                   'I can build ',
    //                   style: TextStyle(
    //                     fontSize: 25.sp,
    //                     fontWeight: FontWeight.w500,
    //                     color: AppColor.textColor,
    //                   ),
    //                 ),
    //                 AnimatedTextKit(
    //                   displayFullTextOnTap: true,
    //                   animatedTexts: [
    //                     TypewriterAnimatedText(
    //                       'Mobile Apps',
    //                       textStyle: TextStyle(
    //                         fontSize: 25.sp,
    //                         fontWeight: FontWeight.w600,
    //                         color: AppColor.primary,
    //                       ),
    //                     ),
    //                     TypewriterAnimatedText(
    //                       'Web Apps',
    //                       textStyle: TextStyle(
    //                         fontSize: 25.sp,
    //                         fontWeight: FontWeight.w600,
    //                         color: AppColor.primary,
    //                       ),
    //                     ),
    //                     TypewriterAnimatedText(
    //                       'Websites',
    //                       textStyle: TextStyle(
    //                         fontSize: 25.sp,
    //                         fontWeight: FontWeight.w600,
    //                         color: AppColor.primary,
    //                       ),
    //                     ),
    //                     TypewriterAnimatedText(
    //                       'Databases',
    //                       textStyle: TextStyle(
    //                         fontSize: 25.sp,
    //                         fontWeight: FontWeight.w600,
    //                         color: AppColor.primary,
    //                       ),
    //                     ),
    //                     TypewriterAnimatedText(
    //                       'APIs',
    //                       textStyle: TextStyle(
    //                         fontSize: 25.sp,
    //                         fontWeight: FontWeight.w600,
    //                         color: AppColor.primary,
    //                       ),
    //                     ),
    //                     TypewriterAnimatedText(
    //                       'ML Models',
    //                       textStyle: TextStyle(
    //                         fontSize: 25.sp,
    //                         fontWeight: FontWeight.w600,
    //                         color: AppColor.primary,
    //                       ),
    //                     ),
    //                   ],
    //                   repeatForever: true,
    //                 )
    //               ],
    //             ),
    //             Gap(10.sp),
    //             Container(
    //               width: screenSize.width,
    //               alignment: Alignment.centerLeft,
    //               child: FittedBox(
    //                 fit: BoxFit.scaleDown,
    //                 child: Text(
    //                   'Let\'s Connect 🤝🏻',
    //                   textAlign: TextAlign.left,
    //                   style: TextStyle(
    //                     fontSize: 20.sp,
    //                     fontWeight: FontWeight.w400,
    //                     color: AppColor.textColor,
    //                   ),
    //                 ),
    //               ),
    //             ),
    //             Gap(10.sp),
    //             SizedBox(
    //               width: screenSize.width,
    //               child: Row(
    //                 mainAxisSize: MainAxisSize.min,
    //                 mainAxisAlignment: MainAxisAlignment.start,
    //                 crossAxisAlignment: CrossAxisAlignment.center,
    //                 children: [
    //                   SocialButton(
    //                     icon: AppConstants.github,
    //                     link: AppConstants.githubLink,
    //                     size: Size(50.sp, 50.sp),
    //                     color: const ColorFilter.mode(
    //                       AppColor.box,
    //                       BlendMode.srcIn,
    //                     ),
    //                   ),
    //                   Gap(30.sp),
    //                    SocialButton(
    //                     icon: AppConstants.linkedin,
    //                     link: AppConstants.linkedinLink,
    //                     size: Size(50.sp, 50.sp),
    //                   ),
    //                   Gap(30.sp),
    //                    SocialButton(
    //                     icon: AppConstants.instagram,
    //                     link: AppConstants.instaLink,
    //                     size: Size(50.sp, 50.sp),
    //                   ),
    //                 ],
    //               ),
    //             ),
    //           ],
    //         ),
    //       ),
    //       Gap(10.sp),
    //       SizedBox(
    //         height: screenSize.height / 10,
    //         width: screenSize.width,
    //         child: Marqueer(
    //           interaction: false,
    //           padding: EdgeInsets.symmetric(vertical: 10.sp),
    //           restartAfterInteraction: false,
    //           pps: 50,
    //           child: Row(
    //             children: AppHelper.marqueeSvgChildrenFromMap(
    //               Data.logoSkill[0],
    //               screenSize,
    //             ),
    //           ),
    //         ),
    //       ),
    //       SizedBox(
    //         height: screenSize.height / 10,
    //         width: screenSize.width,
    //         child: Marqueer(
    //           interaction: false,
    //           padding: EdgeInsets.symmetric(vertical: 10.sp),
    //           restartAfterInteraction: false,
    //           direction: MarqueerDirection.ltr,
    //           pps: 50,
    //           child: Row(
    //             children: AppHelper.marqueeSvgChildrenFromMap(
    //               Data.logoSkill[1],
    //               screenSize,
    //             ),
    //           ),
    //         ),
    //       ),
    //       SizedBox(
    //         height: screenSize.height / 10,
    //         width: screenSize.width,
    //         child: Marqueer(
    //           interaction: false,
    //           padding: EdgeInsets.symmetric(vertical: 10.sp),
    //           restartAfterInteraction: false,
    //           pps: 50,
    //           child: Row(
    //             children: AppHelper.marqueeSvgChildrenFromMap(
    //               Data.logoSkill[2],
    //               screenSize,
    //             ),
    //           ),
    //         ),
    //       ),
    //     ],
    //   ),
    // );
  }
}
