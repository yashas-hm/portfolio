import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:portfolio/utilities/shared_pref_utils.dart';

final StateProvider<double> xProvider = StateProvider<double>((_) => 0.0);

final StateProvider<double> yProvider = StateProvider<double>((_) => 0.0);

final themeModeProvider = StateProvider<ThemeMode>((_) => ThemeMode.dark);

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
