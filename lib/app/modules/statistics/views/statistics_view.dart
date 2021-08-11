import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/statistics_controller.dart';

class StatisticsView extends GetView<StatisticsController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('StatisticsView'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'StatisticsView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
