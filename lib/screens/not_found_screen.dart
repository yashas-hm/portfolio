import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:portfolio/constants/legacy_constants/portfolio_constants.dart';
import 'package:portfolio/constants/legacy_constants/portfolio_data.dart';
import 'package:portfolio/providers/nav_provider.dart';
import 'package:portfolio/utilities/extensions.dart';
import 'package:portfolio/utilities/utils.dart';
import 'package:portfolio/widgets/custom_scaffold.dart';
import 'package:resize/resize.dart';

class NotFoundScreen extends ConsumerWidget {
  const NotFoundScreen({
    super.key,
    this.title,
    this.description,
  });

  final String? title;
  final String? description;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    SchedulerBinding.instance.addPostFrameCallback((_) {
      indexCheck(navItems.length, ref);
    });

    return CustomScaffold(
      child: Container(
        padding: EdgeInsets.all(15.sp),
        height: context.height,
        width: context.width,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              title ?? '404',
              style: TextStyle(
                fontSize: context.isMobile ? 160.sp : 180.sp,
                fontWeight: FontWeight.w700,
              ),
            ),
            Text(
              description ??
                  'Oops! Looks like this page took a vacation without telling anyone.',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: context.isMobile ? 20.sp : 30.sp,
              ),
            ),
            Gap(10.sp),
            MouseRegion(
              cursor: SystemMouseCursors.click,
              child: GestureDetector(
                onTap: () => updateIndex(context, ref, homeIndex),
                child: Text(
                  'Try the homepage?',
                  style: TextStyle(
                    fontSize: context.isMobile ? 18.sp : 26.sp,
                    color: Theme.of(context).primaryColor,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
