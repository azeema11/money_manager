import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:get/get.dart';
import 'package:money_manager/app/modules/lendings/controllers/lendings_controller.dart';
import 'package:money_manager/app/theme/mmtheme.dart';
import 'package:intl/intl.dart';
import 'package:money_manager/app/data/database/moor_database.dart';
import 'package:flutter_rounded_date_picker/flutter_rounded_date_picker.dart';
import 'package:form_field_validator/form_field_validator.dart';

class LendingFloatingAction extends StatelessWidget {
  final LendingsController lendingsController = Get.find<LendingsController>();

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
          label: "New Borrow",
          labelStyle: MMTheme.ts4.copyWith(color: Colors.white),
          onTap: () async {
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
                  key: lendingsController.formKey,
                  child: StatefulBuilder(builder: (context, setModalState) {
                    return Column(
                      children: [
                        Container(
                          child: TextFormField(
                            textCapitalization: TextCapitalization.sentences,
                            focusNode: lendingsController.f1,
                            validator: RequiredValidator(
                              errorText: "Enter Description",
                            ),
                            decoration: InputDecoration(
                              labelText: "Description",
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
                            focusNode: lendingsController.f2,
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
                              if (lendingsController.formKey.currentState!
                                      .validate() &&
                                  date != DateTime(0, 0, 0)) {
                                dateColor = Colors.black;
                                setModalState(() {});
                                await lendingsController.database
                                    .insertNewBorrow(BorrowCompanion.insert(
                                  amount: amount,
                                  time: date,
                                  description: description,
                                ));
                                Get.back();
                                lendingsController.update();
                              } else if (date == DateTime(0, 0, 0)) {
                                dateColor = Colors.red;
                                setModalState(() {});
                              }
                            },
                            child: Text(
                              "Add Borrow",
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
        ),
        SpeedDialChild(
          child: Icon(
            Icons.arrow_upward,
            color: Colors.red,
          ),
          label: "New Lend",
          labelStyle: MMTheme.ts4.copyWith(color: Colors.white),
          onTap: () async {
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
                  key: lendingsController.formKey,
                  child: StatefulBuilder(builder: (context, setModalState) {
                    return Column(
                      children: [
                        Container(
                          child: TextFormField(
                            textCapitalization: TextCapitalization.sentences,
                            focusNode: lendingsController.f1,
                            validator: RequiredValidator(
                              errorText: "Enter Description",
                            ),
                            decoration: InputDecoration(
                              labelText: "Description",
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
                            focusNode: lendingsController.f2,
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
                              if (lendingsController.formKey.currentState!
                                      .validate() &&
                                  date != DateTime(0, 0, 0)) {
                                dateColor = Colors.black;
                                setModalState(() {});
                                await lendingsController.database
                                    .insertNewLend(LendCompanion.insert(
                                  amount: amount,
                                  time: date,
                                  description: description,
                                ));
                                Get.back();
                                lendingsController.update();
                              } else if (date == DateTime(0, 0, 0)) {
                                dateColor = Colors.red;
                                setModalState(() {});
                              }
                            },
                            child: Text(
                              "Add Lend",
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
        ),
      ],
    );
  }
}
