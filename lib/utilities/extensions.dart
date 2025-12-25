import 'package:flutter/widgets.dart';
import 'package:portfolio/model/chat_model.dart';

extension NumUtils on num {
  num remap(num minExtent, num maxExtent, num minRange, num maxRange) {
    return (this - minExtent) /
            (maxExtent - minExtent) *
            (maxRange - minRange) +
        minRange;
  }

  Duration get milliseconds => Duration(microseconds: (this * 1000).round());

  Duration get seconds => Duration(milliseconds: (this * 1000).round());
}

extension GetByIdentifier on List {
  T getByIdentifier<T>(String identifier) {
    return firstWhere(
      (element) => element.identifier == identifier,
      orElse: () => throw Exception('Invalid Identifier'),
    );
  }
}

extension StringUtils on String {
  bool get isEmail => RegExp(
          r'^(([^<>()[\]\\.,;:\s@"]+(\.[^<>()[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$')
      .hasMatch(this);
}

extension ContextUtils on BuildContext {
  bool get isMobile => height > width;

  double get height => MediaQuery.of(this).size.height;

  double get width => MediaQuery.of(this).size.width;

  Size get screenSize => MediaQuery.of(this).size;
}

extension HumanMessage on List<ChatModel> {
  String get lastHumanMessage =>
      where((msg) => msg.role == Role.human).last.message;
}
