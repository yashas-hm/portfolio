import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

final scrollControllerProvider =
    NotifierProvider<ScrollControllerNotifier, ItemScrollController>(
  ScrollControllerNotifier.new,
);

final positionListenerProvider =
    NotifierProvider<PositionListenerNotifier, ItemPositionsListener>(
  PositionListenerNotifier.new,
);

class ScrollControllerNotifier extends Notifier<ItemScrollController> {
  @override
  ItemScrollController build() => ItemScrollController();

  void reset() => state = ItemScrollController();
}

class PositionListenerNotifier extends Notifier<ItemPositionsListener> {
  @override
  ItemPositionsListener build() => ItemPositionsListener.create();

  void reset() => state = ItemPositionsListener.create();
}
