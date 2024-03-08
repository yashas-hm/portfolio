import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

final scrollControllerProvider = StateProvider((ref) => ItemScrollController());

final positionListenerProvider =
    StateProvider((ref) => ItemPositionsListener.create());
