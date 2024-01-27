import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:get/get.dart';
import 'package:portfolio/controller/nav_controller.dart';
import 'package:portfolio/core/constants/app_theme.dart';
import 'package:portfolio/widgets/custom_scaffold.dart';
import 'package:resize/resize.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Get.put(NavController());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

    Size size;

    if(screenSize.height>screenSize.width){
      size = const Size(410, 910);
    }else{
      size = const Size(1728,1000);
    }

    return Resize(
      builder: () => GetMaterialApp(
        defaultTransition: Transition.fade,
        transitionDuration: const Duration(milliseconds: 500),
        theme: AppTheme.getTheme(context),
        debugShowCheckedModeBanner: false,
        title: 'Yashas Majmudar',
        routes: {
          '/': (ctx) => CustomScaffold(),
        },
      ).animate().fadeIn(
            duration: 400.ms,
          ),
      allowtextScaling: false,
      size: size,
    );
  }
}
