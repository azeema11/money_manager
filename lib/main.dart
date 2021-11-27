import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:money_manager/app/theme/mm_theme.dart';
import 'package:money_manager/app/utils/initializer.dart';
import 'app/routes/app_pages.dart';

void main() async {
  await Initializer().initializeStorage();
  String initialRoute = await Initializer().getInitialRoute();
  runApp(
    GetMaterialApp(
      title: "Money Manager",
      initialRoute: initialRoute,
      theme: MMTheme.theme,
      getPages: AppPages.routes,
      debugShowCheckedModeBanner: false,
    ),
  );
}
