import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/add_transaction_controller.dart';

class AddTransactionView extends GetView<AddTransactionController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('AddTransactionView'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'AddTransactionView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
