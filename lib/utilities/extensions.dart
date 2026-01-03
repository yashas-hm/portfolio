import 'package:flutter/material.dart' show Theme, ThemeMode;
import 'package:flutter/widgets.dart';
import 'package:portfolio/theme/theme.dart' show ThemeColors;

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

  List<TextSpan> toMarkdownSpans({
    required TextStyle normalStyle,
    required TextStyle boldStyle,
  }) {
    final spans = <TextSpan>[];
    final regex = RegExp(r'\*\*(.+?)\*\*');
    var lastEnd = 0;

    for (final match in regex.allMatches(this)) {
      if (match.start > lastEnd) {
        spans.add(TextSpan(
          text: substring(lastEnd, match.start),
          style: normalStyle,
        ));
      }

      spans.add(TextSpan(
        text: match.group(1),
        style: boldStyle,
      ));
      lastEnd = match.end;
    }

    if (lastEnd < length) {
      spans.add(TextSpan(
        text: substring(lastEnd),
        style: normalStyle,
      ));
    }

    return spans;
  }
}

extension ContextUtils on BuildContext {
  bool get isMobile => width < 600;

  double get height => MediaQuery.of(this).size.height;

  double get width => MediaQuery.of(this).size.width;

  Size get screenSize => MediaQuery.of(this).size;

  double get aspectRatio => width / height;

  ThemeColors get colors => Theme.of(this).extension<ThemeColors>()!;
}

extension ColorUtils on Color {
  Color get backgroundColor => withValues(alpha: 0.1);
}

extension ThemeUtils on ThemeMode {
  bool get isDarkMode => switch (this) {
        ThemeMode.light => false,
        ThemeMode.dark => true,
        _ => true,
      };
}
