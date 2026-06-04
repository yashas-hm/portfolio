import 'package:flutter/material.dart' show Color;
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:portfolio/constants/constants.dart';

enum ContributionStatus {
  issueOpen,
  issueClosed,
  issueResolved,
  prOpen,
  prClosed,
  prMerged;

  String get label => switch (this) {
        ContributionStatus.issueOpen => 'Issue Open',
        ContributionStatus.issueClosed => 'Issue Closed',
        ContributionStatus.issueResolved => 'Issue Resolved',
        ContributionStatus.prOpen => 'PR Open',
        ContributionStatus.prClosed => 'PR Closed',
        ContributionStatus.prMerged => 'PR Merged',
      };

  Color get color => switch (this) {
        ContributionStatus.issueResolved => KnownColors.green500,
        ContributionStatus.prMerged => KnownColors.purple500,
        ContributionStatus.issueOpen ||
        ContributionStatus.prOpen =>
          KnownColors.amber500,
        ContributionStatus.issueClosed ||
        ContributionStatus.prClosed =>
          KnownColors.red500,
      };

  FaIconData get icon => switch (this) {
        ContributionStatus.issueOpen => FontAwesomeIcons.circleExclamation,
        ContributionStatus.issueClosed => FontAwesomeIcons.circleMinus,
        ContributionStatus.issueResolved => FontAwesomeIcons.circleCheck,
        ContributionStatus.prOpen => FontAwesomeIcons.codePullRequest,
        ContributionStatus.prClosed => FontAwesomeIcons.codePullRequest,
        ContributionStatus.prMerged => FontAwesomeIcons.codeMerge,
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

class Contributions {
  final String orgName;
  final String repoName;
  final String repoUrl;
  final List<ContributionEntry> entries;

  const Contributions({
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
