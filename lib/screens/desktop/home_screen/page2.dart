part of '../home_screen.dart';

class Page2 extends ConsumerStatefulWidget {
  const Page2({super.key});

  @override
  ConsumerState<Page2> createState() => _Page2State();
}

class _Page2State extends ConsumerState<Page2>
    with SingleTickerProviderStateMixin {
  late AnimationController animationController;

  @override
  void initState() {
    animationController = AnimationController(
      vsync: this,
      duration: 800.milliseconds,
    );

    final listener = ref.read(positionListenerProvider);

    listener.itemPositions.addListener(() {
      ItemPosition? item;

      for (var position in listener.itemPositions.value) {
        if (position.index == aboutIndex) {
          item = position;
        }
      }

      if (item != null &&
          item.itemLeadingEdge <= 0.5 &&
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
    bool hovering = false;

    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Gap(30.sp),
        Text(
          'About Me',
          style: TextStyle(
            fontSize: 30.sp,
            fontWeight: FontWeight.w500,
          ),
        ),
        Gap(30.sp),
        Container(
          width: context.width / 2,
          padding: EdgeInsets.symmetric(
            horizontal: 25.sp,
            vertical: 20.sp,
          ),
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.secondary,
            borderRadius: BorderRadius.circular(13.sp),
          ),
          alignment: Alignment.center,
          child: AutoSizeText(
            aboutBrief,
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
                  color: Theme.of(context).colorScheme.primary,
                  fontFamily: 'space_grotesk',
                ),
              ),
              TextSpan(
                text: '!',
                style: TextStyle(
                  fontSize: 23.sp,
                  fontWeight: FontWeight.w500,
                  color: Theme.of(context).colorScheme.tertiary,
                  fontFamily: 'space_grotesk',
                ),
              ),
            ],
            style: TextStyle(
              fontSize: 23.sp,
              fontWeight: FontWeight.w500,
              color: Theme.of(context).colorScheme.tertiary,
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
              porList.getByIdentifier('sac'),
              0,
              0.4,
            ),
            leaderShipBox(
              porList.getByIdentifier('gdsc'),
              0.3,
              0.7,
            ),
            leaderShipBox(
              porList.getByIdentifier('hackathon'),
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
                onTap: () => updateIndex(
                  context,
                  ref,
                  aboutIndex,
                  force: true,
                ),
                child: Text(
                  'Care to indulge me in another round of self-glorification? ${hovering ? '😁' : '🤔'}\n(Read More)',
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
      ],
    );
  }

  Widget leaderShipBox(
    TestimonialModel model,
    double begin,
    double end,
  ) {
    return FadeTransition(
      opacity: Tween<double>(
        begin: 0,
        end: 1,
      ).animate(
        CurvedAnimation(
          parent: animationController,
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
            parent: animationController,
            curve: Interval(
              begin,
              end,
              curve: Curves.easeIn,
            ),
          ),
        ),
        child: Container(
          width: context.width / 3.4,
          padding: EdgeInsets.symmetric(
            horizontal: 15.sp,
            vertical: 10.sp,
          ),
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.secondary,
            borderRadius: BorderRadius.circular(13.sp),
          ),
          alignment: Alignment.center,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                model.designation,
                style: TextStyle(
                  fontSize: 25.sp,
                  fontWeight: FontWeight.w600,
                  color: Theme.of(context).colorScheme.primary,
                ),
              ),
              Text(
                model.referer,
                style: TextStyle(
                  fontSize: 18.sp,
                  fontWeight: FontWeight.w400,
                ),
              ),
              Gap(15.sp),
              Text(
                model.description,
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
