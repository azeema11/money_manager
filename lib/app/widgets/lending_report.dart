import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:money_manager/app/theme/mmtheme.dart';

class LendingReport extends StatelessWidget {
  double lendPending;
  double borrowPending;
  bool status;
  NumberFormat numberFormat = NumberFormat.currency(
    locale: "en_IN",
    symbol: "₹",
    decimalDigits: 0,
  );
  LendingReport({required this.lendPending, required this.borrowPending, required this.status});
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      child: Container(
        padding: EdgeInsets.all(5.0),
        height: Get.height / 7,
        width: Get.width,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              padding: EdgeInsets.only(
                left: 10.0,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    child: Text(
                      (status? "Completed" : "Pending") + " lend: ",
                      style: MMTheme.ts2,
                    ),
                  ),
                  Container(
                    child: Text(
                      (status? "Completed" : "Pending") + " borrow: ",
                      style: MMTheme.ts2,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.only(
                right: 10.0,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    child: Text(
                      numberFormat.format(lendPending),
                      style: MMTheme.ts2,
                    ),
                  ),
                  Container(
                    child: Text(
                      numberFormat.format(borrowPending),
                      style: MMTheme.ts2,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
