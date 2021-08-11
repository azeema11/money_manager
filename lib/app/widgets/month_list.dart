import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:money_manager/app/modules/transactions/controllers/transactions_controller.dart';
import 'package:intl/intl.dart';
import 'package:money_manager/app/theme/mmtheme.dart';

class MonthList extends StatelessWidget {
  final TransactionsController transactionsController =
      Get.find<TransactionsController>();

  @override
  Widget build(BuildContext context) {
    transactionsController.monthrange();
    return Container(
                  height: 40.0,
                  width: Get.width,
                  child: Card(
                    margin: EdgeInsets.zero,
                    shape: Border.fromBorderSide(BorderSide.none),
                    child: ListView.builder(
                      itemCount: transactionsController.months.length,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        return TextButton(
                          onPressed: () {
                            transactionsController.selectedDate =
                                transactionsController.months[index];
                            transactionsController.update();
                          },
                          child: Container(
                            child: Text(
                              "${DateFormat("MMM").format(transactionsController.months[index])} ${transactionsController.months[index].year}",
                              style: transactionsController.months[index] ==
                                      transactionsController.selectedDate
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