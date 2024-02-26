import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get_utils/get_utils.dart';
import 'package:portfolio/core/constants/color_constants.dart';
import 'package:portfolio/core/helpers/app_helpers.dart';
import 'package:portfolio/core/helpers/dialog_helper.dart';
import 'package:resize/resize.dart';

class ContactScreen extends StatefulWidget {
  const ContactScreen({super.key});

  @override
  State<ContactScreen> createState() => _ContactScreenState();
}

class _ContactScreenState extends State<ContactScreen> {
  bool loading = false;
  bool emailError = false;
  bool textError = false;

  final TextEditingController emailCtr = TextEditingController();
  final TextEditingController textCtr = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

    return Container(
      height: screenSize.height,
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
              controller: emailCtr,
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
                  errorBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.redAccent,
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
                  errorText: emailError ? 'Invalid email' : null),
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
              controller: textCtr,
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
                  errorBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.redAccent,
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
                  errorText: textError ? 'Please enter your message' : null),
              maxLines: 10,
              keyboardType: TextInputType.multiline,
              cursorColor: AppColor.textColor,
            ),
          ),
          Gap(30.sp),
          MouseRegion(
            opaque: false,
            cursor: SystemMouseCursors.click,
            child: GestureDetector(
              onTap: () async {
                setState(() {
                  loading = true;
                });

                emailCtr.text = 'yashashm@gmail.com';
                textCtr.text =
                'This is a test message to test the delivery of this mail.';

                if (!emailCtr.text.isEmail) {
                  setState(() {
                    emailError = true;
                  });
                } else if (emailError) {
                  setState(() {
                    emailError = false;
                  });
                }

                if (textCtr.text.isEmpty) {
                  setState(() {
                    textError = true;
                  });
                } else if (textError) {
                  setState(() {
                    textError = false;
                  });
                }

                if (!(emailError || textError)) {
                  final response = await AppHelper.sendMessage(
                    email: emailCtr.text.trim(),
                    text: textCtr.text.trim(),
                  );

                  if (response.$1) {
                    setState(() {
                      emailCtr.clear();
                      textCtr.clear();
                    });
                  }

                  DialogHelper.showToast(response.$2, screenSize);
                }

                setState(() {
                  loading = false;
                });
              },
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
          ),
          Gap(30.sp),
        ],
      ),
    );
  }
}
