import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:money_manager/app/theme/mm_text_style.dart';
import 'package:money_manager/app/widgets/loading.dart';

import '../controllers/backup_restore_controller.dart';

class BackupRestoreView extends GetView<BackupRestoreController> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<BackupRestoreController>(builder: (_) {
      return Scaffold(
        appBar: AppBar(
          title: Text('Database'),
        ),
        body: Container(
          child: Center(
            child: _.loading
                ? Loading()
                : Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TextButton(
                        onPressed: () async {
                          await Get.defaultDialog(
                            title: "Confirm Backup",
                            titleStyle: MMTextStyle.ts3,
                            middleText: "Do you want to backup existing data?",
                            textCancel: "Back",
                            textConfirm: "Confirm",
                            confirmTextColor: Colors.white,
                            onCancel: () {
                              Get.back();
                            },
                            onConfirm: () async {
                              Get.back();
                              await _.backup();
                            },
                          );
                        },
                        child: Container(
                          color: Colors.blue,
                          alignment: Alignment.center,
                          height: 35.0,
                          width: 70.0,
                          child: Text(
                            "Backup",
                            style:
                                MMTextStyle.ts3.copyWith(color: Colors.white),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      TextButton(
                        onPressed: () async {
                          await _.restore();
                        },
                        child: Container(
                          color: Colors.blue,
                          alignment: Alignment.center,
                          height: 35.0,
                          width: 70.0,
                          child: Text(
                            "Restore",
                            style:
                                MMTextStyle.ts3.copyWith(color: Colors.white),
                          ),
                        ),
                      ),
                    ],
                  ),
          ),
        ),
      );
    });
  }
}
