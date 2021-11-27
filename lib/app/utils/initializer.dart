import 'dart:async';
import 'package:get_storage/get_storage.dart';
import 'package:money_manager/app/routes/app_pages.dart';

class Initializer {
  final store = GetStorage("Money Manager");

  Future initializeStorage() async {
    await GetStorage.init("Money Manager");
  }

  Future<String> getInitialRoute() async {
    late String route;
    if (store.hasData("dbPassword")) {
      route = Routes.HOME;
    } else {
      route = Routes.PASSWORD_SCREEN;
    }
    await Future.delayed(
      Duration(seconds: 1),
    );
    return route;
  }
}
