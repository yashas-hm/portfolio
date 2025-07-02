part of '../home_screen.dart';

class Page3 extends ConsumerStatefulWidget {
  const Page3({super.key});

  @override
  ConsumerState<Page3> createState() => _Page3State();
}

class _Page3State extends ConsumerState<Page3>
    with SingleTickerProviderStateMixin {
  late final AnimationController animationController;
  late double duration;
  bool hovering = false;

  @override
  void initState() {
    duration = homeExperience.length * 500.0;

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
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Gap(30.sp),
        Text(
          'Experience',
          style: TextStyle(
            fontSize: 30.sp,
            fontWeight: FontWeight.w500,
          ),
        ),
        Gap(30.sp),
        ...childrenBuilder(),
        Gap(30.sp),
        StatefulBuilder(
          builder: (ctx, setState) {
            return MouseRegion(
              opaque: false,
              cursor: SystemMouseCursors.click,
              onEnter: (_) => setState(() => hovering = true),
              onExit: (_) => setState(() => hovering = false),
              child: GestureDetector(
                onTap: () => updateIndex(
                  context,
                  ref,
                  experienceIndex,
                  force: true,
                ),
                child: Text(
                  'Curious about the microcosm of my experiences? ${hovering ? '🧪' : '📈'}\n(Read More)',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 20.sp,
                    color: hovering
                        ? Theme.of(context).colorScheme.primary
                        : Theme.of(context).colorScheme.tertiary,
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
            color: Theme.of(context).colorScheme.tertiary,
          ),
        ),
        Gap(30.sp),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: buildTestimonials(),
        ),
      ],
    );
  }

  List<Widget> childrenBuilder() {
    final list = <Widget>[];
    final interval =
        (duration / homeExperience.length).remap(0, duration, 0, 1).toDouble();
    final releaseBefore = interval / homeExperience.length;
    double sum = 0.0;

    for (var index = 0; index < homeExperience.length; index++) {
      list.add(ExperienceItem(
        experience: homeExperience[index],
        begin: sum,
        end: sum + interval,
        reverse: index % 2 != 0,
        animationController: animationController,
      ));

      sum += interval - releaseBefore;
    }

    return list;
  }

  List<Widget> buildTestimonials() {
    final list = <Widget>[];

    for (var testimonial in testimonials) {
      list.add(Container(
        width: context.width / 3,
        height: context.height / 3.5,
        padding: EdgeInsets.symmetric(
          horizontal: 25.sp,
          vertical: 20.sp,
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
            Expanded(
              child: AutoSizeText(
                testimonial.description,
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
                          fontSize: 14.sp,
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
                      fontSize: 16.sp,
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
    }

    return list;
  }
}
