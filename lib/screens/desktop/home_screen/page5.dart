import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:portfolio/core/constants/color_constants.dart';
import 'package:resize/resize.dart';

class Page5 extends StatefulWidget {
  const Page5({super.key});

  @override
  State<Page5> createState() => _Page5State();
}

class _Page5State extends State<Page5> {
  bool loading = false;
  String email = '';
  String message = '';

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

    return Container(
      height: screenSize.height / 1.1,
      alignment: Alignment.center,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            'Contact Me',
            style: TextStyle(
              fontSize: 30.sp,
              fontWeight: FontWeight.w500,
            ),
          ),
          Gap(30.sp),
          SizedBox(
            width: screenSize.width / 2.5,
            child: TextField(
              onChanged: (value) {},
              style: TextStyle(
                fontSize: 16.sp,
              ),
              decoration: InputDecoration(
                hintText: 'Ready for a witty email exchange? Let\'s dive in!',
                hintStyle: TextStyle(
                  color: AppColor.textColor.withOpacity(0.5),
                ),
                counterText: '',
                border: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: AppColor.textColor,
                    width: 1.sp,
                  ),
                  borderRadius: BorderRadius.circular(13.sp),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: AppColor.textColor,
                    width: 1.sp,
                  ),
                  borderRadius: BorderRadius.circular(13.sp),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: AppColor.secondary,
                    width: 1.sp,
                  ),
                  borderRadius: BorderRadius.circular(13.sp),
                ),
                contentPadding: EdgeInsets.symmetric(horizontal: 15.sp),
                fillColor: AppColor.box,
                filled: true,
              ),
              maxLines: 1,
              maxLength: 100,
              keyboardType: TextInputType.emailAddress,
              cursorColor: AppColor.textColor,
            ),
          ),
          Gap(30.sp),
          SizedBox(
            width: screenSize.width / 2.5,
            child: TextField(
              onChanged: (value) {},
              style: TextStyle(
                fontSize: 16.sp,
              ),
              decoration: InputDecoration(
                hintText:
                    'Let\'s give your keyboard a workout. What\'s on your mind?',
                hintStyle: TextStyle(
                  color: AppColor.textColor.withOpacity(0.5),
                ),
                counterText: '',
                border: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: AppColor.textColor,
                    width: 1.sp,
                  ),
                  borderRadius: BorderRadius.circular(13.sp),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: AppColor.textColor,
                    width: 1.sp,
                  ),
                  borderRadius: BorderRadius.circular(13.sp),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: AppColor.secondary,
                    width: 1.sp,
                  ),
                  borderRadius: BorderRadius.circular(13.sp),
                ),
                contentPadding: EdgeInsets.all(15.sp),
                fillColor: AppColor.box,
                filled: true,
              ),
              maxLines: 10,
              keyboardType: TextInputType.multiline,
              cursorColor: AppColor.textColor,
            ),
          ),
          Gap(30.sp),
          MouseRegion(
            opaque: false,
            cursor: SystemMouseCursors.click,
            child: Container(
              height: 50.sp,
              width: screenSize.width / 6,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(13.sp),
                color: AppColor.secondary,
              ),
              alignment: Alignment.center,
              child: loading
                  ? const CircularProgressIndicator(
                      color: AppColor.textColor,
                    )
                  : Text(
                      'Tap to Transmit!',
                      style: TextStyle(
                        fontSize: 18.sp,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
            ),
          ),
          Gap(30.sp),
        ],
      ),
    );
  }
}
