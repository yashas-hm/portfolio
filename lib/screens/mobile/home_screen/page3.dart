import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:portfolio/core/constants/app_constants.dart';
import 'package:portfolio/core/constants/portfolio_data.dart';
import 'package:portfolio/core/utilities/extensions.dart';
import 'package:portfolio/providers/nav_provider.dart';
import 'package:portfolio/providers/scroll_provider.dart';
import 'package:portfolio/widgets/mobile/experience_item.dart';
import 'package:resize/resize.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

class Page3 extends ConsumerStatefulWidget {
  const Page3({super.key});

  @override
  ConsumerState<Page3> createState() => _Page3State();
}

class _Page3State extends ConsumerState<Page3>
    with SingleTickerProviderStateMixin {
  late final AnimationController animationController;

  double duration = 0;
  final experiences = [
    experienceList.getByIdentifier('pb'),
    experienceList.getByIdentifier('internships'),
  ];

  @override
  void initState() {
    duration = experiences.length * 500;

    animationController = AnimationController(
      vsync: this,
      duration: duration.milliseconds,
    );

    final listener = ref.read(positionListenerProvider);

    listener.itemPositions.addListener(() {
      ItemPosition? item;

      for (var position in listener.itemPositions.value) {
        if (position.index == experienceIndex) {
          item = position;
        }
      }

      if (item != null &&
          item.itemLeadingEdge <= 0.7 &&
          !animationController.isAnimating &&
          mounted) {
        animationController.forward();
      } else if (item != null && item.itemLeadingEdge > 0.7 && mounted) {
        animationController.reverse();
      }
    });
    super.initState();
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Gap(15.sp),
        Text(
          'Experience',
          style: TextStyle(
            fontSize: 18.sp,
            fontWeight: FontWeight.w500,
          ),
        ),
        Gap(15.sp),
        ...buildExperiences(),
        Gap(15.sp),
        GestureDetector(
          onTap: () => updateIndex(
            context,
            ref,
            experienceIndex,
            force: true,
          ),
          child: SizedBox(
            width: context.width / 1.2,
            child: Text(
              'Curious about the microcosm of my experiences?🧪\n(Read More)',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 12.sp,
                color: Theme.of(context).colorScheme.tertiary,
              ),
            ),
          ),
        ),
        Gap(15.sp),
        Text(
          'Testimonials',
          style: TextStyle(
            fontSize: 18.sp,
          ),
        ),
        Gap(15.sp),
        ...buildTestimonials(),
      ],
    );
  }

  List<Widget> buildTestimonials() {
    final list = <Widget>[];

    for (var index = 0; index < testimonials.length; index++) {
      final testimonial = testimonials[index];
      list.add(Container(
        width: context.width / 1.2,
        padding: EdgeInsets.symmetric(
          horizontal: 15.sp,
          vertical: 10.sp,
        ),
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.secondary,
          borderRadius: BorderRadius.circular(13.sp),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              testimonial.description,
              textAlign: TextAlign.justify,
              style: TextStyle(
                fontSize: 12.sp,
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
                  width: 10.sp,
                  margin: EdgeInsets.only(top: 8.sp),
                  color: Theme.of(context).colorScheme.primary,
                ),
                Gap(10.sp),
                RichText(
                  text: TextSpan(
                    text: '${testimonial.referer}\n',
                    children: [
                      TextSpan(
                        text: testimonial.designation,
                        style: TextStyle(
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w400,
                          color: Theme.of(context)
                              .colorScheme
                              .tertiary
                              .withValues(alpha: 0.5),
                          fontStyle: FontStyle.italic,
                          fontFamily: 'space_grotesk',
                        ),
                      ),
                    ],
                    style: TextStyle(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w600,
                      color: Theme.of(context).colorScheme.tertiary,
                      fontFamily: 'space_grotesk',
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ));
      if (index != testimonials.length - 1) {
        list.add(Gap(15.sp));
      }
    }

    return list;
  }

  List<Widget> buildExperiences() {
    final list = <Widget>[];
    double begin = 0;
    double interval =
        (duration / experiences.length).remap(0, duration, 0, 1).toDouble();

    for (var experience in experiences) {
      list.add(ExperienceItem(
        experience: experience,
        begin: begin,
        end: begin + interval,
        animationController: animationController,
      ));

      begin += interval - (interval / 4);
    }

    return list;
  }
}
