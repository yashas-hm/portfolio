import 'package:flutter/material.dart' show ThemeMode, ValueNotifier;
import 'package:shared_preferences/shared_preferences.dart';

class ThemeRepository {
  ThemeRepository._();

  static final ThemeRepository instance = ThemeRepository._();

  static const String _darkModeKey = 'Dark Mode';

  final ValueNotifier<ThemeMode> state = ValueNotifier(ThemeMode.dark);

  Future<void> init() async {
    final prefs = await SharedPreferences.getInstance();
    final isDark = prefs.getBool(_darkModeKey) ?? true;
    state.value = isDark ? ThemeMode.dark : ThemeMode.light;
  }

  void toggle(bool dark) async {
    state.value = dark ? ThemeMode.dark : ThemeMode.light;
    final prefs = await SharedPreferences.getInstance();
    prefs.setBool(_darkModeKey, dark);
  }

  bool get isDark => state.value == ThemeMode.dark;
}
