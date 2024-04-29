import 'package:custom_mouse_cursor/custom_mouse_cursor.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:portfolio/core/utilities/shared_pref_utils.dart';

final StateProvider<double> xProvider = StateProvider((ref) => 0.0);

final StateProvider<double> yProvider = StateProvider((ref) => 0.0);

final themeModeProvider = StateProvider<ThemeMode>((ref) => ThemeMode.dark);

void toggleThemeMode(
  WidgetRef ref,
  bool dark,
) async {
  if (dark) {
    ref.read(themeModeProvider.notifier).update((_) => ThemeMode.dark);
  } else {
    ref.read(themeModeProvider.notifier).update((_) => ThemeMode.light);
  }

  setIsDarkModePref(dark);
}

void checkTheme(WidgetRef ref) async {
  bool prefDarkBool = await getIsDarkModePref;
  if (prefDarkBool) {
    ref.read(themeModeProvider.notifier).update((_) => ThemeMode.dark);
  } else {
    ref.read(themeModeProvider.notifier).update((_) => ThemeMode.light);
  }
}
