part of '../bottom_bar.dart';

class MobileBottomBar extends StatelessWidget {
  const MobileBottomBar({
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
        horizontal: 10.sp,
        vertical: 15.sp,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
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
                  Gap(10.sp),
                  bottomBarConnection(
                    context,
                    asset: mail,
                    text: 'Mail Me',
                    onTap: () => launchUrl(Uri.parse('mailto:$emailId')),
                  ),
                  Gap(10.sp),
                  bottomBarConnection(
                    context,
                    asset: cv,
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
                    Gap(10.sp),
                    bottomBarSocial(
                      context,
                      icon: linkedin,
                      link: linkedinLink,
                      text: 'LinkedIn',
                    ),
                    Gap(10.sp),
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
          Gap(15.sp),
          Text(
            'Built with ❤️ by Yashas H Majmudar',
            style: TextStyle(
              color: Theme.of(context).colorScheme.tertiary,
              fontSize: 12.sp,
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
                height: 15.sp,
                width: 15.sp,
              ),
              Gap(5.sp),
              Text(
                text,
                style: TextStyle(
                  color: Theme.of(context).colorScheme.tertiary,
                  fontSize: 12.sp,
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
                height: 15.sp,
                width: 15.sp,
                colorFilter: ColorFilter.mode(
                  Theme.of(context).colorScheme.tertiary,
                  BlendMode.srcIn,
                ),
              ),
              Gap(5.sp),
              Text(
                text,
                style: TextStyle(
                  color: Theme.of(context).colorScheme.tertiary,
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w300,
                ),
              ),
            ],
          ),
        ),
      );
}
