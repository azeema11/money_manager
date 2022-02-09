import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:money_manager/app/theme/mm_text_style.dart';

class DateList extends StatelessWidget {
  List<DateTime> dates;
  DateTime selectedDate;
  Function(int, DateTime) onPressed;

  DateList({
    required this.dates,
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
          itemCount: dates.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return TextButton(
              onPressed: () {
                onPressed(
                  index,
                  dates[index],
                );
              },
              child: Container(
                child: Text(
                  "${dates[index].day} ${DateFormat("EE").format(dates[index])}",
                  style: dates[index] == selectedDate
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
