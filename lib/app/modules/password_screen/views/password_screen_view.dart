import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:money_manager/app/routes/app_pages.dart';
import 'package:money_manager/app/theme/mm_text_style.dart';

import '../controllers/password_screen_controller.dart';

class PasswordScreenView extends GetView<PasswordScreenController> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<PasswordScreenController>(builder: (_) {
      return Scaffold(
        appBar: AppBar(
          title: Text('Money Manager'),
          centerTitle: true,
        ),
        body: Container(
          padding: EdgeInsets.all(15.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                alignment: Alignment.center,
                child: Text(
                  'Enter a new password',
                  style: MMTextStyle.ts2,
                ),
              ),
              SizedBox(
                height: 15.0,
              ),
              TextFormField(
                autovalidateMode: AutovalidateMode.onUserInteraction,
                decoration: InputDecoration(
                  labelText: "Password",
                  contentPadding: EdgeInsets.all(0),
                ),
                onChanged: (value) {
                  _.password = value;
                },
                validator: (value) {
                  if (value == null || value == "") {
                    _.validate = false;
                    return "No Password entered";
                  } else if (value.length < 5) {
                    _.validate = false;
                    return "Password must be at least 5 characters";
                  } else {
                    _.validate = true;
                  }
                },
              ),
              SizedBox(
                height: 20.0,
              ),
              Container(
                color: Colors.blue,
                height: 40.0,
                child: TextButton(
                  onPressed: () async {
                    if (_.validate) {
                      await Get.defaultDialog(
                        title: "Confirm Password",
                        titleStyle: MMTextStyle.ts3,
                        middleTextStyle: MMTextStyle.ts4,
                        middleText:
                            "This password will be used to encrypt/decrypt database files on backup/restore\n Confirm Password?",
                        textCancel: "Back",
                        textConfirm: "Confirm",
                        confirmTextColor: Colors.white,
                        onConfirm: () {
                          _.confirm = true;
                          Get.back();
                        },
                        onCancel: () {
                          _.confirm = false;
                        },
                      );
                      if (_.confirm) {
                        await _.store.write("dbPassword", _.password);
                        Get.offAndToNamed(
                          Routes.HOME,
                        );
                        Get.snackbar(
                          "New password set",
                          "New database password set",
                          backgroundColor: Colors.green,
                          colorText: Colors.white,
                        );
                      }
                    } else {
                      Get.snackbar(
                        "Password Insufficient",
                        "Entered Password is insufficient",
                        backgroundColor: Colors.red,
                        colorText: Colors.white,
                      );
                    }
                  },
                  child: Text(
                    "Submit",
                    style: MMTextStyle.ts4.copyWith(color: Colors.white),
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    });
  }
}
