import 'package:flutter/material.dart';
import 'package:flutter_rounded_date_picker/flutter_rounded_date_picker.dart';
import 'package:form_field_validator/form_field_validator.dart';

import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:money_manager/app/data/database/moor_database.dart';
import 'package:money_manager/app/modules/transactions/views/daily_view.dart';
import 'package:money_manager/app/modules/transactions/views/monthly_view.dart';
import 'package:money_manager/app/modules/transactions/views/weekly_view.dart';
import 'package:money_manager/app/modules/transactions/views/yearly_view.dart';
import 'package:money_manager/app/theme/mmtheme.dart';

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
        floatingActionButton: FloatingActionButton(
          onPressed: () async {
            late double amount;
            late String description;
            Color dateColor = Colors.black;
            DateTime date = DateTime(0, 0, 0);
            await Get.bottomSheet(
              Container(
                height: Get.height / 2.7,
                padding: EdgeInsets.fromLTRB(15.0, 20.0, 15.0, 10.0),
                color: Colors.white,
                child: Form(
                  key: _.formKey,
                  child: StatefulBuilder(builder: (context, setModalState) {
                    return Column(
                      children: [
                        Container(
                          child: TextFormField(
                            textCapitalization: TextCapitalization.sentences,
                            focusNode: _.f1,
                            validator: RequiredValidator(
                              errorText: "Enter " +
                                  (_.transactionIndex == 0
                                      ? "Purpose"
                                      : "Source"),
                            ),
                            decoration: InputDecoration(
                              labelText: _.transactionIndex == 0
                                  ? "Purpose"
                                  : "Source",
                              focusColor: Colors.blue,
                              border: OutlineInputBorder(
                                borderSide: BorderSide(
                                  width: 2.0,
                                ),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(17.0)),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Colors.blue,
                                  width: 2.0,
                                ),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(17.0)),
                              ),
                            ),
                            onChanged: (value) {
                              description = value;
                            },
                          ),
                        ),
                        SizedBox(
                          height: 15.0,
                        ),
                        Container(
                          child: TextFormField(
                            keyboardType: TextInputType.number,
                            focusNode: _.f2,
                            validator: RequiredValidator(
                              errorText: "Enter Amount",
                            ),
                            decoration: InputDecoration(
                              labelText: 'Amount',
                              focusColor: Colors.blue,
                              border: OutlineInputBorder(
                                borderSide: BorderSide(
                                  width: 3.0,
                                ),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(17.0)),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Colors.blue,
                                  width: 2.0,
                                ),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(17.0)),
                              ),
                            ),
                            onChanged: (value) {
                              amount = double.parse(value);
                            },
                          ),
                        ),
                        Container(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                child: Text(
                                  date == DateTime(0, 0, 0)
                                      ? 'No date chosen'
                                      : DateFormat('yyyy-MM-dd kk:mm')
                                          .format(date),
                                  style: MMTheme.ts4.copyWith(color: dateColor),
                                ),
                              ),
                              TextButton(
                                child: Text(
                                  "Choose Date and Time",
                                  style: MMTheme.ts4,
                                ),
                                onPressed: () async {
                                  DateTime? selectedDate;
                                  TimeOfDay? selectedTime;
                                  selectedDate = await showRoundedDatePicker(
                                    context: context,
                                    initialDate: DateTime.now(),
                                    firstDate: DateTime(2021, 6, 20),
                                    lastDate: DateTime(2121, 6, 20),
                                  );
                                  selectedTime = await showRoundedTimePicker(
                                    context: context,
                                    initialTime: TimeOfDay.now(),
                                  );
                                  if (selectedDate != null &&
                                      selectedTime != null) {
                                    date = DateTime(
                                        selectedDate.year,
                                        selectedDate.month,
                                        selectedDate.day,
                                        selectedTime.hour,
                                        selectedTime.minute);
                                    setModalState(() {});
                                  }
                                },
                              ),
                            ],
                          ),
                        ),
                        Container(
                          color: Colors.blue,
                          height: 40.0,
                          child: TextButton(
                            onPressed: () async {
                              if (_.formKey.currentState!.validate() &&
                                  date != DateTime(0, 0, 0)) {
                                if (_.transactionIndex == 0) {
                                  await _.database
                                      .insertNewExpense(ExpenseCompanion.insert(
                                    purpose: description,
                                    amount: amount,
                                    time: date,
                                  ));
                                } else {
                                  await _.database
                                      .insertNewIncome(IncomeCompanion.insert(
                                    source: description,
                                    amount: amount,
                                    time: date,
                                  ));
                                }
                                Get.back();
                                _.update();
                              } else if (date == DateTime(0, 0, 0)) {
                                dateColor = Colors.red;
                                setModalState(() {});
                              }
                            },
                            child: Text(
                              "Add " +
                                  (_.transactionIndex == 0
                                      ? "Expense"
                                      : "Income"),
                              style: MMTheme.ts4.copyWith(color: Colors.white),
                            ),
                          ),
                        ),
                      ],
                    );
                  }),
                ),
              ),
            );
          },
          child: Icon(Icons.add),
        ),
      );
    });
  }
}
