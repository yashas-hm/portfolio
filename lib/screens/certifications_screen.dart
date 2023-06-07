import 'package:flutter/material.dart';
import 'package:portfolio/core/constants/color_constants.dart';
import 'package:portfolio/core/data/data.dart';
import 'package:portfolio/widgets/appbar.dart';
import 'package:portfolio/widgets/bottom_bar.dart';
import 'package:portfolio/widgets/model_item.dart';
import 'package:portfolio/widgets/more_button.dart';
import 'package:portfolio/widgets/rain.dart';

class CertificationsScreen extends StatefulWidget {
  const CertificationsScreen({super.key});

  @override
  State<CertificationsScreen> createState() => _CertificationsScreenState();
}

class _CertificationsScreenState extends State<CertificationsScreen> {
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
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: CustomAppbar.appbar(context, 5),
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
              SingleChildScrollView(
                controller: scrollController,
                physics: const BouncingScrollPhysics(),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    if (Data.certifications.isNotEmpty)
                      ListView.builder(
                        shrinkWrap: true,
                        physics: const BouncingScrollPhysics(),
                        itemCount: Data.certifications.length,
                        itemBuilder: (ctx, index) => ModelItem(
                          item: Data.certifications[index],
                          inverted: index % 2 != 0,
                        ),
                      ),
                    const BottomBar(),
                  ],
                ),
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
