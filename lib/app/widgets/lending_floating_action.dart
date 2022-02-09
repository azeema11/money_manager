import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:get/get.dart';
import 'package:money_manager/app/theme/mm_text_style.dart';
import 'package:intl/intl.dart';
import 'package:money_manager/app/data/database/moor_database.dart';
import 'package:flutter_rounded_date_picker/flutter_rounded_date_picker.dart';
import 'package:form_field_validator/form_field_validator.dart';

class LendingFloatingAction extends StatelessWidget {
  GlobalKey<FormState> formKey;
  FocusNode f1, f2;
  Function(BorrowCompanion) addBorrowQuery;
  Function(LendCompanion) addLendQuery;
  double amount = 0;
  String description = "";
  Color dateColor = Colors.black;
  DateTime date = DateTime(0, 0, 0);

  LendingFloatingAction({
    required this.f1,
    required this.f2,
    required this.formKey,
    required this.addBorrowQuery,
    required this.addLendQuery,
  });

  Future<void> addData(String lendType) async {
    await Get.bottomSheet(
      Container(
        height: Get.height / 2.7,
        padding: EdgeInsets.fromLTRB(15.0, 20.0, 15.0, 10.0),
        color: Colors.white,
        child: Form(
          key: formKey,
          child: StatefulBuilder(builder: (context, setModalState) {
            return Column(
              children: [
                Container(
                  child: TextFormField(
                    textCapitalization: TextCapitalization.sentences,
                    focusNode: f1,
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
                        borderRadius: BorderRadius.all(Radius.circular(17.0)),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.blue,
                          width: 2.0,
                        ),
                        borderRadius: BorderRadius.all(Radius.circular(17.0)),
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
                    focusNode: f2,
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
                        borderRadius: BorderRadius.all(Radius.circular(17.0)),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.blue,
                          width: 2.0,
                        ),
                        borderRadius: BorderRadius.all(Radius.circular(17.0)),
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
                              : DateFormat('yyyy-MM-dd kk:mm').format(date),
                          style: MMTextStyle.ts4.copyWith(color: dateColor),
                        ),
                      ),
                      TextButton(
                        child: Text(
                          "Choose Date and Time",
                          style: MMTextStyle.ts4,
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
                          if (selectedDate != null && selectedTime != null) {
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
                      if (formKey.currentState!.validate() &&
                          date != DateTime(0, 0, 0)) {
                        dateColor = Colors.black;
                        setModalState(() {});
                        await (lendType == "Borrow"
                            ? addBorrowQuery(
                                BorrowCompanion.insert(
                                  amount: amount,
                                  time: date,
                                  description: description,
                                ),
                              )
                            : addLendQuery(
                                LendCompanion.insert(
                                  amount: amount,
                                  time: date,
                                  description: description,
                                ),
                              ));
                      } else if (date == DateTime(0, 0, 0)) {
                        dateColor = Colors.red;
                        setModalState(() {});
                      }
                    },
                    child: Text(
                      "Add $lendType",
                      style: MMTextStyle.ts4.copyWith(color: Colors.white),
                    ),
                  ),
                ),
              ],
            );
          }),
        ),
      ),
    );
  }

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
          labelStyle: MMTextStyle.ts4.copyWith(color: Colors.white),
          onTap: () async {
            await addData(
              "Borrow",
            );
          },
        ),
        SpeedDialChild(
          child: Icon(
            Icons.arrow_upward,
            color: Colors.red,
          ),
          label: "New Lend",
          labelStyle: MMTextStyle.ts4.copyWith(color: Colors.white),
          onTap: () async {
            await addData(
              "Lend",
            );
          },
        ),
      ],
    );
  }
}
