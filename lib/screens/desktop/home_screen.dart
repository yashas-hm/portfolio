import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:portfolio/controller/nav_controller.dart';
import 'package:portfolio/screens/desktop/home_screen/page1.dart';
import 'package:portfolio/screens/desktop/home_screen/page2.dart';
import 'package:portfolio/screens/desktop/home_screen/page3.dart';
import 'package:portfolio/screens/desktop/home_screen/page4.dart';
import 'package:portfolio/screens/desktop/home_screen/page5.dart';
import 'package:portfolio/widgets/bottom_bar.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final ctr = Get.find<NavController>();

  final pages = [
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
    return MouseRegion(
      opaque: false,
      child: SizedBox(
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
      ),
    );
  }
}
