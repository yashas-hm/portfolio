import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:portfolio/controller/nav_controller.dart';
import 'package:portfolio/core/constants/app_constants.dart';
import 'package:portfolio/core/constants/color_constants.dart';
import 'package:portfolio/core/model/data.dart';
import 'package:portfolio/core/model/model.dart';
import 'package:resize/resize.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

class Page2 extends StatefulWidget {
  const Page2({super.key});

  @override
  State<Page2> createState() => _Page2State();
}

class _Page2State extends State<Page2> with SingleTickerProviderStateMixin {
  late AnimationController animController;
  final ctr = Get.find<NavController>();

  @override
  void initState() {
    animController = AnimationController(
      vsync: this,
      duration: 1000.milliseconds,
    );

    ctr.listener.itemPositions.addListener(() {
      ItemPosition? item;

      for (var position in ctr.listener.itemPositions.value) {
        if (position.index == AppConstants.aboutIndex) {
          item = position;
        }
      }

      if (item != null) {
        if (item.itemLeadingEdge <= 0.5) {
          animController.forward();
        } else if (item.itemLeadingEdge > 0.5) {
          animController.reverse();
        }
      }

    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    bool hovering = false;
    final screenSize = MediaQuery.of(context).size;

    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Gap(20.sp),
        Text(
          'About Me',
          style: TextStyle(
            fontSize: 30.sp,
            fontWeight: FontWeight.w500,
          ),
        ),
        Gap(30.sp),
        Container(
          width: screenSize.width / 2,
          padding: EdgeInsets.symmetric(
            horizontal: 25.sp,
            vertical: 20.sp,
          ),
          decoration: BoxDecoration(
            color: AppColor.box,
            borderRadius: BorderRadius.circular(13.sp),
          ),
          alignment: Alignment.center,
          child: AutoSizeText(
            Data.smallAbout,
            textAlign: TextAlign.justify,
            style: TextStyle(
              fontSize: 18.sp,
            ),
            minFontSize: 5,
            stepGranularity: 0.5,
          ),
        ),
        Gap(30.sp),
        RichText(
          text: TextSpan(
            text: 'Times I put the ',
            children: [
              TextSpan(
                text: '"Leader Hat"',
                style: TextStyle(
                  fontSize: 23.sp,
                  color: AppColor.secondary,
                  fontFamily: 'space_grotesk',
                ),
              ),
              TextSpan(
                text: '!',
                style: TextStyle(
                  fontSize: 23.sp,
                  fontWeight: FontWeight.w500,
                  color: AppColor.textColor,
                  fontFamily: 'space_grotesk',
                ),
              ),
            ],
            style: TextStyle(
              fontSize: 23.sp,
              fontWeight: FontWeight.w500,
              color: AppColor.textColor,
              fontFamily: 'space_grotesk',
            ),
          ),
        ),
        Gap(30.sp),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            leaderShipBox(
              screenSize,
              Data.por[0],
              0,
              0.4,
            ),
            leaderShipBox(
              screenSize,
              Data.por[1],
              0.3,
              0.7,
            ),
            leaderShipBox(
              screenSize,
              Data.por[2],
              0.6,
              1,
            ),
          ],
        ),
        Gap(30.sp),
        StatefulBuilder(
          builder: (ctx, setState) {
            return MouseRegion(
              opaque: false,
              cursor: SystemMouseCursors.click,
              onEnter: (_) => setState(() => hovering = true),
              onExit: (_) => setState(() => hovering = false),
              child: GestureDetector(
                onTap: () => Get.find<NavController>().updateIndex(
                  AppConstants.aboutIndex,
                  force: true,
                ),
                child: Text(
                  'Care to indulge me in another round of self-glorification? ${hovering ? '😁' : '🤔'}',
                  style: TextStyle(
                    fontSize: 20.sp,
                    color: hovering ? AppColor.secondary : AppColor.textColor,
                  ),
                ),
              ),
            );
          },
        ),
      ],
    );
  }

  Widget leaderShipBox(
    Size screenSize,
    Model model,
    double begin,
    double end,
  ) {
    return FadeTransition(
      opacity: Tween<double>(
        begin: 0,
        end: 1,
      ).animate(
        CurvedAnimation(
          parent: animController,
          curve: Interval(
            begin,
            end - 0.2,
            curve: Curves.easeIn,
          ),
        ),
      ),
      child: SlideTransition(
        position: Tween<Offset>(
          begin: const Offset(0, -0.5),
          end: Offset.zero,
        ).animate(
          CurvedAnimation(
            parent: animController,
            curve: Interval(
              begin,
              end,
              curve: Curves.easeIn,
            ),
          ),
        ),
        child: Container(
          width: screenSize.width / 3.4,
          padding: EdgeInsets.symmetric(
            horizontal: 15.sp,
            vertical: 10.sp,
          ),
          decoration: BoxDecoration(
            color: AppColor.box,
            borderRadius: BorderRadius.circular(13.sp),
          ),
          alignment: Alignment.center,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                model.role,
                style: TextStyle(
                  fontSize: 25.sp,
                  fontWeight: FontWeight.w600,
                  color: AppColor.secondary,
                ),
              ),
              Text(
                model.name,
                style: TextStyle(
                  fontSize: 18.sp,
                  fontWeight: FontWeight.w400,
                ),
              ),
              Gap(15.sp),
              Text(
                model.description.join(''),
                textAlign: TextAlign.justify,
                style: TextStyle(
                  fontSize: 18.sp,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
