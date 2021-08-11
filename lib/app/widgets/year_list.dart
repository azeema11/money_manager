import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:money_manager/app/modules/transactions/controllers/transactions_controller.dart';
import 'package:money_manager/app/theme/mmtheme.dart';

class YearList extends StatelessWidget {
  final TransactionsController transactionsController =
      Get.find<TransactionsController>();

  @override
  Widget build(BuildContext context) {
    transactionsController.yearrange();
    return Container(
                  height: 40.0,
                  width: Get.width,
                  child: Card(
                    margin: EdgeInsets.zero,
                    shape: Border.fromBorderSide(BorderSide.none),
                    child: ListView.builder(
                      itemCount: transactionsController.years.length,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        return TextButton(
                          onPressed: () {
                            transactionsController.selectedDate =
                                transactionsController.years[index];
                            transactionsController.update();
                          },
                          child: Container(
                            child: Text(
                              "${transactionsController.years[index].year}",
                              style: transactionsController.years[index] ==
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