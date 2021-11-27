import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:money_manager/app/modules/transactions/controllers/transactions_controller.dart';
import 'package:intl/intl.dart';
import 'package:money_manager/app/theme/mm_text_style.dart';

class WeekList extends StatelessWidget {
  final TransactionsController transactionsController =
      Get.find<TransactionsController>();
  DateTime weekStart;
  Function(int, DateTime, DateTime) onPressed;

  WeekList({
    required this.onPressed,
    required this.weekStart,
  });

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
                onPressed(index, transactionsController.weeks[index][0], transactionsController.weeks[index][1],);
              },
              child: Container(
                child: Text(
                  "${transactionsController.weeks[index][0].day} ${DateFormat("EE").format(transactionsController.weeks[index][0])} - ${transactionsController.weeks[index][1].day} ${DateFormat("EE").format(transactionsController.weeks[index][1])}",
                  style: transactionsController.weeks[index][1] == weekStart
                      ? MMTextStyle.ts4.copyWith(color: Colors.blue)
                      : MMTextStyle.ts4.copyWith(color: Colors.black),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
