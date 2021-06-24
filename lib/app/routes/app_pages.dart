import 'package:get/get.dart';

import 'package:money_manager/app/modules/add_lending/bindings/add_lending_binding.dart';
import 'package:money_manager/app/modules/add_lending/views/add_lending_view.dart';
import 'package:money_manager/app/modules/add_transaction/bindings/add_transaction_binding.dart';
import 'package:money_manager/app/modules/add_transaction/views/add_transaction_view.dart';
import 'package:money_manager/app/modules/home/bindings/home_binding.dart';
import 'package:money_manager/app/modules/home/views/home_view.dart';
import 'package:money_manager/app/modules/lendings/bindings/lendings_binding.dart';
import 'package:money_manager/app/modules/lendings/views/lendings_view.dart';
import 'package:money_manager/app/modules/transactions/bindings/transactions_binding.dart';
import 'package:money_manager/app/modules/transactions/views/transactions_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.HOME;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => HomeView(),
      bindings: [HomeBinding(), TransactionsBinding(), LendingsBinding()],
    ),
    GetPage(
      name: _Paths.TRANSACTIONS,
      page: () => TransactionsView(),
      binding: TransactionsBinding(),
    ),
    GetPage(
      name: _Paths.LENDINGS,
      page: () => LendingsView(),
      binding: LendingsBinding(),
    )
  ];
}
