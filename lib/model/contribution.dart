import 'package:flutter/material.dart' show Color;
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:portfolio/constants/constants.dart';

enum ContributionStatus {
  all('All', FontAwesomeIcons.a),
  issueOpen('Issue Open', FontAwesomeIcons.circleExclamation),
  issueClosed('Issue Closed', FontAwesomeIcons.circleMinus),
  issueResolved('Issue Resolved', FontAwesomeIcons.circleCheck),
  prOpen('PR Open', FontAwesomeIcons.codePullRequest),
  prClosed('PR Closed', FontAwesomeIcons.codePullRequest),
  prMerged('PR Merged', FontAwesomeIcons.codeMerge);

  final String value;
  final FaIconData icon;

  const ContributionStatus(this.value, this.icon);

  Color get color => switch (this) {
        ContributionStatus.issueResolved => KnownColors.green500,
        ContributionStatus.prMerged => KnownColors.purple500,
        ContributionStatus.issueOpen ||
        ContributionStatus.prOpen =>
          KnownColors.amber500,
        ContributionStatus.issueClosed ||
        ContributionStatus.prClosed =>
          KnownColors.red500,
        _ => KnownColors.transparent,
      };
}

class ContributionEntry {
  final ContributionStatus issueStatus;
  final String issueTitle;
  final String issueUrl;
  final ContributionStatus? prStatus;
  final String? prTitle;
  final String? prUrl;

  const ContributionEntry({
    required this.issueStatus,
    required this.issueTitle,
    required this.issueUrl,
    this.prStatus,
    this.prTitle,
    this.prUrl,
  });
}

class Contribution {
  final String orgName;
  final String repoName;
  final String repoUrl;
  final List<ContributionEntry> entries;

  const Contribution({
    required this.orgName,
    required this.repoName,
    required this.repoUrl,
    required this.entries,
  });

  int get mergedCount =>
      entries.where((e) => e.prStatus == ContributionStatus.prMerged).length;

  int get closedCount =>
      entries.where((e) => e.prStatus == ContributionStatus.prClosed).length;
}
