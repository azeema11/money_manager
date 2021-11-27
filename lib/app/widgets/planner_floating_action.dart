import 'package:flutter/material.dart';
import 'package:flutter_rounded_date_picker/flutter_rounded_date_picker.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:money_manager/app/data/database/moor_database.dart';
import 'package:money_manager/app/modules/planner/controllers/planner_controller.dart';
import 'package:money_manager/app/theme/mm_text_style.dart';

class PlannerFloatingAction extends StatelessWidget {
  final PlannerController plannerController = Get.find<PlannerController>();

  @override
  Widget build(BuildContext context) {
    return SpeedDial(
      backgroundColor: Colors.blue,
      icon: Icons.add,
      activeIcon: Icons.close,
      children: [
        SpeedDialChild(
          child: Icon(
            Icons.article,
            color: Colors.green,
          ),
          label: "New Plan",
          labelStyle: MMTextStyle.ts4.copyWith(color: Colors.white),
          onTap: () async {
            late int amount;
            late String title;
            Color dateColor = Colors.black;
            DateTime date = DateTime(0, 0, 0);
            await Get.bottomSheet(
              Container(
                height: Get.height / 2.1,
                padding: EdgeInsets.fromLTRB(15.0, 20.0, 15.0, 10.0),
                color: Colors.white,
                child: Form(
                  key: plannerController.formKey,
                  child: StatefulBuilder(builder: (context, setModalState) {
                    return Column(
                      children: [
                        Container(
                          child: TextFormField(
                            textCapitalization: TextCapitalization.sentences,
                            validator: RequiredValidator(
                              errorText: "Enter Plan Title",
                            ),
                            decoration: InputDecoration(
                              labelText: "Plan title",
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
                              title = value;
                            },
                          ),
                        ),
                        SizedBox(
                          height: 15.0,
                        ),
                        Container(
                          child: TextFormField(
                            keyboardType: TextInputType.number,
                            validator: RequiredValidator(
                              errorText: "Enter Allocation",
                            ),
                            decoration: InputDecoration(
                              labelText: 'Allocation',
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
                              amount = value != "" ? int.parse(value) : 0;
                            },
                          ),
                        ),
                        SizedBox(
                          height: 15.0,
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
                                  style: MMTextStyle.ts4
                                      .copyWith(color: dateColor),
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
                              if (plannerController.formKey.currentState!
                                      .validate() &&
                                  date != DateTime(0, 0, 0)) {
                                dateColor = Colors.black;
                                setModalState(() {});
                                await plannerController.database
                                    .insertNewPlan(PlanCompanion.insert(
                                  time: date,
                                  allocation: amount,
                                  title: title,
                                ));
                                Get.back();
                                plannerController.update();
                              } else if (date == DateTime(0, 0, 0)) {
                                dateColor = Colors.red;
                                setModalState(() {});
                              }
                            },
                            child: Text(
                              "Add Plan",
                              style:
                                  MMTextStyle.ts4.copyWith(color: Colors.white),
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
            Icons.money,
            color: Colors.red,
          ),
          label: "New Spend",
          labelStyle: MMTextStyle.ts4.copyWith(color: Colors.white),
          onTap: () async {
            late String plan;
            late int amount;
            late String description;
            Color dateColor = Colors.black;
            DateTime date = DateTime(0, 0, 0);
            await Get.bottomSheet(
              Container(
                height: Get.height / 2.1,
                padding: EdgeInsets.fromLTRB(15.0, 20.0, 15.0, 10.0),
                color: Colors.white,
                child: Form(
                  key: plannerController.formKey,
                  child: StatefulBuilder(builder: (context, setModalState) {
                    return Column(
                      children: [
                        Container(
                          child: TextFormField(
                            textCapitalization: TextCapitalization.sentences,
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
                              amount = value != "" ? int.parse(value) : 0;
                            },
                          ),
                        ),
                        SizedBox(
                          height: 15.0,
                        ),
                        Container(
                          child: DropdownButtonFormField<String>(
                            items: List.generate(
                              plannerController.plans.length,
                              (int index) => DropdownMenuItem(
                                value: plannerController.plans[index].title,
                                child: Text(
                                  plannerController.plans[index].title,
                                ),
                              ),
                            ),
                            decoration: InputDecoration(
                              labelText: 'Plan Type',
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
                                plan = newValue;
                              }
                              setModalState(() {});
                            },
                            validator: (String? value) {
                              if (value == null) {
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
                                  style: MMTextStyle.ts4
                                      .copyWith(color: dateColor),
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
                              if (plannerController.formKey.currentState!
                                      .validate() &&
                                  date != DateTime(0, 0, 0)) {
                                dateColor = Colors.black;
                                setModalState(() {});
                                await plannerController.database
                                    .insertNewPlanSpends(
                                        PlanSpendsCompanion.insert(
                                  description: description,
                                  amount: amount,
                                  time: date,
                                  plan: plan,
                                ));
                                Get.back();
                                plannerController.update();
                              } else if (date == DateTime(0, 0, 0)) {
                                dateColor = Colors.red;
                                setModalState(() {});
                              }
                            },
                            child: Text(
                              "Add Spend",
                              style:
                                  MMTextStyle.ts4.copyWith(color: Colors.white),
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
