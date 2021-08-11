import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:money_manager/app/theme/mmtheme.dart';

class LendingCard extends StatelessWidget {
  int id;
  double amount;
  String description;
  DateTime time;
  VoidCallback onSwipeRight;
  VoidCallback onSwipeLeft;
  bool status;
  NumberFormat numberFormat = NumberFormat.currency(
    locale: "en_IN",
    symbol: "₹",
    decimalDigits: 0,
  );
  LendingCard({
    required this.id,
    required this.amount,
    required this.time,
    required this.description,
    required this.onSwipeRight,
    required this.onSwipeLeft,
    required this.status,
  });

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      background: Container(
        color: status? Colors.red : Colors.green,
        child: Icon(
          status? Icons.close : Icons.check,
          size: 28,
        ),
      ),
      secondaryBackground: Container(
        color: Colors.red,
        child: Icon(
          Icons.delete,
          size: 28,
        ),
      ),
      confirmDismiss: (direction) async {
        bool confirm = false;
        if (direction == DismissDirection.startToEnd){
          await Get.defaultDialog(
            title: "Confirm " + (status? "Pending" : "Complete"),
            titleStyle: MMTheme.ts3,
            middleText: "Do you want to mark data as " + (status? "Pending?" : "Complete?"),
            textCancel: "Back",
            textConfirm: "Confirm",
            confirmTextColor: Colors.white,
            onCancel: () {
              Get.back();
            },
            onConfirm: () {
              Get.back();
              confirm = true;
              onSwipeRight();
            },
          );
        } else {
            await Get.defaultDialog(
            title: "Confirm Delete",
            titleStyle: MMTheme.ts3,
            middleText: "Do you want to delete the data?",
            textCancel: "Back",
            textConfirm: "Confirm",
            confirmTextColor: Colors.white,
            onCancel: () {
              Get.back();
            },
            onConfirm: () {
              Get.back();
              confirm = true;
              onSwipeLeft();
            },
          );
        }
        return confirm;
      },
      key: Key(id.toString()),
      child: Card(
        child: Container(
          padding: EdgeInsets.all(15.0),
          child: Row(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    description,
                    style: MMTheme.ts1,
                  ),
                  Text(
                    DateFormat('yyyy-MM-dd kk:mm').format(time),
                    style: MMTheme.ts3,
                  ),
                ],
              ),
              Spacer(
                flex: 10,
              ),
              Container(
                child: Text(
                  numberFormat.format(amount),
                  style: MMTheme.ts1.copyWith(
                    color: Colors.blue,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
