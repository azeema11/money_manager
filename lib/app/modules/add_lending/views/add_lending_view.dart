import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/add_lending_controller.dart';

class AddLendingView extends GetView<AddLendingController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('AddLendingView'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'AddLendingView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
