import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:gap/gap.dart';
import 'package:intl/intl.dart';
import 'package:portfolio/core/constants/color_constants.dart';
import 'package:portfolio/core/model/model.dart';
import 'package:resize/resize.dart';
import 'package:url_launcher/url_launcher_string.dart';

class DataItem extends StatelessWidget {
  const DataItem({
    super.key,
    required this.model,
    this.showSkill = false,
  });

  final Model model;

  final bool showSkill;

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

    return GestureDetector(
      onTap: () => launchUrlString(model.link),
      child: Container(
        width: screenSize.width / 1.2,
        padding: EdgeInsets.all(10.sp),
        decoration: BoxDecoration(
          color: AppColor.box,
          borderRadius: BorderRadius.circular(10.sp),
        ),
        alignment: Alignment.center,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Gap(30.sp),
            Text(
              model.role,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontWeight: FontWeight.w500,
                color: AppColor.textColor,
                fontSize: 25.sp,
              ),
            ),
            Gap(5.sp),
            Text(
              model.name,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontWeight: FontWeight.w400,
                color: AppColor.textColor.withOpacity(0.8),
                fontSize: 20.sp,
              ),
            ),
            Gap(5.sp),
            Text(
              model.location,
              style: TextStyle(
                fontWeight: FontWeight.w400,
                color: AppColor.textColor.withOpacity(0.6),
                fontSize: 18.sp,
              ),
            ),
            Gap(5.sp),
            Text(
              '${DateFormat('MMMM yyyy').format(model.from)} - ${DateFormat('MMMM yyyy').format(model.from)}',
              style: TextStyle(
                fontWeight: FontWeight.w400,
                color: AppColor.textColor.withOpacity(0.6),
                fontSize: 15.sp,
                fontStyle: FontStyle.italic,
              ),
            ),
            Gap(5.sp),
            Html(
              data: '<p style="font-size:${18.sp};text-align: center">'
                  '${model.description.join('<br><br>')}'
                  '</p>',
            ),
            if (showSkill)
              SizedBox(
                width: (screenSize.width / 1.2) * 2.5 / 3,
                child: Wrap(
                  alignment: WrapAlignment.center,
                  runAlignment: WrapAlignment.center,
                  spacing: 10.sp,
                  runSpacing: 10.sp,
                  children: buildChildren(),
                ),
              ),
          ],
        ),
      ),
    );
  }

  List<Widget> buildChildren() {
    final list = <Widget>[];

    for (var item in model.skills) {
      list.add(Container(
        height: 40.sp,
        padding: EdgeInsets.symmetric(
          horizontal: 10.sp,
          vertical: 5.sp,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25.sp),
          color: AppColor.primary.withOpacity(0.5),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              item,
              style: TextStyle(
                fontSize: 16.sp,
                fontWeight: FontWeight.w400,
                color: AppColor.textColor,
              ),
            ),
          ],
        ),
      ));
    }

    return list;
  }
}
