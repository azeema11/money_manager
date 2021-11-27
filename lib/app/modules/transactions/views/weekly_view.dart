import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:money_manager/app/modules/transactions/controllers/transactions_controller.dart';
import 'package:money_manager/app/theme/mm_text_style.dart';
import 'package:money_manager/app/widgets/loading.dart';
import 'package:money_manager/app/widgets/transaction_card.dart';
import 'package:money_manager/app/widgets/transaction_report.dart';

class WeeklyView extends StatelessWidget {
  final TransactionsController transactionsController =
      Get.find<TransactionsController>();

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: transactionsController.getWeeklyTransactions(),
        builder: (context, AsyncSnapshot snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Loading();
          } else {
            transactionsController.sort(snapshot.data);
            return Column(
              children: [
                TransactionReport(
                  expense: transactionsController
                      .total(transactionsController.expenseData),
                  income: transactionsController
                      .total(transactionsController.incomeData),
                ),
                BottomNavigationBar(
                  currentIndex: transactionsController.transactionIndex,
                  iconSize: 0,
                  selectedFontSize: 17,
                  unselectedFontSize: 15,
                  type: BottomNavigationBarType.fixed,
                  onTap: transactionsController.onTap,
                  items: [
                    BottomNavigationBarItem(
                      icon: Icon(null),
                      label: "Expense",
                    ),
                    BottomNavigationBarItem(
                      icon: Icon(null),
                      label: "Income",
                    ),
                  ],
                ),
                if ((transactionsController.transactionIndex == 0 &&
                        transactionsController.expenseData.length == 0) ||
                    (transactionsController.transactionIndex == 1 &&
                        transactionsController.incomeData.length == 0))
                  Expanded(
                    child: Center(
                      child: Text(
                        "No data",
                        style: MMTextStyle.ts3,
                      ),
                    ),
                  )
                else
                  Expanded(
                    child: ListView.builder(
                      controller: transactionsController
                          .floatingActionController.scrollController,
                      itemCount: transactionsController.transactionIndex == 0
                          ? transactionsController.expenseData.length
                          : transactionsController.incomeData.length,
                      //shrinkWrap: true,
                      //physics: NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) {
                        return TransactionCard(
                          id: index,
                          type: transactionsController.transactionIndex == 0
                              ? transactionsController.expenseData[index].type
                              : transactionsController.incomeData[index].type,
                          onTap: () async {
                            if (transactionsController.transactionIndex == 0) {
                              await transactionsController.database
                                  .deleteExpense(transactionsController
                                      .expenseData[index]);
                              transactionsController.update();
                            } else {
                              await transactionsController.database
                                  .deleteIncome(
                                      transactionsController.incomeData[index]);
                              transactionsController.update();
                            }
                          },
                          amount: transactionsController.transactionIndex == 0
                              ? transactionsController.expenseData[index].amount
                              : transactionsController.incomeData[index].amount,
                          time: transactionsController.transactionIndex == 0
                              ? transactionsController.expenseData[index].time
                              : transactionsController.incomeData[index].time,
                          description:
                              transactionsController.transactionIndex == 0
                                  ? transactionsController
                                      .expenseData[index].purpose
                                  : transactionsController
                                      .incomeData[index].source,
                        );
                      },
                    ),
                  ),
              ],
            );
          }
        });
  }
}
