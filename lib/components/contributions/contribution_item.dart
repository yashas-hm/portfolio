part of 'contributions_component.dart';

class ContributionCard extends StatefulWidget {
  const ContributionCard({super.key, required this.contribution});

  final Contribution contribution;

  @override
  State<ContributionCard> createState() => _ContributionCardState();
}

class _ContributionCardState extends State<ContributionCard> {
  bool _expanded = false;

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final c = widget.contribution;
    final visibleEntries = _expanded ? c.entries : c.entries.take(3).toList();
    final hiddenCount = c.entries.length - 3;

    return Container(
      width: context.isMobile ? context.width * 0.9 : context.width / 3.2,
      constraints: const BoxConstraints(minWidth: 330, maxWidth: 480),
      clipBehavior: Clip.hardEdge,
      decoration: BoxDecoration(
        color: colors.surfaceColor,
        borderRadius: Sizes.borderRadiusRegular,
        border: Border.all(color: colors.borderColor),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: Sizes.paddingLarge,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Flexible(
                      child: Text(
                        c.orgName,
                        style: Styles.largeTextBold(),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    MouseRegion(
                      cursor: SystemMouseCursors.click,
                      child: GestureDetector(
                        onTap: () => Utils.safelyLaunchUrl(c.repoUrl, context),
                        child: FaIcon(
                          FontAwesomeIcons.arrowUpRightFromSquare,
                          size: Sizes.iconXS,
                          color: colors.primaryColor,
                        ),
                      ),
                    ),
                  ],
                ),
                Gap(Sizes.spacingXS),
                Text(
                  c.repoName,
                  style: Styles.smallText(textColor: colors.textSecondary),
                ),
                Gap(Sizes.spacingRegular),
                Row(
                  spacing: Sizes.spacingSmallRegular,
                  children: [
                    if (c.mergedCount > 0)
                      _MiniChip(
                          '${c.mergedCount} merged', KnownColors.purple500),
                    if (c.closedCount > 0)
                      _MiniChip('${c.closedCount} closed', KnownColors.red500),
                  ],
                ),
              ],
            ),
          ),
          Divider(color: colors.borderColor, height: 1),
          AnimatedSize(
            duration: 200.milliseconds,
            curve: Curves.easeInOut,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                ...visibleEntries.indexed.map((record) => _EntryRow(
                      entry: record.$2,
                      lastIndex: record.$1 == visibleEntries.length - 1,
                    )),
                if (c.entries.length > 3)
                  _ExpandButton(
                    isExpanded: _expanded,
                    remaining: hiddenCount,
                    onTap: () => setState(() => _expanded = !_expanded),
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _MiniChip extends StatelessWidget {
  const _MiniChip(this.label, this.color);

  final String label;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: Sizes.spacingSmallRegular,
        vertical: Sizes.spacingXS,
      ),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.15),
        border: Border.all(color: color, width: 0.5),
        borderRadius: Sizes.borderRadiusXS,
      ),
      child: Text(label, style: Styles.extraSmallText(textColor: color)),
    );
  }
}

class _EntryRow extends StatelessWidget {
  const _EntryRow({required this.entry, this.lastIndex = false});

  final ContributionEntry entry;
  final bool lastIndex;

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;

    return Padding(
      padding: EdgeInsets.fromLTRB(
        Sizes.spacingLarge,
        Sizes.spacingRegular,
        Sizes.spacingLarge,
        0,
      ),
      child: Column(
        spacing: Sizes.spacingSmallRegular,
        mainAxisSize: MainAxisSize.min,
        children: [
          MouseRegion(
            cursor: SystemMouseCursors.click,
            child: GestureDetector(
              onTap: () => Utils.safelyLaunchUrl(entry.issueUrl, context),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                spacing: Sizes.spacingSmallRegular,
                children: [
                  _StatusBadge(status: entry.issueStatus),
                  Expanded(
                    child: Text(
                      entry.issueTitle,
                      style: Styles.smallText(),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ],
              ),
            ),
          ),
          if (entry.prStatus != null)
            MouseRegion(
              cursor: SystemMouseCursors.click,
              child: GestureDetector(
                onTap: () => Utils.safelyLaunchUrl(entry.prUrl!, context),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  spacing: Sizes.spacingSmallRegular,
                  children: [
                    _StatusBadge(status: entry.prStatus!),
                    Expanded(
                      child: Text(
                        entry.prTitle!,
                        style: Styles.smallText(),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          Divider(
              color: lastIndex ? KnownColors.transparent : colors.borderColor,
              height: 1),
        ],
      ),
    );
  }
}

class _StatusBadge extends StatelessWidget {
  const _StatusBadge({required this.status});

  final ContributionStatus status;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: Sizes.paddingXS,
      decoration: BoxDecoration(
        color: status.color.withValues(alpha: 0.15),
        border: Border.all(color: status.color, width: 0.5),
        borderRadius: Sizes.borderRadiusXS,
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        spacing: 3,
        children: [
          FaIcon(status.icon, size: Sizes.iconXXS, color: status.color),
          Text(
            status.value,
            style: Styles.extraSmallText(textColor: status.color),
          ),
        ],
      ),
    );
  }
}

class _ExpandButton extends StatelessWidget {
  const _ExpandButton({
    required this.isExpanded,
    required this.remaining,
    required this.onTap,
  });

  final bool isExpanded;
  final int remaining;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;

    return TextButton(
      onPressed: onTap,
      child: Row(
        spacing: Sizes.spacingRegular,
        children: [
          Text(
            isExpanded ? 'Show less' : 'Show $remaining more',
            style: Styles.smallText(textColor: colors.primaryColor),
          ),
          FaIcon(
            isExpanded ? FontAwesomeIcons.caretUp : FontAwesomeIcons.caretDown,
            size: Sizes.iconSmall,
          ),
        ],
      ),
    );
  }
}
