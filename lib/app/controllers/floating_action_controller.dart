import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';

class FloatingActionController extends GetxController {
  ScrollController scrollController = ScrollController();
  bool showFloatingAction = true;

  @override
  void onInit() {
    super.onInit();
    scrollController.addListener(() {
      if (scrollController.position.userScrollDirection ==
          ScrollDirection.reverse) {
        showFloatingAction = false;
      } else {
        showFloatingAction = true;
      }
      update();
    });
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
}
