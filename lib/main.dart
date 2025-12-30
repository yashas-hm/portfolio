import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_web_plugins/flutter_web_plugins.dart';
import 'package:oktoast/oktoast.dart';
import 'package:portfolio/navigation/navigation.dart';
import 'package:portfolio/providers/ui_provider.dart';
import 'package:portfolio/theme/theme.dart';
import 'package:portfolio/utilities/extensions.dart';
import 'package:resize/resize.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  usePathUrlStrategy();
  runApp(ProviderScope(child: Portfolio()));
}

class Portfolio extends ConsumerStatefulWidget {
  const Portfolio({super.key});

  @override
  ConsumerState<Portfolio> createState() => _PortfolioState();
}

class _PortfolioState extends ConsumerState<Portfolio> {
  @override
  void initState() {
    checkTheme(ref);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final themeMode = ref.watch(themeProvider);

    Size size;

    if (context.isMobile) {
      size = const Size(410, 910);
    } else {
      size = const Size(1728, 1000);
    }

    return Resize(
      builder: () => OKToast(
        child: MaterialApp(
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
        ),
      ),
      allowtextScaling: false,
      size: size,
    );
  }
}
