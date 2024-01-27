import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:portfolio/core/constants/color_constants.dart';
import 'package:portfolio/core/data/model.dart';
import 'package:resize/resize.dart';
import 'package:url_launcher/url_launcher_string.dart';

class DataItem extends StatefulWidget {
  const DataItem({
    super.key,
    required this.model,
    this.showSkill = false,
    this.color = AppColor.primary,
  });

  final Model model;

  final bool showSkill;

  final Color color;

  @override
  State<DataItem> createState() => _DataItemState();
}

class _DataItemState extends State<DataItem> {
  bool hover = false;

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: InkWell(
        onHover: (hovering) => setState(() => hover = hovering),
        splashColor: Colors.transparent,
        onTap: () =>
            widget.model.link == "" ? null : launchUrlString(widget.model.link),
        child: AnimatedContainer(
          duration: 100.milliseconds,
          width: screenSize.width / 2.4,
          padding: EdgeInsets.all(10.sp),
          decoration: BoxDecoration(
            color: AppColor.box,
            borderRadius: BorderRadius.circular(10.sp),
            boxShadow: hover
                ? [
                    BoxShadow(
                      color: widget.color,
                      spreadRadius: 1.sp,
                      blurRadius: 30.sp,
                    ),
                  ]
                : [],
          ),
          alignment: Alignment.center,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 10.sp),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            widget.model.role,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                              color: AppColor.textColor,
                              fontSize: 25.sp,
                            ),
                          ),
                          Gap(5.sp),
                          Text(
                            widget.model.name,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontWeight: FontWeight.w400,
                              color: AppColor.textColor.withOpacity(0.8),
                              fontSize: 20.sp,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          widget.model.location,
                          style: TextStyle(
                            fontWeight: FontWeight.w400,
                            color: AppColor.textColor.withOpacity(0.6),
                            fontSize: 18.sp,
                          ),
                        ),
                        Gap(5.sp),
                        Text(
                          '${DateFormat('MMMM yyyy').format(widget.model.from)} - ${DateFormat('MMMM yyyy').format(widget.model.to)}',
                          style: TextStyle(
                            fontWeight: FontWeight.w400,
                            color: AppColor.textColor.withOpacity(0.6),
                            fontSize: 15.sp,
                            fontStyle: FontStyle.italic,
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
              Html(
                data: '<p style="font-size:${20.sp};text-align: center">'
                    '${widget.model.description.join('<br><br>')}'
                    '</p>',
              ),
              if (widget.showSkill)
                SizedBox(
                  width: (screenSize.width / 2.4) * 2.5 / 3,
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
      ),
    );
  }

  List<Widget> buildChildren() {
    final list = <Widget>[];

    for (var item in widget.model.skills) {
      list.add(Container(
        height: 40.sp,
        padding: EdgeInsets.symmetric(
          horizontal: 10.sp,
          vertical: 5.sp,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25.sp),
          color: AppColor.secondary.withOpacity(0.5),
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
