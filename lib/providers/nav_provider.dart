import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:portfolio/core/constants/app_constants.dart';
import 'package:portfolio/core/utilities/extensions.dart';
import 'package:portfolio/core/utilities/utils.dart';
import 'package:portfolio/providers/scroll_provider.dart';

final pageIndexProvider = StateProvider((ref) => homeIndex);

final currentIndexProvider = StateProvider((ref) => homeIndex);

void updateIndex(
  BuildContext context,
  WidgetRef ref,
  int index, {
  force = false,
}) {
  final controller = ref.read(scrollControllerProvider);
  final pageIndex = ref.read(pageIndexProvider.notifier);

  if (pageIndex.state != 0 || force) {
    pageIndex.state = index;
    reRoute(index, context, ref);
  } else {
    controller.scrollTo(
      index: index,
      duration: 600.milliseconds,
    );
  }

  ref.read(currentIndexProvider.notifier).state = index;
}
