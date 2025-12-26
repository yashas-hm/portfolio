import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:portfolio/theme/theme.dart';
import 'package:portfolio/utilities/shared_pref_utils.dart';

final xProvider = NotifierProvider<DoubleNotifier, double>(DoubleNotifier.new);

final yProvider = NotifierProvider<DoubleNotifier, double>(DoubleNotifier.new);

final themeModeProvider = NotifierProvider<ThemeModeNotifier, ThemeMode>(
  ThemeModeNotifier.new,
);

class DoubleNotifier extends Notifier<double> {
  @override
  double build() => 0.0;

  void set(double value) => state = value;
}

class ThemeModeNotifier extends Notifier<ThemeMode> {
  ThemeColors colors = AppTheme.darkColors;
  
  @override
  ThemeMode build() => ThemeMode.dark;
  
  void set(ThemeMode value) {
    if(value!=state){
      state = value;
      if(state==ThemeMode.dark){
        colors = AppTheme.darkColors;
      }else{
        colors = AppTheme.lightColors;
      } 
    }
  }
}

void toggleThemeMode(
  WidgetRef ref,
  bool dark,
) async {
  if (dark) {
    ref.read(themeModeProvider.notifier).set(ThemeMode.dark);
  } else {
    ref.read(themeModeProvider.notifier).set(ThemeMode.light);
  }

  setIsDarkModePref(dark);
}

void checkTheme(WidgetRef ref) async {
  bool prefDarkBool = await getIsDarkModePref;
  if (prefDarkBool) {
    ref.read(themeModeProvider.notifier).set(ThemeMode.dark);
  } else {
    ref.read(themeModeProvider.notifier).set(ThemeMode.light);
  }
}