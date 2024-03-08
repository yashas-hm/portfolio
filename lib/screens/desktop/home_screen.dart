import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:portfolio/providers/nav_provider.dart';
import 'package:portfolio/providers/scroll_provider.dart';import 'package:portfolio/screens/desktop/home_screen/page1.dart';
import 'package:portfolio/screens/desktop/home_screen/page2.dart';
import 'package:portfolio/screens/desktop/home_screen/page3.dart';
import 'package:portfolio/screens/desktop/home_screen/page4.dart';
import 'package:portfolio/screens/desktop/home_screen/page5.dart';
import 'package:portfolio/widgets/bottom_bar.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  final pages = [
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

    SchedulerBinding.instance.addPostFrameCallback((_) {
      controller.update((state) => ItemScrollController());
      listener.update((state) => ItemPositionsListener.create());
    });

    return MouseRegion(
      opaque: false,
      child: SizedBox(
        height: MediaQuery.of(context).size.height,
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
      ),
    );
  }
}
