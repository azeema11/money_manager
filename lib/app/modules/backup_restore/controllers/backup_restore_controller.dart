import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:money_manager/app/data/database/backup_restore.dart';
import 'package:permission_handler/permission_handler.dart';

class BackupRestoreController extends GetxController {
  bool loading = false;
  BackupRestore backupRestore = BackupRestore();

  Future backup() async {
    loading = true;
    update();
    var status = await Permission.storage.request();
    if (status.isGranted) {
      await backupRestore.backup();
    } else {
      Get.snackbar(
        "Permission",
        "Permission denied",
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
    }
    loading = false;
    update();
  }

  Future restore() async {
    loading = true;
    update();
    var status = await Permission.storage.request();
    if (status.isGranted) {
      await backupRestore.restore();
    } else {
      Get.snackbar(
        "Permission",
        "Permission denied",
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
    }
    loading = false;
    update();
  }

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
}
