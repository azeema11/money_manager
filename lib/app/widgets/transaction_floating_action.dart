import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:get/get.dart';
import 'package:money_manager/app/data/transaction_types/expense_types.dart';
import 'package:money_manager/app/data/transaction_types/income_types.dart';
import 'package:money_manager/app/modules/transactions/controllers/transactions_controller.dart';
import 'package:money_manager/app/theme/mmtheme.dart';
import 'package:intl/intl.dart';
import 'package:money_manager/app/data/database/moor_database.dart';
import 'package:flutter_rounded_date_picker/flutter_rounded_date_picker.dart';
import 'package:form_field_validator/form_field_validator.dart';

class TransactionFloatingAction extends StatelessWidget {
  final TransactionsController transactionsController =
      Get.find<TransactionsController>();

  @override
  Widget build(BuildContext context) {
    return SpeedDial(
      backgroundColor: Colors.blue,
      icon: Icons.add,
      activeIcon: Icons.close,
      children: [
        SpeedDialChild(
          child: Icon(
            Icons.arrow_downward,
            color: Colors.green,
          ),
          label: "New Income",
          labelStyle: MMTheme.ts4.copyWith(color: Colors.white),
          onTap: () async {
            late double amount;
            late String description;
            late String type;
            Color dateColor = Colors.black;
            DateTime date = DateTime(0, 0, 0);
            await Get.bottomSheet(
              Container(
                height: Get.height / 2.1,
                padding: EdgeInsets.fromLTRB(15.0, 20.0, 15.0, 10.0),
                color: Colors.white,
                child: Form(
                  key: transactionsController.formKey,
                  child: StatefulBuilder(builder: (context, setModalState) {
                    return Column(
                      children: [
                        Container(
                          child: TextFormField(
                            textCapitalization: TextCapitalization.sentences,
                            focusNode: transactionsController.f1,
                            validator: RequiredValidator(
                              errorText: "Enter Source",
                            ),
                            decoration: InputDecoration(
                              labelText: "Source",
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
                            focusNode: transactionsController.f2,
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
                        SizedBox(
                          height: 15.0,
                        ),
                        Container(
                          child: DropdownButtonFormField(
                            items: List.generate(
                              IncomeTypeName.values.length,
                              (int index) => DropdownMenuItem(
                                value: IncomeTypeName.values.toList()[index],
                                child:
                                    Text(IncomeTypeName.values.toList()[index]),
                              ),
                            ),
                            decoration: InputDecoration(
                              labelText: 'Income Type',
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
                                  width: 3.0,
                                ),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(17.0)),
                              ),
                            ),
                            onChanged: (String? newValue) {
                              if (newValue != null) {
                                type = newValue;
                              }
                              setModalState(() {});
                            },
                            validator: (String? value){
                              if(value == null){
                                return "Select type";
                              }
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
                              if (transactionsController.formKey.currentState!
                                      .validate() &&
                                  date != DateTime(0, 0, 0)) {
                                dateColor = Colors.black;
                                setModalState(() {});
                                await transactionsController.database
                                    .insertNewIncome(IncomeCompanion.insert(
                                  source: description,
                                  amount: amount,
                                  time: date,
                                  type: type,
                                ));
                                Get.back();
                                transactionsController.update();
                              } else if (date == DateTime(0, 0, 0)) {
                                dateColor = Colors.red;
                                setModalState(() {});
                              }
                            },
                            child: Text(
                              "Add Income",
                              style: MMTheme.ts4.copyWith(color: Colors.white),
                            ),
                          ),
                        ),
                      ],
                    );
                  }),
                ),
              ),
              isScrollControlled: true,
            );
          },
        ),
        SpeedDialChild(
          child: Icon(
            Icons.arrow_upward,
            color: Colors.red,
          ),
          label: "New Expense",
          labelStyle: MMTheme.ts4.copyWith(color: Colors.white),
          onTap: () async {
            late double amount;
            late String description;
            late String type;
            Color dateColor = Colors.black;
            DateTime date = DateTime(0, 0, 0);
            await Get.bottomSheet(
              Container(
                height: Get.height / 2.1,
                padding: EdgeInsets.fromLTRB(15.0, 20.0, 15.0, 10.0),
                color: Colors.white,
                child: Form(
                  key: transactionsController.formKey,
                  child: StatefulBuilder(builder: (context, setModalState) {
                    return Column(
                      children: [
                        Container(
                          child: TextFormField(
                            textCapitalization: TextCapitalization.sentences,
                            focusNode: transactionsController.f1,
                            validator: RequiredValidator(
                              errorText: "Enter Purpose",
                            ),
                            decoration: InputDecoration(
                              labelText: "Purpose",
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
                            focusNode: transactionsController.f2,
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
                        SizedBox(
                          height: 15.0,
                        ),
                        Container(
                          child: DropdownButtonFormField(
                            items: List.generate(
                              ExpenseTypeName.values.length,
                              (int index) => DropdownMenuItem(
                                value: ExpenseTypeName.values.toList()[index],
                                child: Text(
                                    ExpenseTypeName.values.toList()[index]),
                              ),
                            ),
                            decoration: InputDecoration(
                              labelText: 'Expense Type',
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
                                  width: 3.0,
                                ),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(17.0)),
                              ),
                            ),
                            onChanged: (String? newValue) {
                              if (newValue != null) {
                                type = newValue;
                              }
                              setModalState(() {});
                            },
                            validator: (String? value){
                              if(value == null){
                                return "Select type";
                              }
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
                              if (transactionsController.formKey.currentState!
                                      .validate() &&
                                  date != DateTime(0, 0, 0)) {
                                dateColor = Colors.black;
                                setModalState(() {});
                                await transactionsController.database
                                    .insertNewExpense(ExpenseCompanion.insert(
                                  purpose: description,
                                  amount: amount,
                                  time: date,
                                  type: type,
                                ));
                                Get.back();
                                transactionsController.update();
                              } else if (date == DateTime(0, 0, 0)) {
                                dateColor = Colors.red;
                                setModalState(() {});
                              }
                            },
                            child: Text(
                              "Add Expense",
                              style: MMTheme.ts4.copyWith(color: Colors.white),
                            ),
                          ),
                        ),
                      ],
                    );
                  }),
                ),
              ),
              isScrollControlled: true,
            );
          },
        ),
      ],
    );
  }
}
