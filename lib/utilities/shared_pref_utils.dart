import 'package:portfolio/constants/legacy_constants/portfolio_constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<bool> get getIsDarkModePref async {
  final instance = await SharedPreferences.getInstance();
  return instance.getBool(darkMode) ?? true;
}

void setIsDarkModePref(bool dark) async {
  final instance = await SharedPreferences.getInstance();
  instance.setBool(darkMode, dark);
}
