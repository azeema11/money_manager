import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:money_manager/app/modules/transactions/controllers/transactions_controller.dart';
import 'package:money_manager/app/theme/mm_text_style.dart';

class YearList extends StatelessWidget {
  List<DateTime> years;
  DateTime selectedDate;
  Function(int, DateTime) onPressed;

  YearList({
    required this.years,
    required this.onPressed,
    required this.selectedDate,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40.0,
      width: Get.width,
      child: Card(
        margin: EdgeInsets.zero,
        shape: Border.fromBorderSide(BorderSide.none),
        child: ListView.builder(
          itemCount: years.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return TextButton(
              onPressed: () {
                onPressed(index, years[index]);
              },
              child: Container(
                child: Text(
                  "${years[index].year}",
                  style: years[index] == selectedDate
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
