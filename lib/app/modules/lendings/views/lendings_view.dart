import 'package:flutter/material.dart';
import 'package:flutter_rounded_date_picker/flutter_rounded_date_picker.dart';
import 'package:form_field_validator/form_field_validator.dart';

import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:money_manager/app/data/database/moor_database.dart';
import 'package:money_manager/app/theme/mmtheme.dart';
import 'package:money_manager/app/widgets/lending_card.dart';
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
                            type: BottomNavigationBarType.fixed,
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
                                    onTap: () async {
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
                                if (_.lendingIndex == 0) {
                                  await _.database
                                      .insertNewLend(LendCompanion.insert(
                                    amount: amount,
                                    time: date,
                                    description: description,
                                  ));
                                } else {
                                  await _.database
                                      .insertNewBorrow(BorrowCompanion.insert(
                                    amount: amount,
                                    time: date,
                                    description: description,
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
                                  (_.lendingIndex == 0 ? "Lend" : "Borrow"),
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
