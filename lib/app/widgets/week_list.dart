import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:money_manager/app/modules/transactions/controllers/transactions_controller.dart';
import 'package:intl/intl.dart';
import 'package:money_manager/app/theme/mm_text_style.dart';

class WeekList extends StatelessWidget {
  List<List<DateTime>> weeks;
  DateTime weekStart;
  Function(int, DateTime, DateTime) onPressed;

  WeekList({
    required this.onPressed,
    required this.weekStart,
    required this.weeks,
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
          itemCount: weeks.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return TextButton(
              onPressed: () {
                onPressed(
                  index,
                  weeks[index][0],
                  weeks[index][1],
                );
              },
              child: Container(
                child: Text(
                  "${weeks[index][0].day} ${DateFormat("EE").format(
                    weeks[index][0])} - ${weeks[index][1].day} ${DateFormat("EE").format(weeks[index][1])}",
                  style: weeks[index][1] == weekStart
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
