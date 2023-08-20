import 'package:flutter/material.dart';
import 'package:portfolio/core/constants/app_constants.dart';
import 'package:portfolio/core/constants/color_constants.dart';
import 'package:portfolio/core/data/data.dart';
import 'package:portfolio/widgets/appbar.dart';
import 'package:portfolio/widgets/bottom_bar.dart';
import 'package:portfolio/widgets/model_item.dart';
import 'package:portfolio/widgets/more_button.dart';
import 'package:portfolio/widgets/rain.dart';
import 'package:portfolio/widgets/skills_item.dart';
import 'package:resize/resize.dart';

class AboutScreen extends StatefulWidget {
  const AboutScreen({super.key});

  @override
  State<AboutScreen> createState() => _AboutScreenState();
}

class _AboutScreenState extends State<AboutScreen> {
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
      appBar: CustomAppbar.appbar(context, 1),
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
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.start,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    SizedBox(
                      width: screenSize.width,
                      height: screenSize.height,
                      child: Center(
                        child: Container(
                          margin: EdgeInsets.only(
                            top: 100.sp,
                            right: screenSize.width / 10,
                            left: screenSize.width / 10,
                          ),
                          height: screenSize.height / 1.6,
                          width: screenSize.width,
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: AppColor.secondary,
                              width: 2.sp,
                            ),
                            borderRadius: BorderRadius.circular(28.sp),
                            color: AppColor.bgLight,
                          ),
                          padding: EdgeInsets.all(20.sp),
                          child: SingleChildScrollView(
                            child: SelectableText(
                              AppConstants.about,
                              style: TextStyle(
                                fontSize: 23.sp,
                                color: AppColor.bgDark,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    SkillsItem(
                      item: Data.software,
                      skillName: 'Proficiency',
                    ),
                    if (Data.por.isNotEmpty)
                      ListView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: Data.por.length,
                        itemBuilder: (ctx, index) => ModelItem(
                          item: Data.por[index],
                          inverted: index % 2 == 0,
                        ),
                      ),
                    ModelItem(
                      item: Data.techAchievements,
                    ),
                    SkillsItem(
                      item: Data.softSkills,
                      skillName: 'Soft Skills',
                      inverted: true,
                    ),
                    SkillsItem(
                      item: Data.projectSkills,
                      skillName: 'Project Skills',
                    ),
                    ModelItem(
                      item: Data.culAchievements,
                      inverted: true,
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
