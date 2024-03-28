import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_web_plugins/flutter_web_plugins.dart';
import 'package:oktoast/oktoast.dart';
import 'package:portfolio/core/constants/app_theme.dart';
import 'package:portfolio/core/utilities/utils.dart';
import 'package:portfolio/providers/ui_provider.dart';
import 'package:resize/resize.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  usePathUrlStrategy();
  runApp(const ProviderScope(child: Portfolio()));
}

class Portfolio extends ConsumerWidget {
  const Portfolio({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final screenSize = MediaQuery.of(context).size;
    final themeMode = ref.watch(themeModeProvider);

    Size size;

    if (screenSize.height > screenSize.width) {
      size = const Size(410, 910);
    } else {
      size = const Size(1728, 1000);
    }

    return Resize(
      builder: () => OKToast(
        child: MaterialApp(
          theme: lightTheme(context),
          darkTheme: darkTheme(context),
          themeMode: themeMode,
          debugShowCheckedModeBanner: false,
          title: 'Yashas H Majmudar',
          onGenerateRoute: routeBuilder,
        ),
      ),
      allowtextScaling: false,
      size: size,
    );
  }
}
