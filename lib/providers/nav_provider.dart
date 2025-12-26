import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:portfolio/constants/portfolio_constants.dart';
import 'package:portfolio/constants/portfolio_data.dart';
import 'package:portfolio/providers/scroll_provider.dart';
import 'package:portfolio/utilities/extensions.dart';
import 'package:portfolio/utilities/utils.dart';
import 'package:url_launcher/url_launcher.dart';

final pageIndexProvider = NotifierProvider<PageIndexNotifier, int>(
  PageIndexNotifier.new,
);

final currentIndexProvider = NotifierProvider<CurrentIndexNotifier, int>(
  CurrentIndexNotifier.new,
);

class PageIndexNotifier extends Notifier<int> {
  @override
  int build() => homeIndex;

  void set(int value) => state = value;
}

class CurrentIndexNotifier extends Notifier<int> {
  @override
  int build() => homeIndex;

  void set(int value) => state = value;
}

void updateIndex(
  BuildContext context,
  WidgetRef ref,
  int index, {
  force = false,
}) {
  final controller = ref.read(scrollControllerProvider);
  final pageIndex = ref.read(pageIndexProvider.notifier);

  if (index == resumeIndex) {
    launchUrl(Uri.parse(resumeLink));
    return;
  } else if (index == chatIndex) {
    pageIndex.set(index);
    reRoute(index, context, ref);
  } else if (index == contributionsIndex) {
    // pageIndex.set(index);
    // reRoute(index, context, ref);
    // TODO: temporary
    launchUrl(Uri.parse(
        'https://github.com/yashas-hm/yashas-hm/blob/main/contributions.md'));
    return;
  } else {
    if (ref.read(pageIndexProvider) != 0 || force) {
      pageIndex.set(index);
      reRoute(index, context, ref);
    } else {
      controller.scrollTo(
        index: index,
        duration: 600.milliseconds,
      );
    }
  }

  ref.read(currentIndexProvider.notifier).set(index);
}
