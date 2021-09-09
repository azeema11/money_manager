import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:money_manager/app/routes/app_pages.dart';
import 'package:money_manager/app/theme/mmtheme.dart';

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
                  style: MMTheme.ts2,
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
                    print(_.validate);
                    return "No Password entered";
                  } else if (value.length < 5) {
                    _.validate = false;
                    print(_.validate);
                    return "Password must be at least 5 characters";
                  } else {
                    _.validate = true;
                    print(_.validate);
                    print("Password Sufficient");
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
                        titleStyle: MMTheme.ts3,
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
                          Get.back();
                        },
                      );
                      if (_.confirm) {
                        await _.localStorage.setItem("dbPassword", _.password);
                        Get.offAndToNamed(
                          Routes.HOME,
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
                    style: MMTheme.ts4.copyWith(color: Colors.white),
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
