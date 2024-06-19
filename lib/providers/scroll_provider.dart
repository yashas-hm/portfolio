import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

final StateProvider<ItemScrollController> scrollControllerProvider =
    StateProvider<ItemScrollController>((_) => ItemScrollController());

final StateProvider<ItemPositionsListener> positionListenerProvider =
    StateProvider<ItemPositionsListener>((_) => ItemPositionsListener.create());
