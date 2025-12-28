import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:portfolio/utilities/shared_pref_utils.dart';

final xProvider = NotifierProvider<DoubleNotifier, double>(DoubleNotifier.new);

final yProvider = NotifierProvider<DoubleNotifier, double>(DoubleNotifier.new);

class DoubleNotifier extends Notifier<double> {
  @override
  double build() => 0.0;

  void set(double value) => state = value;
}

final themeProvider = NotifierProvider<ThemeNotifier, ThemeMode>(
  ThemeNotifier.new,
);

class ThemeNotifier extends Notifier<ThemeMode> {
  @override
  ThemeMode build() => ThemeMode.dark;

  void setMode(ThemeMode value) {
    if (value != state) {
      state = value;
    }
  }
}

void toggleThemeMode(
  WidgetRef ref,
  bool dark,
) async {
  if (dark) {
    ref.read(themeProvider.notifier).setMode(ThemeMode.dark);
  } else {
    ref.read(themeProvider.notifier).setMode(ThemeMode.light);
  }

  setIsDarkModePref(dark);
}

void checkTheme(WidgetRef ref) async {
  bool prefDarkBool = await getIsDarkModePref;
  if (prefDarkBool) {
    ref.read(themeProvider.notifier).setMode(ThemeMode.dark);
  } else {
    ref.read(themeProvider.notifier).setMode(ThemeMode.light);
  }
}
