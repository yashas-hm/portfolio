import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:portfolio/controller/nav_controller.dart';
import 'package:portfolio/core/constants/app_constants.dart';
import 'package:portfolio/core/constants/color_constants.dart';
import 'package:portfolio/core/constants/portfolio_data.dart';
import 'package:portfolio/core/helpers/app_helpers.dart';
import 'package:portfolio/core/model/testimonial_model.dart';
import 'package:portfolio/widgets/desktop/experience_item.dart';
import 'package:resize/resize.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

class Page3 extends StatefulWidget {
  const Page3({super.key});

  @override
  State<Page3> createState() => _Page3State();
}

class _Page3State extends State<Page3> with SingleTickerProviderStateMixin {
  final experiences = [
    PortfolioData.experience.getByIdentifier('pb'),
    PortfolioData.experience.getByIdentifier('internships'),
  ];
  final ctr = Get.find<NavController>();
  late final AnimationController animationController;
  late double duration;
  bool hovering = false;

  @override
  void initState() {
    duration = experiences.length * 500.0;

    animationController = AnimationController(
      vsync: this,
      duration: duration.milliseconds,
    );

    ctr.listener.itemPositions.addListener(() {
      ItemPosition? item;

      for (var position in ctr.listener.itemPositions.value) {
        if (position.index == AppConstants.experienceIndex) {
          item = position;
        }
      }

      if (item != null &&
          item.itemLeadingEdge <= 0.7 &&
          !animationController.isAnimating) {
        animationController.forward();
      }else if(item != null &&
          item.itemLeadingEdge > 0.7){
        animationController.reverse();
      }
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: childrenBuilder(),
    );
  }

  List<Widget> childrenBuilder() {
    final screenSize = MediaQuery.of(context).size;

    final list = <Widget>[
      Gap(30.sp),
      Text(
        'Experience',
        style: TextStyle(
          fontSize: 30.sp,
          fontWeight: FontWeight.w500,
        ),
      ),
      Gap(30.sp),
    ];
    final interval =
        (duration / experiences.length).remap(0, duration, 0, 1).toDouble();
    final releaseBefore = interval / experiences.length;
    double sum = 0.0;

    for (var index = 0; index < experiences.length; index++) {
      list.add(ExperienceItem(
        experience: experiences[index],
        begin: sum,
        end: interval,
        reverse: index % 2 != 0,
        animationController: animationController,
      ));

      sum += interval - releaseBefore;
    }

    list.addAll([
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
                AppConstants.experienceIndex,
                force: true,
              ),
              child: Text(
                'Curious about the microcosm of my experiences? ${hovering ? '🧪' : '📈'}',
                style: TextStyle(
                  fontSize: 20.sp,
                  color: hovering ? AppColor.secondary : AppColor.textColor,
                ),
              ),
            ),
          );
        },
      ),
      Gap(30.sp),
      Text(
        'Testimonials',
        style: TextStyle(
          fontSize: 23.sp,
          color: AppColor.textColor,
        ),
      ),
      Gap(30.sp),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          testimonial(
            screenSize,
            PortfolioData.testimonials.getByIdentifier('pb'),
          ),
          testimonial(
            screenSize,
            PortfolioData.testimonials.getByIdentifier('pb'),
          ),
        ],
      ),
    ]);

    return list;
  }

  Widget testimonial(Size screenSize, TestimonialModel model) {
    return Container(
      width: screenSize.width / 3,
      height: screenSize.height / 3.5,
      padding: EdgeInsets.symmetric(
        horizontal: 25.sp,
        vertical: 20.sp,
      ),
      decoration: BoxDecoration(
        color: AppColor.box,
        borderRadius: BorderRadius.circular(13.sp),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: AutoSizeText(
              model.description,
              textAlign: TextAlign.justify,
              style: TextStyle(
                fontSize: 18.sp,
              ),
              minFontSize: 5,
              stepGranularity: 0.5,
            ),
          ),
          Gap(10.sp),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                height: 1.sp,
                width: 20.sp,
                margin: EdgeInsets.only(top: 10.sp),
                color: AppColor.secondary,
              ),
              Gap(10.sp),
              RichText(
                text: TextSpan(
                  text: '${model.referer}\n',
                  children: [
                    TextSpan(
                      text: model.designation,
                      style: TextStyle(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w400,
                        color: AppColor.textColor.withOpacity(0.5),
                        fontStyle: FontStyle.italic,
                        fontFamily: 'space_grotesk',
                      ),
                    ),
                  ],
                  style: TextStyle(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w600,
                    color: AppColor.textColor,
                    fontFamily: 'space_grotesk',
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
