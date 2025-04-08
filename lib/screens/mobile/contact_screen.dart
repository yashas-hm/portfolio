import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:portfolio/core/constants/color_constants.dart';
import 'package:portfolio/core/utilities/dialog_utils.dart';
import 'package:portfolio/core/utilities/extensions.dart';
import 'package:portfolio/core/utilities/utils.dart';
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
    return Container(
      width: context.width / 1.2,
      height: context.height / 1.175,
      alignment: Alignment.center,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Gap(15.sp),
          Text(
            'Contact Me',
            style: TextStyle(
              fontSize: 20.sp,
              fontWeight: FontWeight.w500,
            ),
          ),
          Gap(15.sp),
          SizedBox(
            width: context.width / 1.2,
            child: TextField(
              controller: emailCtr,
              style: TextStyle(
                fontSize: 12.sp,
              ),
              textAlign: TextAlign.left,
              decoration: InputDecoration(
                hintText: 'Ready for a witty email exchange?',
                hintStyle: TextStyle(
                  color: Theme.of(context)
                      .colorScheme
                      .tertiary
                      .withValues(alpha: 0.5),
                  fontSize: 12.sp,
                ),
                counterText: '',
                border: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Theme.of(context).colorScheme.tertiary,
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
                    color: Theme.of(context).colorScheme.tertiary,
                    width: 1.sp,
                  ),
                  borderRadius: BorderRadius.circular(13.sp),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Theme.of(context).colorScheme.primary,
                    width: 1.sp,
                  ),
                  borderRadius: BorderRadius.circular(13.sp),
                ),
                contentPadding: EdgeInsets.symmetric(horizontal: 15.sp),
                fillColor: Theme.of(context).colorScheme.secondary,
                filled: true,
                errorText: emailError ? 'Invalid email' : null,
                errorStyle: const TextStyle(color: Colors.redAccent),
              ),
              maxLines: 1,
              maxLength: 100,
              keyboardType: TextInputType.emailAddress,
              cursorColor: Theme.of(context).colorScheme.tertiary,
            ),
          ),
          Gap(15.sp),
          SizedBox(
            width: context.width / 1.2,
            child: TextField(
              controller: textCtr,
              style: TextStyle(
                fontSize: 12.sp,
              ),
              decoration: InputDecoration(
                hintText:
                    'Let\'s give your keyboard a workout. What\'s on your mind?',
                hintStyle: TextStyle(
                  color: Theme.of(context)
                      .colorScheme
                      .tertiary
                      .withValues(alpha: 0.5),
                  fontSize: 12.sp,
                ),
                counterText: '',
                border: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Theme.of(context).colorScheme.tertiary,
                    width: 1.sp,
                  ),
                  borderRadius: BorderRadius.circular(13.sp),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Theme.of(context).colorScheme.tertiary,
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
                    color: Theme.of(context).colorScheme.primary,
                    width: 1.sp,
                  ),
                  borderRadius: BorderRadius.circular(13.sp),
                ),
                contentPadding: EdgeInsets.all(15.sp),
                fillColor: Theme.of(context).colorScheme.secondary,
                filled: true,
                errorText: textError ? 'Please enter your message' : null,
                errorStyle: const TextStyle(color: Colors.redAccent),
              ),
              maxLines: 10,
              keyboardType: TextInputType.multiline,
              cursorColor: Theme.of(context).colorScheme.tertiary,
            ),
          ),
          Gap(15.sp),
          GestureDetector(
            onTap: () async {
              setState(() {
                loading = true;
              });

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
                final response = await sendMessage(
                  email: emailCtr.text.trim(),
                  text: textCtr.text.trim(),
                );

                if (response.$1) {
                  setState(() {
                    emailCtr.clear();
                    textCtr.clear();
                  });
                }

                if (context.mounted) {
                  showToast(context, response.$2);
                }
              }

              setState(() {
                loading = false;
              });
            },
            child: Container(
              height: 40.sp,
              width: context.width / 3,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(13.sp),
                color: Theme.of(context).colorScheme.primary,
              ),
              alignment: Alignment.center,
              child: loading
                  ? SizedBox(
                      height: 20.sp,
                      width: 20.sp,
                      child: const CircularProgressIndicator(
                        color: darkText,
                      ),
                    )
                  : Text(
                      'Tap to Transmit!',
                      style: TextStyle(
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w500,
                        color: darkText,
                      ),
                    ),
            ),
          ),
          Gap(15.sp),
        ],
      ),
    );
  }
}
