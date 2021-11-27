import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:money_manager/app/theme/mm_text_style.dart';

class TransactionReport extends StatelessWidget {
  double expense;
  double income;
  NumberFormat numberFormat = NumberFormat.currency(
    locale: "en_IN",
    symbol: "₹",
    decimalDigits: 0,
  );
  TransactionReport({required this.expense, required this.income});
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
                      "Total Expense incurred: ",
                      style: MMTextStyle.ts3.copyWith(
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  Container(
                    child: Text(
                      "Total Income received: ",
                      style: MMTextStyle.ts3.copyWith(
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  Container(
                    child: Text(
                      "Total " +
                          (income - expense >= 0 ? "Savings: " : "Overhead: "),
                      style: MMTextStyle.ts3.copyWith(
                        fontWeight: FontWeight.w600,
                      ),
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
                      numberFormat.format(expense),
                      style: MMTextStyle.ts3.copyWith(
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  Container(
                    child: Text(
                      numberFormat.format(income),
                      style: MMTextStyle.ts3.copyWith(
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  Container(
                    child: Text(
                      numberFormat.format((income - expense).abs()),
                      style: MMTextStyle.ts3.copyWith(
                        fontWeight: FontWeight.w600,
                      ),
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
