import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:money_manager/app/modules/transactions/controllers/transactions_controller.dart';
import 'package:intl/intl.dart';
import 'package:money_manager/app/theme/mmtheme.dart';

class WeekList extends StatelessWidget {
  final TransactionsController transactionsController =
      Get.find<TransactionsController>();

  @override
  Widget build(BuildContext context) {
    transactionsController.weekrange();
    return Container(
                  height: 40.0,
                  width: Get.width,
                  child: Card(
                    margin: EdgeInsets.zero,
                    shape: Border.fromBorderSide(BorderSide.none),
                    child: ListView.builder(
                      itemCount: transactionsController.weeks.length,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        return TextButton(
                          onPressed: () {
                            transactionsController.weekend =
                                transactionsController.weeks[index][0];
                            transactionsController.weekstart =
                                transactionsController.weeks[index][1];
                            transactionsController.update();
                          },
                          child: Container(
                            child: Text(
                              "${transactionsController.weeks[index][0].day} ${DateFormat("EE").format(transactionsController.weeks[index][0])} - ${transactionsController.weeks[index][1].day} ${DateFormat("EE").format(transactionsController.weeks[index][1])}",
                              style: transactionsController.weeks[index][1] ==
                                      transactionsController.weekstart
                                  ? MMTheme.ts4.copyWith(color: Colors.blue)
                                  : MMTheme.ts4.copyWith(color: Colors.black),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                );
  }
}