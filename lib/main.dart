import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_web_plugins/flutter_web_plugins.dart';
import 'package:oktoast/oktoast.dart';
import 'package:portfolio/navigation/navigation.dart';
import 'package:portfolio/repositories/theme_repository.dart';
import 'package:portfolio/theme/theme.dart';
import 'package:portfolio/utilities/extensions.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  usePathUrlStrategy();
  ThemeRepository.instance.init();
  runApp(const Portfolio());
}

class Portfolio extends StatelessWidget {
  const Portfolio({super.key});

  @override
  Widget build(BuildContext context) {
    return OKToast(
      child: ValueListenableBuilder<ThemeMode>(
        valueListenable: ThemeRepository.instance.state,
        builder: (context, themeMode, _) {
          return MaterialApp(
            navigatorKey: AppNavigator.navigatorKey,
            scrollBehavior: const MaterialScrollBehavior().copyWith(
              dragDevices: {
                PointerDeviceKind.mouse,
                PointerDeviceKind.touch,
                PointerDeviceKind.stylus,
                PointerDeviceKind.unknown,
              },
            ),
            theme: AppTheme(context).lightTheme,
            darkTheme: AppTheme(context).darkTheme,
            themeMode: themeMode,
            themeAnimationDuration: 200.milliseconds,
            themeAnimationCurve: Curves.easeInOut,
            debugShowCheckedModeBanner: false,
            title: 'Yashas H Majmudar',
            onGenerateRoute: routeGenerator,
          );
        },
      ),
    );
  }
}