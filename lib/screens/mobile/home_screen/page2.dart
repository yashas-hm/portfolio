import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:portfolio/core/constants/app_constants.dart';
import 'package:portfolio/core/constants/portfolio_data.dart';
import 'package:portfolio/core/utilities/extensions.dart';
import 'package:portfolio/providers/nav_provider.dart';
import 'package:resize/resize.dart';

class Page2 extends ConsumerWidget {
  const Page2({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Gap(15.sp),
        Text(
          'About Me',
          style: TextStyle(
            fontSize: 18.sp,
            fontWeight: FontWeight.w500,
          ),
        ),
        Gap(15.sp),
        Container(
          width: context.width / 1.2,
          padding: EdgeInsets.symmetric(
            horizontal: 15.sp,
            vertical: 10.sp,
          ),
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.secondary,
            borderRadius: BorderRadius.circular(13.sp),
          ),
          alignment: Alignment.center,
          child: AutoSizeText(
            aboutBrief,
            textAlign: TextAlign.justify,
            style: TextStyle(
              fontSize: 12.sp,
            ),
          ),
        ),
        Gap(15.sp),
        RichText(
          text: TextSpan(
            text: 'Times I put the ',
            children: [
              TextSpan(
                text: '"Leader Hat"',
                style: TextStyle(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w800,
                  color: Theme.of(context).colorScheme.primary,
                  fontFamily: 'space_grotesk',
                ),
              ),
              TextSpan(
                text: '!',
                style: TextStyle(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w500,
                  color: Theme.of(context).colorScheme.tertiary,
                  fontFamily: 'space_grotesk',
                ),
              ),
            ],
            style: TextStyle(
              fontSize: 14.sp,
              fontWeight: FontWeight.w500,
              color: Theme.of(context).colorScheme.tertiary,
              fontFamily: 'space_grotesk',
            ),
          ),
        ),
        Gap(15.sp),
        ...buildChildren(
          context,
        ),
        Gap(15.sp),
        GestureDetector(
          onTap: () => updateIndex(
            context,
            ref,
            aboutIndex,
            force: true,
          ),
          child: SizedBox(
            width: context.width / 1.2,
            child: Text(
              'Care to indulge me in another round of self-glorification? 🤔\n(Read More)',
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

  List<Widget> buildChildren(BuildContext context) {
    final list = <Widget>[];

    for (var index = 0; index < porList.length; index++) {
      list.add(Container(
        width: context.width / 1.2,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(13.sp),
          color: Theme.of(context).colorScheme.secondary,
        ),
        padding: EdgeInsets.symmetric(
          horizontal: 15.sp,
          vertical: 10.sp,
        ),
        alignment: Alignment.center,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              porList[index].designation,
              style: TextStyle(
                fontSize: 16.sp,
                fontWeight: FontWeight.w600,
                color: Theme.of(context).colorScheme.primary,
              ),
            ),
            Text(
              porList[index].referer,
              style: TextStyle(
                fontSize: 14.sp,
                fontWeight: FontWeight.w400,
              ),
            ),
            Gap(15.sp),
            Text(
              porList[index].description,
              textAlign: TextAlign.justify,
              style: TextStyle(
                fontSize: 12.sp,
                fontWeight: FontWeight.w400,
              ),
            ),
          ],
        ),
      ));

      if (index != porList.length - 1) {
        list.add(Gap(15.sp));
      }
    }

    return list;
  }
}
