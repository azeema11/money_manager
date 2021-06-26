import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:money_manager/app/theme/mmtheme.dart';

class LendingCard extends StatelessWidget {
  int id;
  double amount;
  String description;
  DateTime time;
  VoidCallback onTap;
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
    required this.onTap,
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
      onDismissed: (direction) {
        onTap();
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
