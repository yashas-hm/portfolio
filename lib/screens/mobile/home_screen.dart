import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:portfolio/core/constants/colors.dart';
import 'package:portfolio/core/constants/constants.dart';
import 'package:portfolio/core/constants/portfolio_data.dart';
import 'package:portfolio/core/utilities/dialog_utils.dart';
import 'package:portfolio/core/utilities/extensions.dart';
import 'package:portfolio/core/utilities/utils.dart';
import 'package:portfolio/providers/nav_provider.dart';
import 'package:portfolio/providers/scroll_provider.dart';
import 'package:portfolio/widgets/bottom_bar.dart';
import 'package:portfolio/widgets/mobile/experience_item.dart';
import 'package:portfolio/widgets/mobile/home_name.dart';
import 'package:portfolio/widgets/mobile/project_item.dart';
import 'package:portfolio/widgets/mobile/skill_box.dart';
import 'package:resize/resize.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

part 'home_screen/page1.dart';
part 'home_screen/page2.dart';
part 'home_screen/page3.dart';
part 'home_screen/page4.dart';
part 'home_screen/page5.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  final pages = <Widget>[
    const Page1(),
    const Page2(),
    const Page3(),
    const Page4(),
    const Page5(),
    const BottomBar(),
  ];

  @override
  void initState() {
    final listener = ref.read(positionListenerProvider);

    listener.itemPositions.addListener(() {
      final item = listener.itemPositions.value;
      final currentIndex = ref.read(currentIndexProvider.notifier);
      if (item.last.itemLeadingEdge <= 0.5 &&
          currentIndex.state != item.last.index) {
        currentIndex.state = item.last.index;
      } else if (item.last.itemLeadingEdge > 0.7 &&
          currentIndex.state != item.toList()[item.length - 2].index) {
        currentIndex.state = item.toList()[item.length - 2].index;
      }
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final controller = ref.read(scrollControllerProvider.notifier);
    final listener = ref.read(positionListenerProvider.notifier);

    return SizedBox(
      height: context.height,
      child: ScrollablePositionedList.builder(
        shrinkWrap: true,
        itemScrollController: controller.state,
        itemPositionsListener: listener.state,
        physics: const BouncingScrollPhysics(
          parent: AlwaysScrollableScrollPhysics(),
        ),
        itemCount: pages.length,
        itemBuilder: (ctx, index) => pages[index],
      ),
    );
  }
}
