import 'package:flutter/widgets.dart';

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

extension GetByIdentifier<T> on List {
  T getByIdentifier(String identifier) {
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
  bool get isMobile {
    final screenSize = MediaQuery.of(this).size;
    return screenSize.height > screenSize.width;
  }

  Size get screenSize => MediaQuery.of(this).size;
}
