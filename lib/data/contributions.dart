import 'package:portfolio/model/contributions.dart';

class ContributionsData {
  ContributionsData._();

  static const List<Contributions> all = [
    Contributions(
      orgName: 'Flutter',
      repoName: 'flutter/flutter',
      repoUrl: 'https://github.com/flutter/flutter',
      entries: [
        ContributionEntry(
          issueStatus: ContributionStatus.issueResolved,
          issueTitle:
              '"flutter emulators" won\'t find iOS simulator with Xcode 27',
          issueUrl: 'https://github.com/flutter/flutter/issues/187759',
          prStatus: ContributionStatus.prMerged,
          prTitle:
              '[flutter_tools] Use DeviceHub.app for iOS simulator path on Xcode 27+',
          prUrl: 'https://github.com/flutter/flutter/pull/187910',
        ),
      ],
    ),
    Contributions(
      orgName: 'Flutter',
      repoName: 'flutter/packages',
      repoUrl: 'https://github.com/flutter/packages',
      entries: [
        ContributionEntry(
          issueStatus: ContributionStatus.issueResolved,
          issueTitle:
              '[image_picker] Do not error if a limit of 1 is passed to pickMultiImage',
          issueUrl: 'https://github.com/flutter/flutter/issues/187347',
          prStatus: ContributionStatus.prMerged,
          prTitle:
              '[image_picker] Handle limit: 1 in pickMultiImage and pickMultipleMedia gracefully',
          prUrl: 'https://github.com/flutter/packages/pull/11825',
        ),
      ],
    ),
    Contributions(
      orgName: 'Very Good Ventures',
      repoName: 'VeryGoodOpenSource/very_good_templates',
      repoUrl: 'https://github.com/VeryGoodOpenSource/very_good_templates',
      entries: [
        ContributionEntry(
          issueStatus: ContributionStatus.issueResolved,
          issueTitle: 'feat: add platform flags to the template',
          issueUrl:
              'https://github.com/VeryGoodOpenSource/very_good_templates/issues/30',
          prStatus: ContributionStatus.prMerged,
          prTitle: 'feat(very_good_flame): add platform options',
          prUrl:
              'https://github.com/VeryGoodOpenSource/very_good_templates/pull/340',
        ),
        ContributionEntry(
          issueStatus: ContributionStatus.issueResolved,
          issueTitle: 'feat: Add linux platform support to flame game template',
          issueUrl:
              'https://github.com/VeryGoodOpenSource/very_good_templates/issues/343',
          prStatus: ContributionStatus.prMerged,
          prTitle: 'feat(very_good_flame_game): add linux platform option',
          prUrl:
              'https://github.com/VeryGoodOpenSource/very_good_templates/pull/350',
        ),
      ],
    ),
    Contributions(
      orgName: 'Serverpod',
      repoName: 'serverpod/serverpod',
      repoUrl: 'https://github.com/serverpod/serverpod',
      entries: [
        ContributionEntry(
          issueStatus: ContributionStatus.issueResolved,
          issueTitle: 'Add listener to shutdown process',
          issueUrl: 'https://github.com/serverpod/serverpod/issues/3549',
          prStatus: ContributionStatus.prMerged,
          prTitle:
              'feat: Added ShutdownListenerManager for Graceful Server Shutdown Handling',
          prUrl: 'https://github.com/serverpod/serverpod/pull/3555',
        ),
        ContributionEntry(
          issueStatus: ContributionStatus.issueResolved,
          issueTitle: 'Improve PasswordHashValidator',
          issueUrl: 'https://github.com/serverpod/serverpod/issues/3698',
          prStatus: ContributionStatus.prMerged,
          prTitle:
              'feat: Custom object return for password hash validator and named parameters',
          prUrl: 'https://github.com/serverpod/serverpod/pull/3878',
        ),
        ContributionEntry(
          issueStatus: ContributionStatus.issueResolved,
          issueTitle: 'Consolidate Email Account Request exceptions',
          issueUrl: 'https://github.com/serverpod/serverpod/issues/3882',
          prStatus: ContributionStatus.prMerged,
          prTitle:
              'feat: Consolidate Password reset requests exceptions and account creation exceptions',
          prUrl: 'https://github.com/serverpod/serverpod/pull/3892',
        ),
        ContributionEntry(
          issueStatus: ContributionStatus.issueResolved,
          issueTitle:
              'Password length validation missing on email authentication password reset/change',
          issueUrl: 'https://github.com/serverpod/serverpod/issues/3891',
          prStatus: ContributionStatus.prMerged,
          prTitle:
              'feat: Password length validation in reset and change password',
          prUrl: 'https://github.com/serverpod/serverpod/pull/3905',
        ),
      ],
    ),
    Contributions(
      orgName: 'Supabase CLI',
      repoName: 'supabase/cli',
      repoUrl: 'https://github.com/supabase/cli',
      entries: [
        ContributionEntry(
          issueStatus: ContributionStatus.issueResolved,
          issueTitle:
              'Deno Config Support for IntelliJ IDEA/ Android Studio in supabase init',
          issueUrl: 'https://github.com/supabase/cli/issues/1998',
          prStatus: ContributionStatus.prMerged,
          prTitle: 'feat: added initialisation flag for IntelliJ Deno Config',
          prUrl: 'https://github.com/supabase/cli/pull/2045',
        ),
      ],
    ),
    Contributions(
      orgName: 'Wger Project',
      repoName: 'wger-project/flutter',
      repoUrl: 'https://github.com/wger-project/flutter',
      entries: [
        ContributionEntry(
          issueStatus: ContributionStatus.issueResolved,
          issueTitle: 'Replace SharedPreferences with SharedPreferencesAsync',
          issueUrl: 'https://github.com/wger-project/flutter/issues/731',
          prStatus: ContributionStatus.prMerged,
          prTitle: 'SharedPreferences to SharedPreferencesAsync Migration',
          prUrl: 'https://github.com/wger-project/flutter/pull/761',
        ),
        ContributionEntry(
          issueStatus: ContributionStatus.issueResolved,
          issueTitle: 'Replace golden_toolkit package',
          issueUrl: 'https://github.com/wger-project/flutter/issues/732',
          prStatus: ContributionStatus.prMerged,
          prTitle: 'golden_toolkit to flutter_test Migration',
          prUrl: 'https://github.com/wger-project/flutter/pull/762',
        ),
        ContributionEntry(
          issueStatus: ContributionStatus.issueResolved,
          issueTitle: 'Exercise filters not opening',
          issueUrl: 'https://github.com/wger-project/flutter/issues/743',
          prStatus: ContributionStatus.prMerged,
          prTitle: 'Exercise filters bug fix: Issue #743',
          prUrl: 'https://github.com/wger-project/flutter/pull/766',
        ),
        ContributionEntry(
          issueStatus: ContributionStatus.issueResolved,
          issueTitle: 'Bigger images for ingredient details',
          issueUrl: 'https://github.com/wger-project/flutter/issues/724',
          prStatus: ContributionStatus.prMerged,
          prTitle: 'Nutrition dialog image fix: Issue #724',
          prUrl: 'https://github.com/wger-project/flutter/pull/768',
        ),
        ContributionEntry(
          issueStatus: ContributionStatus.issueResolved,
          issueTitle: 'Show all exercise images',
          issueUrl: 'https://github.com/wger-project/flutter/issues/767',
          prStatus: ContributionStatus.prMerged,
          prTitle: 'Carousel for Exercise Details Images',
          prUrl: 'https://github.com/wger-project/flutter/pull/769',
        ),
      ],
    ),
    Contributions(
      orgName: 'Overlapped Carousel',
      repoName: 'delwar36/overlapped_carousel',
      repoUrl: 'https://github.com/delwar36/overlapped_carousel',
      entries: [
        ContributionEntry(
          issueStatus: ContributionStatus.issueResolved,
          issueTitle:
              'Is it possible to choose whether or not to skew the non-foreground cards?',
          issueUrl: 'https://github.com/delwar36/overlapped_carousel/issues/2',
          prStatus: ContributionStatus.prMerged,
          prTitle:
              'Solved Issue #2: Is it possible to choose whether or not to skew the non-foreground cards?',
          prUrl: 'https://github.com/delwar36/overlapped_carousel/pull/5',
        ),
        ContributionEntry(
          issueStatus: ContributionStatus.issueResolved,
          issueTitle:
              'Is it possible to obscure (in a progressive way) the cards that are not in the foreground?',
          issueUrl: 'https://github.com/delwar36/overlapped_carousel/issues/3',
          prStatus: ContributionStatus.prMerged,
          prTitle: 'Solved Issue #3: Obscuring images not in foreground',
          prUrl: 'https://github.com/delwar36/overlapped_carousel/pull/4',
        ),
      ],
    ),
    Contributions(
      orgName: 'APIDash',
      repoName: 'foss42/apidash',
      repoUrl: 'https://github.com/foss42/apidash',
      entries: [
        ContributionEntry(
          issueStatus: ContributionStatus.issueOpen,
          issueTitle: 'Adding Tabs at the top of the request pane',
          issueUrl: 'https://github.com/foss42/apidash/issues/306',
          prStatus: ContributionStatus.prClosed,
          prTitle: 'Feat tab view',
          prUrl: 'https://github.com/foss42/apidash/pull/327',
        ),
        ContributionEntry(
          issueStatus: ContributionStatus.issueResolved,
          issueTitle: 'Prompting to save data even when no changes made',
          issueUrl: 'https://github.com/foss42/apidash/issues/364',
          prStatus: ContributionStatus.prMerged,
          prTitle: 'Fix prompt only when changes made',
          prUrl: 'https://github.com/foss42/apidash/pull/365',
        ),
        ContributionEntry(
          issueStatus: ContributionStatus.issueResolved,
          issueTitle: 'Add a search/filter for collection pane',
          issueUrl: 'https://github.com/foss42/apidash/issues/305',
          prStatus: ContributionStatus.prClosed,
          prTitle: 'Feat search requests',
          prUrl: 'https://github.com/foss42/apidash/pull/330',
        ),
        ContributionEntry(
          issueStatus: ContributionStatus.issueClosed,
          issueTitle: 'Select and delete in groups',
          issueUrl: 'https://github.com/foss42/apidash/issues/319',
          prStatus: ContributionStatus.prClosed,
          prTitle: 'Feat delete multiple requests',
          prUrl: 'https://github.com/foss42/apidash/pull/368',
        ),
        ContributionEntry(
          issueStatus: ContributionStatus.issueResolved,
          issueTitle: 'Make Cancel-able HTTP Requests',
          issueUrl: 'https://github.com/foss42/apidash/issues/109',
          prStatus: ContributionStatus.prClosed,
          prTitle: 'Make Cancel-able HTTP Requests',
          prUrl: 'https://github.com/foss42/apidash/pull/113',
        ),
        ContributionEntry(
          issueStatus: ContributionStatus.issueResolved,
          issueTitle:
              'Saving state never terminates if persistent files cannot be accessed / modified',
          issueUrl: 'https://github.com/foss42/apidash/issues/359',
          prStatus: ContributionStatus.prClosed,
          prTitle: 'Fix hive persistence issue',
          prUrl: 'https://github.com/foss42/apidash/pull/363',
        ),
        ContributionEntry(
          issueStatus: ContributionStatus.issueClosed,
          issueTitle: 'UI update for API Dash Website',
          issueUrl: 'https://github.com/foss42/apidash/issues/362',
        ),
      ],
    ),
    Contributions(
      orgName: 'CSXL.UNC.EDU',
      repoName: 'unc-csxl/csxl.unc.edu',
      repoUrl: 'https://github.com/unc-csxl/csxl.unc.edu',
      entries: [
        ContributionEntry(
          issueStatus: ContributionStatus.issueResolved,
          issueTitle:
              'Improve User Feedback When Reservation Fails Due to Unaccepted Community Agreement',
          issueUrl: 'https://github.com/unc-csxl/csxl.unc.edu/issues/625',
          prStatus: ContributionStatus.prClosed,
          prTitle: 'Add User Agreement Check Before Reservations',
          prUrl: 'https://github.com/unc-csxl/csxl.unc.edu/pull/626',
        ),
      ],
    ),
    Contributions(
      orgName: 'Chips Input AutoComplete',
      repoName: 'BruckCode/chips_input_autocomplete',
      repoUrl: 'https://github.com/BruckCode/chips_input_autocomplete',
      entries: [
        ContributionEntry(
          issueStatus: ContributionStatus.issueResolved,
          issueTitle: "Setting 'initialChips' causes error",
          issueUrl:
              'https://github.com/BruckCode/chips_input_autocomplete/issues/4',
          prStatus: ContributionStatus.prMerged,
          prTitle: 'Fix FormFieldKey Initialization Error',
          prUrl: 'https://github.com/BruckCode/chips_input_autocomplete/pull/5',
        ),
      ],
    ),
  ];
}
