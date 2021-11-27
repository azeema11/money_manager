import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:money_manager/app/data/database/moor_database.dart';
import 'package:money_manager/app/theme/mm_text_style.dart';

class PlanCard extends StatelessWidget {
  PlanData plan;
  int balance;
  Function(PlanData) onPlanEdit;
  Function(PlanSpend) onSpendEdit;
  List<PlanSpend> spends;
  NumberFormat numberFormat = NumberFormat.currency(
    locale: "en_IN",
    symbol: "₹",
    decimalDigits: 0,
  );
  Function(PlanData) onPlanDelete;
  Function(PlanSpend) onSpendDelete;

  PlanCard({
    required this.balance,
    required this.spends,
    required this.onPlanDelete,
    required this.onSpendDelete,
    required this.onPlanEdit,
    required this.onSpendEdit,
    required this.plan,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.only(
        top: 5,
        left: 5,
        right: 5,
        bottom: 5,
      ),
      child: Container(
        padding: EdgeInsets.fromLTRB(15.0, 10.0, 15.0, 15.0),
        child: Column(
          children: [
            Row(
              children: [
                Text(
                  plan.title,
                  style: MMTextStyle.ts3.copyWith(
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Spacer(),
                InkWell(
                  borderRadius: BorderRadius.all(Radius.circular(20.0)),
                  onTap: () async {
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
                        onPlanDelete(plan);
                        Get.back();
                      },
                    );
                  },
                  child: Container(
                    height: 30,
                    width: 30,
                    child: Icon(
                      Icons.delete,
                      size: 20,
                    ),
                  ),
                ),
                // InkWell(
                //   borderRadius: BorderRadius.all(Radius.circular(20.0)),
                //   onTap: () {
                //     onPlanEdit(plan);
                //   },
                //   child: Container(
                //     height: 30,
                //     width: 30,
                //     child: Icon(
                //       Icons.edit,
                //       size: 20,
                //     ),
                //   ),
                // ),
              ],
            ),
            Row(
              children: [
                Text(
                  "Allocated",
                  style: MMTextStyle.ts4,
                ),
                Spacer(),
                Text(
                  numberFormat.format(plan.allocation),
                  style: MMTextStyle.ts4.copyWith(
                    color: Colors.blue,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Text(
                  balance >= 0 ? "Balance" : "Overhead",
                  style: MMTextStyle.ts4,
                ),
                Spacer(),
                Text(
                  numberFormat.format(balance.abs()),
                  style: MMTextStyle.ts4.copyWith(
                    color: Colors.blue,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
            ListView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: spends.length,
              itemBuilder: (context, index) {
                return Card(
                  elevation: 2,
                  child: Container(
                    padding: EdgeInsets.only(
                      left: 15,
                      top: 5,
                      bottom: 10,
                      right: 10,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Text(
                              spends[index].description,
                              style: MMTextStyle.ts4,
                            ),
                            Spacer(),
                            InkWell(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(18.0)),
                              onTap: () async {
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
                                    onSpendDelete(spends[index]);
                                    Get.back();
                                  },
                                );
                              },
                              child: Container(
                                height: 27,
                                width: 27,
                                child: Icon(
                                  Icons.delete,
                                  size: 18,
                                ),
                              ),
                            ),
                            // InkWell(
                            //   borderRadius:
                            //       BorderRadius.all(Radius.circular(18.0)),
                            //   onTap: () {
                            //     onSpendEdit(spends[index]);
                            //   },
                            //   child: Container(
                            //     height: 27,
                            //     width: 27,
                            //     child: Icon(
                            //       Icons.edit,
                            //       size: 18,
                            //     ),
                            //   ),
                            // ),
                          ],
                        ),
                        Text(
                          numberFormat.format(spends[index].amount),
                          style: MMTextStyle.ts4.copyWith(
                            color: Colors.blue,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
