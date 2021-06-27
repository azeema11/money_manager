import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:path/path.dart' as p;
import 'package:share_plus/share_plus.dart';
import 'package:sqflite/sqflite.dart';

class BackupRestore {
  Future backup() async {
    final dbFolder = await getDatabasesPath();
    final file = File(p.join(dbFolder, 'db.sqlite'));

    final Directory exportDir =
        Directory('/storage/emulated/0/Documents/Money Manager/Backup');
    final backupFile = p.join(exportDir.path, 'money_manager_db_backup.sqlite');

    if (await File(backupFile).exists() == false) {
      await File(backupFile).create(recursive: true);
    }

    await File(backupFile).writeAsBytes(await file.readAsBytes(), flush: true);

    if (await File(backupFile).exists()) {
      await Share.shareFiles(
        [backupFile],
        subject: "Share money manager database backup",
      );
    }
    Get.snackbar(
      "Database backed up",
      "Database backed up to documents folder",
      backgroundColor: Colors.green,
      colorText: Colors.white,
    );
  }

  Future restore() async {
    FilePicker.platform.clearTemporaryFiles();
    final dbFolder = await getDatabasesPath();
    final file = File(p.join(dbFolder, 'db.sqlite'));

    final backupFilePicked = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ["sqlite"],
    );
    if (backupFilePicked != null) {
      final backupPath = backupFilePicked.files.single.path;

      if (p.extension(backupPath!) == '.sqlite') {
        final backupFile = File(backupPath);
        await file.writeAsBytes(await backupFile.readAsBytes(), flush: true);
        Get.snackbar(
          "Database restored",
          "Money Manager database restored",
          backgroundColor: Colors.green,
          colorText: Colors.white,
        );
      } else {
        Get.snackbar(
          "Invalid file",
          "Select a valid database file",
          backgroundColor: Colors.red,
          colorText: Colors.white,
        );
      }
    } else {
      Get.snackbar(
        "None selected",
        "No files selected",
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
    }
  }
}
