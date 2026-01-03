part of 'base_page.dart';

class Navbar extends StatefulWidget implements PreferredSizeWidget {
  const Navbar({super.key});

  @override
  State<Navbar> createState() => _NavbarState();

  @override
  Size get preferredSize => Size.fromHeight(Sizes.navBarHeight);
}

class _NavbarState extends State<Navbar> {
  bool _menuOpen = false;

  @override
  Widget build(BuildContext context) {
    bool isCompactWidth = context.width < 800;

    return Container(
      margin: EdgeInsets.symmetric(
        vertical: Sizes.spacingMedium,
        horizontal: Sizes.spacingRegular,
      ),
      padding: Sizes.paddingRegular,
      child: Stack(
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: MouseRegion(
              cursor: isCurrentRoute(Routes.home)
                  ? SystemMouseCursors.basic
                  : SystemMouseCursors.click,
              child: GestureDetector(
                onTap: () => AppNavigator.push(Routes.home),
                child: Container(
                  height: Sizes.iconXL,
                  width: Sizes.iconXL,
                  alignment: Alignment.center,
                  clipBehavior: Clip.hardEdge,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: KnownColors.transparent,
                  ),
                  child: SvgPicture.asset(ImageAssets.avatarImage),
                ),
              ),
            ),
          ),
          if (!context.isMobile && !isCompactWidth)
            Align(
              alignment: Alignment.center,
              child: SizedBox(
                width: context.width * 0.8,
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: Routes.mainRoutes
                      .map(
                        (route) => HoverGlowText(
                          text: Text(
                            route.name,
                            style: Styles.regularText(),
                          ),
                          alwaysHighlight: isCurrentRoute(route),
                          onTap: isCurrentRoute(route)
                              ? null
                              : () => AppNavigator.push(route),
                        ),
                      )
                      .toList(),
                ),
              ),
            ),
          Align(
            alignment: Alignment.centerRight,
            child: context.isMobile || isCompactWidth
                ? _buildMobileOptions()
                : _buildWebOptions(),
          ),
        ],
      ),
    );
  }

  Widget _buildMobileOptions() {
    final colors = context.colors;

    return _createMenu(
      [
        ...Routes.mainRoutes,
        ...Routes.secondaryRoutes,
      ],
      AnimatedSwitcher(
        duration: 400.milliseconds,
        child: Icon(
          _menuOpen ? FontAwesomeIcons.xmark : FontAwesomeIcons.bars,
          key: ValueKey(_menuOpen),
          size: Sizes.iconMedium,
          color: colors.textColor,
        ),
      ),
    );
  }

  Widget _buildWebOptions() {
    final colors = context.colors;

    return Row(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.end,
      crossAxisAlignment: CrossAxisAlignment.center,
      spacing: Sizes.spacingLarge,
      children: [
        MouseRegion(
          cursor: SystemMouseCursors.click,
          child: GestureDetector(
            onTap: () => Utils.safelyLaunchUrl(Links.resume.url, context),
            child: Container(
              height: Sizes.spacingXL,
              decoration: BoxDecoration(
                borderRadius: Sizes.borderRadiusXS,
                border: Border.all(color: colors.borderColor),
                color: colors.primaryColor,
              ),
              padding: EdgeInsets.symmetric(
                horizontal: Sizes.spacingSmallRegular,
              ),
              alignment: Alignment.center,
              child: Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                spacing: Sizes.spacingSmall,
                children: [
                  Text(
                    Links.resume.urlText,
                    style: Styles.regularText(textColor: colors.onPrimary),
                  ),
                  Icon(
                    Links.resume.icon,
                    size: Sizes.iconSmall,
                    color: colors.onPrimary,
                  )
                ],
              ),
            ),
          ),
        ),
        _createMenu(
          Routes.secondaryRoutes,
          Container(
            width: Sizes.spacingXL,
            height: Sizes.spacingXL,
            decoration: BoxDecoration(
              border: Border.all(color: colors.borderColor),
              borderRadius: Sizes.borderRadiusXS,
              color: colors.primaryColor.withValues(alpha: 0.1),
            ),
            alignment: Alignment.center,
            child: AnimatedSwitcher(
              duration: 200.milliseconds,
              child: Icon(
                _menuOpen
                    ? FontAwesomeIcons.caretUp
                    : FontAwesomeIcons.caretDown,
                key: ValueKey(_menuOpen),
                size: Sizes.iconRegular,
                color: colors.primaryColor,
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _createMenu(List<Routes> routes, Widget icon) {
    final colors = context.colors;

    return PopupMenuButton<dynamic>(
      tooltip: 'More',
      offset: Offset(0, Sizes.spacingXL + Sizes.spacingSmall),
      shape: RoundedRectangleBorder(
        borderRadius: Sizes.borderRadiusSmall,
        side: BorderSide(color: colors.borderColor),
      ),
      color: colors.surfaceColor,
      onOpened: () => setState(() => _menuOpen = true),
      onCanceled: () => setState(() => _menuOpen = false),
      onSelected: (route) {
        setState(() => _menuOpen = false);
        AppNavigator.push(route);
      },
      itemBuilder: (popupContext) {
        final popupColors = popupContext.colors;
        return [
          ...routes.map(
            (route) => PopupMenuItem<dynamic>(
              value: route,
              child: Row(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.start,
                spacing: Sizes.spacingRegular,
                children: [
                  if (route.icon != null)
                    Icon(
                      route.icon,
                      size: Sizes.iconSmall,
                      color: popupColors.primaryColor,
                    ),
                  HoverGlowText(
                    text: Text(
                      route.name,
                      style: Styles.smallText(
                        textColor: popupColors.textColor,
                      ),
                    ),
                    glowColor: popupColors.primaryColor,
                    alwaysHighlight: isCurrentRoute(route),
                  ),
                ],
              ),
            ),
          ),
          PopupMenuDivider(
            thickness: 0.5,
            color: popupColors.borderColor,
            indent: Sizes.spacingRegular,
            endIndent: Sizes.spacingRegular,
          ),
          PopupMenuItem<void>(
            enabled: false,
            child: _ThemeSwitcher(),
          ),
        ];
      },
      child: icon,
    );
  }

  bool isCurrentRoute(Routes route) {
    final checkAgainstRoute = AppNavigator.currentRoute;
    if (checkAgainstRoute == null) return false;
    return route == checkAgainstRoute;
  }
}

class _ThemeSwitcher extends StatelessWidget {
  const _ThemeSwitcher();

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<ThemeMode>(
      valueListenable: ThemeRepository.instance.state,
      builder: (_, themeMode, __) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          spacing: Sizes.spacingRegular,
          children: [
            Text(
              themeMode.isDarkMode ? 'Dark Mode' : 'Light Mode',
              style: Styles.smallText(textColor: context.colors.textColor),
            ),
            DayNightSwitch(
              size: Sizes.iconSmall,
              initiallyDark: themeMode.isDarkMode,
              onChange: (darkMode) {
                ThemeRepository.instance.toggle(darkMode);
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}
