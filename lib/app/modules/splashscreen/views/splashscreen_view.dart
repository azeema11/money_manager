import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/splashscreen_controller.dart';

class SplashscreenView extends GetView<SplashscreenController> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<SplashscreenController>(
      builder: (_){
        return Scaffold(
          backgroundColor: Colors.white,
          body: Center(
            child: Image.asset("assets/app_icon.png"),
          ),
        );
      }
    );
  }
}
