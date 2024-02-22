import 'package:get/get.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

class NavController extends GetxController {
  RxInt currentIndex = 0.obs;
  int pageIndex = 0;

  late ItemScrollController controller;
  late ItemPositionsListener listener;

  void updateIndex(int index, {force = false}) {
    if (pageIndex != 0 || force) {
      pageIndex = index;
      router();
    } else {
      controller.scrollTo(
        index: index,
        duration: 600.milliseconds,
      );
    }
    currentIndex.value = index;
  }

  void router() {
    switch (pageIndex) {
      case 0:
        Get.offAndToNamed('/');
        break;
      case 1:
        Get.offAndToNamed('/aboutMe');
        break;
      case 2:
        Get.offAndToNamed('/experience');
        break;
      case 3:
        Get.offAndToNamed('/projects');
        break;
      case 4:
        Get.offAndToNamed('/contactMe');
        break;
    }
  }
}
