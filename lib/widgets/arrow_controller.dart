import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:portfolio/constants/constants.dart' show Sizes, KnownColors;
import 'package:portfolio/utilities/extensions.dart';

class ArrowController extends StatelessWidget {
  const ArrowController({
    super.key,
    this.forward,
    this.backward,
  });

  final VoidCallback? forward;
  final VoidCallback? backward;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      spacing: Sizes.spacingRegular,
      children: [
        NavButton(
          icon: FontAwesomeIcons.chevronLeft,
          onPressed: backward,
        ),
        NavButton(
          icon: FontAwesomeIcons.chevronRight,
          onPressed: forward,
        ),
      ],
    );
  }
}

class NavButton extends StatelessWidget {
  const NavButton({
    super.key,
    required this.icon,
    required this.onPressed,
  });

  final IconData icon;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final isDisabled = onPressed == null;

    return MouseRegion(
      cursor: isDisabled ? SystemMouseCursors.basic : SystemMouseCursors.click,
      child: GestureDetector(
        onTap: onPressed,
        child: Container(
          decoration: BoxDecoration(
            border: Border.all(
                color: isDisabled
                    ? colors.textColor.withValues(alpha: 0.3)
                    : colors.textColor),
            shape: BoxShape.circle,
            color: isDisabled ? KnownColors.transparent : colors.surfaceColor,
          ),
          padding: EdgeInsets.all(Sizes.spacingSmallRegular),
          child: Icon(
            icon,
            size: Sizes.iconSmall,
            color: isDisabled
                ? colors.textColor.withValues(alpha: 0.3)
                : colors.textColor,
          ),
        ),
      ),
    );
  }
}
