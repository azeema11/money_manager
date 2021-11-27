import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:money_manager/app/modules/transactions/controllers/transactions_controller.dart';
import 'package:money_manager/app/theme/mm_text_style.dart';

class YearList extends StatelessWidget {
  final TransactionsController transactionsController =
      Get.find<TransactionsController>();
  DateTime selectedDate;
  Function(int, DateTime) onPressed;

  YearList({
    required this.onPressed,
    required this.selectedDate,
  });

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
                onPressed(index, transactionsController.years[index]);
              },
              child: Container(
                child: Text(
                  "${transactionsController.years[index].year}",
                  style: transactionsController.years[index] ==
                          selectedDate
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
