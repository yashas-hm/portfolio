part of '../bottom_bar.dart';

class WebBottomBar extends StatelessWidget {
  const WebBottomBar({
    super.key,
    required this.noConnection,
  });

  final bool noConnection;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: context.width,
      color: Theme.of(context).colorScheme.secondary,
      padding: EdgeInsets.symmetric(
        horizontal: 25.sp,
        vertical: 15.sp,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.max,
                children: [
                  bottomBarConnection(
                    context,
                    asset: location,
                    text: 'Chapel Hill, NC, USA',
                    onTap: () {},
                  ),
                  Gap(15.sp),
                  bottomBarConnection(
                    context,
                    asset: mail,
                    text: 'Mail Me',
                    onTap: () => launchUrl(Uri.parse('mailto:$emailId')),
                  ),
                  Gap(15.sp),
                  bottomBarConnection(
                    context,
                    asset: '',
                    text: 'My Resume',
                    onTap: () => launchUrlString(resumeLink),
                  ),
                ],
              ),
              Expanded(child: Container()),
              if (!noConnection)
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    bottomBarSocial(
                      context,
                      icon: github,
                      link: githubLink,
                      text: 'GitHub',
                    ),
                    Gap(15.sp),
                    bottomBarSocial(
                      context,
                      icon: linkedin,
                      link: linkedinLink,
                      text: 'LinkedIn',
                    ),
                    Gap(15.sp),
                    bottomBarSocial(
                      context,
                      icon: instagram,
                      link: instaLink,
                      text: 'Instagram',
                    ),
                  ],
                ),
            ],
          ),
          Gap(30.sp),
          Text(
            'Built with ❤️ by Yashas H Majmudar',
            style: TextStyle(
              color: Theme.of(context).colorScheme.tertiary,
              fontSize: 18.sp,
              fontWeight: FontWeight.w400,
            ),
          ),
        ],
      ),
    );
  }

  Widget bottomBarSocial(
    BuildContext context, {
    required String icon,
    required String link,
    required String text,
  }) =>
      MouseRegion(
        opaque: false,
        cursor: SystemMouseCursors.click,
        child: GestureDetector(
          onTap: () => launchUrlString(link),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SvgPicture.asset(
                icon,
                height: 25.sp,
                width: 25.sp,
              ),
              Gap(10.sp),
              Text(
                text,
                style: TextStyle(
                  color: Theme.of(context).colorScheme.tertiary,
                  fontSize: 18.sp,
                  fontWeight: FontWeight.w300,
                  decoration: TextDecoration.underline,
                  decorationStyle: TextDecorationStyle.solid,
                  decorationColor: Theme.of(context).colorScheme.tertiary,
                ),
              ),
            ],
          ),
        ),
      );

  Widget bottomBarConnection(
    BuildContext context, {
    required String asset,
    required String text,
    required Function() onTap,
  }) =>
      MouseRegion(
        opaque: false,
        cursor: SystemMouseCursors.click,
        child: GestureDetector(
          onTap: onTap,
          child: Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SvgPicture.asset(
                asset,
                height: 20.sp,
                width: 20.sp,
                colorFilter: ColorFilter.mode(
                  Theme.of(context).colorScheme.tertiary,
                  BlendMode.srcIn,
                ),
              ),
              Gap(10.sp),
              Text(
                text,
                style: TextStyle(
                  color: Theme.of(context).colorScheme.tertiary,
                  fontSize: 18.sp,
                  fontWeight: FontWeight.w300,
                ),
              ),
            ],
          ),
        ),
      );
}
