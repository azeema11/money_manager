import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:money_manager/app/theme/mmtheme.dart';
import 'package:money_manager/app/widgets/loading.dart';

import '../controllers/backup_restore_controller.dart';

class BackupRestoreView extends GetView<BackupRestoreController> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<BackupRestoreController>(builder: (_) {
      return Scaffold(
        appBar: AppBar(
          title: Text('Backup and Restore'),
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
                            titleStyle: MMTheme.ts3,
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
                            style: MMTheme.ts3.copyWith(color: Colors.white),
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
                            style: MMTheme.ts3.copyWith(color: Colors.white),
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
