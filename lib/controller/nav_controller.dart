import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class NavController extends GetxController{
  RxInt page = 0.obs;

  final ScrollController scrollCtr = ScrollController();
}