import 'package:flutter/material.dart';
import 'package:flutter_rounded_date_picker/flutter_rounded_date_picker.dart';
import 'package:form_field_validator/form_field_validator.dart';

import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:money_manager/app/controllers/floating_action_controller.dart';
import 'package:money_manager/app/data/database/moor_database.dart';
import 'package:money_manager/app/theme/mmtheme.dart';
import 'package:money_manager/app/widgets/lending_card.dart';
import 'package:money_manager/app/widgets/lending_floating_action.dart';
import 'package:money_manager/app/widgets/lending_report.dart';
import 'package:money_manager/app/widgets/loading.dart';

import '../controllers/lendings_controller.dart';

class LendingsView extends GetView<LendingsController> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<LendingsController>(builder: (_) {
      return Scaffold(
        appBar: AppBar(
          title: Text(
            _.lendingIndex == 0 ? "Lend" : "Borrow",
          ),
        ),
        body: Column(
          children: [
            Expanded(
              child: StreamBuilder(
                  stream: _.getLendings(_.status),
                  builder: (context, AsyncSnapshot snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return Loading();
                     } else {
                      _.sort(snapshot.data);
                      return Column(
                        children: [
                          BottomNavigationBar(
                            currentIndex: _.lendingIndex,
                            iconSize: 0,
                            selectedFontSize: 18,
                            unselectedFontSize: 16,
                            type: 
               BottomNavigationBarType.fixed,
                            onTap: _.onTapLending,
                            items: [
                              BottomNavigationBarItem(
                                icon: Icon(null),
                                label: "Lend",
                              ),
                              BottomNavigationBarItem(
                                icon: Icon(null),
                                label: "Borrow",
                              ),
                            ],
                          ),
                          LendingReport(
                            lendPending: _.total(_.lendData),
                            borrowPending: _.total(_.borrowData),
                            status: _.status,
                          ),
                          BottomNavigationBar(
                            currentIndex: _.lendingStatus,
                            iconSize: 0,
                            selectedFontSize: 18,
                            unselectedFontSize: 16,
                            type: BottomNavigationBarType.fixed,
                            onTap: _.onTapStatus,
                            items: [
                              BottomNavigationBarItem(
                                icon: Icon(null),
                                label: "Pending",
                              ),
                              BottomNavigationBarItem(
                                icon: Icon(null),
                                label: "Complete",
                              ),
                            ],
                          ),
                          if ((_.lendingIndex == 0 && _.lendData.length == 0) ||
                              (_.lendingIndex == 1 && _.borrowData.length == 0))
                            Expanded(
                              child: Center(
                                child: Text("No data"),
                              ),
                            )
                          else
                            Expanded(
                              child: ListView.builder(
                                itemCount: _.lendingIndex == 0
                                    ? _.lendData.length
                                    : _.borrowData.length,
                                //shrinkWrap: true,
                                //physics: NeverScrollableScrollPhysics(),
                                itemBuilder: (context, index) {
                                  return LendingCard(
                                    id: index,
                                    status: _.lendingIndex == 0
                                        ? _.lendData[index].status
                                        : _.borrowData[index].status,
                                    onSwipeRight: () async {
                                      if (_.lendingIndex == 0) {
                                        LendData newLend = LendData(
                                            id: _.lendData[index].id,
                                            description:
                                                _.lendData[index].description,
                                            amount: _.lendData[index].amount,
                                            time: _.lendData[index].time,
                                            status: !_.lendData[index].status);
                                        await _.database.updateLend(newLend);
                                        _.update();
                                      } else {
                                        BorrowData newBorrow = BorrowData(
                                            id: _.borrowData[index].id,
                                            description:
                                                _.borrowData[index].description,
                                            amount: _.borrowData[index].amount,
                                            time: _.borrowData[index].time,
                                            status:
                                                !_.borrowData[index].status);
                                        await _.database
                                            .updateBorrow(newBorrow);
                                        _.update();
                                      }
                                    },
                                    onSwipeLeft: () async {
                                      if (_.lendingIndex == 0) {
                                        await _.database
                                            .deleteLend(_
                                                .lendData[index]);
                                        _.update();
                                      } else {
                                        await _.database
                                            .deleteBorrow(
                                                _.borrowData[index]);
                                        _.update();
                                      }
                                    },
                                    amount: _.lendingIndex == 0
                                        ? _.lendData[index].amount
                                        : _.borrowData[index].amount,
                                    time: _.lendingIndex == 0
                                        ? _.lendData[index].time
                                        : _.borrowData[index].time,
                                    description: _.lendingIndex == 0
                                        ? _.lendData[index].description
                                        : _.borrowData[index].description, 
                                  );
                                },
                              ),
                            ),
                        ],
                      );
                    }
                  }),
            ),
          ],
        ),
        floatingActionButton: GetBuilder<FloatingActionController>(
          builder: (_) {
            return AnimatedOpacity(
              opacity: _.showFloatingAction? 1 : 0, 
              duration: Duration(milliseconds: 150),
              child: LendingFloatingAction(),
            );
          },
        ),
      );
    });
  }
}
