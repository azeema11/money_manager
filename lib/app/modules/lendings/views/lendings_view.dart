import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/lendings_controller.dart';

class LendingsView extends GetView<LendingsController> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<LendingsController>(
      builder: (_) {
        return Scaffold(
          appBar: AppBar(
            title: Text(
              _.currentIndex == 0? "Lend" : "Borrow",
            ),
          ),
          body: Center(
            child: Text(
              '${_.currentIndex}',
              style: TextStyle(fontSize: 20),
            ),
          ),
        );
      }
    );
  }
}
