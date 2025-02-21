import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:portfolio/core/constants/app_constants.dart';
import 'package:portfolio/core/constants/portfolio_data.dart';
import 'package:portfolio/core/model/project_model.dart';
import 'package:portfolio/core/utilities/extensions.dart';
import 'package:portfolio/providers/nav_provider.dart';
import 'package:portfolio/providers/scroll_provider.dart';
import 'package:portfolio/widgets/desktop/project_item.dart';
import 'package:resize/resize.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

class Page4 extends ConsumerStatefulWidget {
  const Page4({super.key});

  @override
  ConsumerState<Page4> createState() => _Page4State();
}

class _Page4State extends ConsumerState<Page4>
    with SingleTickerProviderStateMixin {
  late final AnimationController animationController;
  late final List<ProjectModel> projects;

  bool hovering = false;
  double duration = 0;

  @override
  void initState() {
    projects = [
      projectsList.getByIdentifier('henchman'),
      projectsList.getByIdentifier('illness-lab'),
      projectsList.getByIdentifier('med-tourism-co'),
    ];

    duration = projects.length * 200.0;

    animationController = AnimationController(
      vsync: this,
      duration: duration.milliseconds,
    );

    final listener = ref.read(positionListenerProvider);

    listener.itemPositions.addListener(() {
      ItemPosition? item;

      for (var position in listener.itemPositions.value) {
        if (position.index == projectsIndex) {
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
        Gap(30.sp),
        Text(
          'Projects',
          style: TextStyle(
            fontSize: 30.sp,
            fontWeight: FontWeight.w500,
          ),
        ),
        Gap(30.sp),
        SizedBox(
          width: context.width / 1.1,
          child: Wrap(
            runAlignment: WrapAlignment.start,
            alignment: WrapAlignment.spaceEvenly,
            runSpacing: 30.sp,
            children: buildChildren(),
          ),
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
                  projectsIndex,
                  force: true,
                ),
                child: Text(
                  'Prepped for a follow-up of my creative journey? ${hovering ? '🦾' : '📽️'}\n(Read More)',
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

  List<Widget> buildChildren() {
    final list = <Widget>[];
    final interval = (duration / projects.length).remap(0, duration, 0, 1);
    final releaseBefore = interval / projects.length;
    double sum = 0.0;

    for (var project in projects) {
      list.add(ProjectItem(
        project: project,
        begin: sum,
        end: sum + interval,
        animationController: animationController,
      ));
      sum += interval - releaseBefore;
    }

    return list;
  }
}
