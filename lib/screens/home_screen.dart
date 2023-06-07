import 'package:flutter/material.dart';
import 'package:portfolio/core/constants/color_constants.dart';
import 'package:portfolio/core/data/data.dart';
import 'package:portfolio/widgets/bottom_bar.dart';
import 'package:portfolio/widgets/landing_sliver.dart';
import 'package:portfolio/widgets/model_item.dart';
import 'package:portfolio/widgets/more_button.dart';
import 'package:portfolio/widgets/rain.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final ScrollController scrollController = ScrollController();
  bool more = true;

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) => {
          if (scrollController.initialScrollOffset >=
              scrollController.position.maxScrollExtent)
            {
              setState(() {
                more = false;
              })
            }
        });

    scrollController.addListener(() {
      if (scrollController.offset >=
          scrollController.position.maxScrollExtent) {
        setState(() {
          more = false;
        });
      } else {
        setState(() {
          more = true;
        });
      }
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: AppColor.bgDark,
      body: ParallaxRain(
        dropColors: const [
          AppColor.primaryLight,
          AppColor.secondary,
        ],
        child: SizedBox(
          width: screenSize.width,
          height: screenSize.height,
          child: Stack(
            children: [
              CustomScrollView(
                controller: scrollController,
                physics: const BouncingScrollPhysics(),
                slivers: [
                  const LandingSliver(),
                  SliverList(
                    delegate: SliverChildBuilderDelegate(
                      childCount: Data.highlights.length,
                      (ctx, index) => ModelItem(
                        item: Data.highlights[index],
                        inverted: index%2!=0,
                      ),
                    ),
                  ),
                  const SliverToBoxAdapter(
                    child: BottomBar(),
                  ),
                ],
              ),
              Visibility(
                visible: more,
                child: MoreButton(
                  scrollController: scrollController,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
