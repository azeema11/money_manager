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
                      Container(
                        color: Colors.white,
                        child: TextButton(
                          onPressed: () async {
                            await _.backup();
                          },
                          child: Text(
                            "Backup",
                            style: MMTheme.ts3,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Container(
                        color: Colors.white,
                        child: TextButton(
                          onPressed: () async {
                            await _.restore();
                          },
                          child: Text(
                            "Restore",
                            style: MMTheme.ts3,
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
