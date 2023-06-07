import 'package:get/get.dart';
import 'package:portfolio/core/constants/app_constants.dart';

class CommonController extends GetxController {
  bool darkMode = false;

  void changeDarkMode(){
    darkMode = !darkMode;
    update([AppConstants.darkMode]);
  }
}