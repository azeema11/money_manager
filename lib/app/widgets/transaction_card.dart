import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:money_manager/app/theme/mm_text_style.dart';

class TransactionCard extends StatelessWidget {
  int id;
  double amount;
  String description;
  DateTime time;
  VoidCallback onTap;
  String type;
  NumberFormat numberFormat = NumberFormat.currency(
    locale: "en_IN",
    symbol: "₹",
    decimalDigits: 0,
  );
  TransactionCard({
    required this.id,
    required this.amount,
    required this.time,
    required this.description,
    required this.onTap,
    required this.type,
  });

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      background: Container(
        color: Colors.red,
        child: Icon(
          Icons.delete,
          size: 28,
        ),
      ),
      confirmDismiss: (direction) async {
        bool confirm = false;
        await Get.defaultDialog(
          title: "Confirm Delete",
          titleStyle: MMTextStyle.ts3,
          middleText: "Do you want to delete the data?",
          middleTextStyle: MMTextStyle.ts3,
          textCancel: "Back",
          textConfirm: "Confirm",
          confirmTextColor: Colors.white,
          onCancel: () {
            Get.back();
          },
          onConfirm: () {
            Get.back();
            confirm = true;
            onTap();
          },
        );
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
                    style: MMTextStyle.ts3.copyWith(
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Text(
                    type,
                    style: MMTextStyle.ts4,
                  ),
                  Text(
                    DateFormat('yyyy-MM-dd kk:mm').format(time),
                    style: MMTextStyle.ts4,
                  ),
                ],
              ),
              Spacer(
                flex: 10,
              ),
              Container(
                child: Text(
                  numberFormat.format(amount),
                  style: MMTextStyle.ts1.copyWith(
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
