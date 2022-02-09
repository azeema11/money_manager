import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:money_manager/app/theme/mm_text_style.dart';

class MonthList extends StatelessWidget {
  DateTime selectedDate;
  Function(int, DateTime) onPressed;
  List<DateTime> months;

  MonthList({
    required this.onPressed,
    required this.selectedDate,
    required this.months,
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
          itemCount: months.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return TextButton(
              onPressed: () {
                onPressed(
                  index,
                  months[index],
                );
              },
              child: Container(
                child: Text(
                  "${DateFormat("MMM").format(months[index])} ${months[index].year}",
                  style: months[index] == selectedDate
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
