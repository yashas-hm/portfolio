import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:portfolio/core/constants/app_constants.dart';
import 'package:portfolio/core/constants/portfolio_data.dart';
import 'package:portfolio/core/model/project_model.dart';
import 'package:portfolio/core/utilities/extensions.dart';
import 'package:portfolio/providers/nav_provider.dart';
import 'package:portfolio/providers/scroll_provider.dart';
import 'package:portfolio/widgets/mobile/project_item.dart';
import 'package:resize/resize.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

class Page4 extends ConsumerStatefulWidget {
  const Page4({super.key});

  @override
  ConsumerState<Page4> createState() => _Page4State();
}

class _Page4State extends ConsumerState<Page4>
    with SingleTickerProviderStateMixin {
  final List<ProjectModel> projects = [
    projectsList.getByIdentifier('henchman'),
    projectsList.getByIdentifier('illness-lab'),
    projectsList.getByIdentifier('med-tourism-co'),
    projectsList.getByIdentifier('asl'),
  ];
  late final AnimationController animationController;

  bool hovering = false;
  double duration = 0;

  @override
  void initState() {
    duration = projects.length * 300.0;

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
          !animationController.isAnimating&& mounted) {
        animationController.forward();
      } else if (item != null && item.itemLeadingEdge > 0.7&& mounted) {
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
          'Projects',
          style: TextStyle(
            fontSize: 20.sp,
            fontWeight: FontWeight.w500,
          ),
        ),
        Gap(15.sp),
        SizedBox(
          width: context.width / 1.1,
          child: GridView(
            padding: EdgeInsets.zero,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 15.sp,
              crossAxisSpacing: 15.sp,
              childAspectRatio: 0.6,
            ),
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            children: buildChildren(),
          ),
        ),
        Gap(15.sp),
        SizedBox(
          width: context.width / 1.2,
          child: GestureDetector(
            onTap: () => updateIndex(
              context,
              ref,
              projectsIndex,
              force: true,
            ),
            child: Text(
              'Prepped for a follow-up of my creative journey? 🦾\n(Read More)',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 12.sp,
                color: Theme.of(context).colorScheme.tertiary,
              ),
            ),
          ),
        ),
      ],
    );
  }

  List<Widget> buildChildren() {
    final list = <Widget>[];
    double interval =
        (duration / projects.length).remap(0, duration, 0, 1).toDouble();
    double begin = 0;

    for (var data in projects) {
      list.add(ProjectItem(
        project: data,
        begin: begin,
        end: begin + interval,
        animationController: animationController,
      ));
      begin += interval * 3 / 4;
    }
    return list;
  }
}
