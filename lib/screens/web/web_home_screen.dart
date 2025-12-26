import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:portfolio/components/skills/skills_component.dart';
import 'package:portfolio/constants/constants.dart' show KnownColors;
import 'package:portfolio/constants/portfolio_constants.dart';
import 'package:portfolio/constants/portfolio_data.dart';
import 'package:portfolio/model/testimonial_model.dart';
import 'package:portfolio/providers/nav_provider.dart';
import 'package:portfolio/providers/scroll_provider.dart';
import 'package:portfolio/utilities/dialog_utils.dart';
import 'package:portfolio/utilities/extensions.dart';
import 'package:portfolio/utilities/utils.dart';
import 'package:portfolio/widgets/bottom_bar.dart';
import 'package:portfolio/widgets/web/web_experience_item.dart';
import 'package:portfolio/widgets/web/web_home_name.dart';
import 'package:portfolio/widgets/web/web_project_item.dart';
import 'package:portfolio/widgets/web/web_skill_box.dart';
import 'package:resize/resize.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

part 'home_screen/page1.dart';
part 'home_screen/page2.dart';
part 'home_screen/page3.dart';
part 'home_screen/page4.dart';
part 'home_screen/page5.dart';

class WebHomeScreen extends ConsumerStatefulWidget {
  const WebHomeScreen({super.key});

  @override
  ConsumerState<WebHomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<WebHomeScreen> {
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
      final currentValue = ref.read(currentIndexProvider);
      if (item.last.itemLeadingEdge <= 0.5 && currentValue != item.last.index) {
        ref.read(currentIndexProvider.notifier).set(item.last.index);
      } else if (item.last.itemLeadingEdge > 0.7 &&
          currentValue != item.toList()[item.length - 2].index) {
        ref
            .read(currentIndexProvider.notifier)
            .set(item.toList()[item.length - 2].index);
      }
    });

    super.initState();
  }

  @override
  void dispose() {
    final listener = ref.read(positionListenerProvider);
    listener.itemPositions.removeListener(() {});
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final controller = ref.read(scrollControllerProvider);
    final listener = ref.read(positionListenerProvider);

    return SizedBox(
      height: context.height,
      child: ScrollablePositionedList.builder(
        shrinkWrap: true,
        itemScrollController: controller,
        itemPositionsListener: listener,
        physics: const BouncingScrollPhysics(
          parent: AlwaysScrollableScrollPhysics(),
        ),
        itemCount: pages.length,
        itemBuilder: (ctx, index) => pages[index],
      ),
    );
  }
}
