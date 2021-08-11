import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:money_manager/app/controllers/floating_action_controller.dart';
import 'package:money_manager/app/modules/transactions/views/daily_view.dart';
import 'package:money_manager/app/modules/transactions/views/monthly_view.dart';
import 'package:money_manager/app/modules/transactions/views/weekly_view.dart';
import 'package:money_manager/app/modules/transactions/views/yearly_view.dart';
import 'package:money_manager/app/widgets/date_list.dart';
import 'package:money_manager/app/widgets/month_list.dart';
import 'package:money_manager/app/widgets/transaction_floating_action.dart';
import 'package:money_manager/app/widgets/week_list.dart';
import 'package:money_manager/app/widgets/year_list.dart';

import '../controllers/transactions_controller.dart';

class TransactionsView extends GetView<TransactionsController> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<TransactionsController>(builder: (_) {
      return Scaffold(
        appBar: AppBar(
          title: Text(
            _.transactionIndex == 0 ? "Expense" : "Income",
          ),
        ),
        body: Container(
          child: Column(
            children: [
              BottomNavigationBar(
                currentIndex: _.typeIndex,
                onTap: _.changetype,
                type: BottomNavigationBarType.fixed,
                iconSize: 0,
                selectedFontSize: 18,
                unselectedFontSize: 16,
                items: [
                  BottomNavigationBarItem(
                    icon: Icon(null),
                    label: "Daily",
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(null),
                    label: "Weekly",
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(null),
                    label: "Monthly",
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(null),
                    label: "Yearly",
                  ),
                ],
              ),
              [
                DateList(),
                WeekList(),
                MonthList(),
                YearList(),
              ][_.typeIndex],
              Expanded(
                child: [
                  DailyView(),
                  WeeklyView(),
                  MonthlyView(),
                  YearlyView()
                ][_.typeIndex],
              ),
            ],
          ),
        ),
        floatingActionButton: GetBuilder<FloatingActionController>(
          builder: (_) {
            return AnimatedOpacity(
              opacity: _.showFloatingAction? 1 : 0, 
              duration: Duration(milliseconds: 150),
              child: TransactionFloatingAction(),
            );
          },
        ),
      );
    });
  }
}
