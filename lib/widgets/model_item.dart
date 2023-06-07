import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:lottie/lottie.dart';
import 'package:portfolio/core/constants/app_constants.dart';
import 'package:portfolio/core/constants/color_constants.dart';
import 'package:portfolio/core/data/model.dart';
import 'package:resize/resize.dart';
import 'package:url_launcher/url_launcher_string.dart';

class ModelItem extends StatefulWidget {
  const ModelItem({
    Key? key,
    required this.item,
    this.inverted = false,
  }) : super(key: key);

  final Model item;
  final bool inverted;

  @override
  State<ModelItem> createState() => _ModelItemState();
}

class _ModelItemState extends State<ModelItem> {
  bool hover = false;

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

    return Container(
      height: screenSize.height - 100.sp,
      width: screenSize.width,
      margin: EdgeInsets.only(
        right: widget.inverted ? 0.sp : 80.sp,
        left: !widget.inverted ? 0.sp : 80.sp,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.max,
        children: widget.inverted
            ? body(screenSize).reversed.toList()
            : body(screenSize),
      ),
    );
  }

  List<Widget> body(Size screenSize) => [
        SizedBox(
          width: screenSize.height - 100.sp,
          height: screenSize.height,
          child: Stack(
            children: [
              Lottie.asset(
                AppConstants.bgAnim,
                width: screenSize.height * 2,
                height: screenSize.height * 2,
                fit: BoxFit.cover,
              ),
              Center(
                child: Container(
                  padding: EdgeInsets.all(10.sp),
                  width: screenSize.height / 2.8,
                  height: screenSize.height / 2.8,
                  alignment: Alignment.center,
                  child: Text(
                    widget.item.role,
                    textAlign: TextAlign.center,
                    softWrap: true,
                    maxLines: 5,
                    style: TextStyle(
                      fontSize: 55.sp,
                      color: AppColor.bgLight,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        Expanded(
          child: Container(
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
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              children: [
                SizedBox(
                  width: screenSize.width,
                  child: Text(
                    widget.item.name,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 50.sp,
                      color: AppColor.bgDark,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                SizedBox(
                  width: screenSize.width,
                  child: Text(
                    widget.item.location,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 40.sp,
                      color: AppColor.bgDark,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
                SizedBox(
                  width: screenSize.width,
                  child: Text(
                    widget.item.from == DateTime(3000)
                        ? DateFormat('MMMM yyyy').format(widget.item.to)
                        : checkPresent()
                            ? '${DateFormat('MMMM yyyy').format(widget.item.from)} - Present'
                            : '${DateFormat('MMMM yyyy').format(widget.item.from)} - ${DateFormat('MMMM yyyy').format(widget.item.to)}',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 30.sp,
                      color: AppColor.bgDark,
                      fontWeight: FontWeight.w300,
                      fontStyle: FontStyle.italic,
                    ),
                  ),
                ),
                SizedBox(
                  height: 30.sp,
                ),
                Expanded(
                  child: Container(
                    width: screenSize.width,
                    alignment: Alignment.topCenter,
                    margin: EdgeInsets.only(
                      left: 50.sp,
                      right: 20.sp,
                    ),
                    child: widget.item.description.isNotEmpty
                        ? ListView.builder(
                            itemCount: widget.item.description.length,
                            itemBuilder: (ctx, index) => Row(
                              children: [
                                Text(
                                  '●',
                                  textAlign: TextAlign.left,
                                  style: TextStyle(
                                    fontSize: 20.sp,
                                    color: AppColor.bgDark,
                                    fontWeight: FontWeight.w300,
                                  ),
                                ),
                                SizedBox(
                                  width: 20.sp,
                                ),
                                Expanded(
                                  child: SizedBox(
                                    child: Text(
                                      widget.item.description[index],
                                      textAlign: TextAlign.left,
                                      style: TextStyle(
                                        fontSize: 30.sp,
                                        color: AppColor.bgDark,
                                        fontWeight: FontWeight.normal,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          )
                        : null,
                  ),
                ),
                SizedBox(
                  height: 40.sp,
                ),
                if (widget.item.skills.isNotEmpty)
                  Container(
                    width: screenSize.width,
                    margin: EdgeInsets.only(
                      left: 50.sp,
                    ),
                    child: RichText(
                      text: TextSpan(
                        text: 'Skills: ',
                        style: TextStyle(
                          fontSize: 30.sp,
                          color: AppColor.bgDark,
                          fontWeight: FontWeight.bold,
                        ),
                        children: [
                          TextSpan(
                            text: widget.item.skills.join(', '),
                            style: TextStyle(
                              fontSize: 30.sp,
                              color: AppColor.bgDark,
                              fontWeight: FontWeight.normal,
                              fontStyle: FontStyle.italic,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                if (widget.item.link != '')
                  Container(
                    alignment: Alignment.bottomCenter,
                    child: MouseRegion(
                      onEnter: (_) {
                        setState(() {
                          hover = true;
                        });
                      },
                      onExit: (_) {
                        setState(() {
                          hover = false;
                        });
                      },
                      child: GestureDetector(
                        onTap: () async =>
                            await launchUrlString(widget.item.link),
                        child: Text(
                          '${widget.item.linkName} →',
                          style: TextStyle(
                            fontSize: 40.sp,
                            color:
                                hover ? AppColor.primaryDark : AppColor.bgDark,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
              ],
            ),
          ),
        ),
      ];

  bool checkPresent() {
    return widget.item.to.compareTo(DateTime.now()) == 1;
  }
}
