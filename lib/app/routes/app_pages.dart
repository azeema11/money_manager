import 'package:get/get.dart';

import 'package:money_manager/app/modules/backup_restore/bindings/backup_restore_binding.dart';
import 'package:money_manager/app/modules/backup_restore/views/backup_restore_view.dart';
import 'package:money_manager/app/modules/home/bindings/home_binding.dart';
import 'package:money_manager/app/modules/home/views/home_view.dart';
import 'package:money_manager/app/modules/lendings/bindings/lendings_binding.dart';
import 'package:money_manager/app/modules/lendings/views/lendings_view.dart';
import 'package:money_manager/app/modules/password_screen/bindings/password_screen_binding.dart';
import 'package:money_manager/app/modules/password_screen/views/password_screen_view.dart';
import 'package:money_manager/app/modules/planner/bindings/planner_binding.dart';
import 'package:money_manager/app/modules/planner/views/planner_view.dart';
import 'package:money_manager/app/modules/statistics/bindings/statistics_binding.dart';
import 'package:money_manager/app/modules/statistics/views/statistics_view.dart';
import 'package:money_manager/app/modules/transactions/bindings/transactions_binding.dart';
import 'package:money_manager/app/modules/transactions/views/transactions_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => HomeView(),
      bindings: [
        HomeBinding(),
        TransactionsBinding(),
        LendingsBinding(),
        BackupRestoreBinding(),
        PlannerBinding(),
      ],
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
    ),
    GetPage(
      name: _Paths.BACKUP_RESTORE,
      page: () => BackupRestoreView(),
      binding: BackupRestoreBinding(),
    ),
    GetPage(
      name: _Paths.STATISTICS,
      page: () => StatisticsView(),
      binding: StatisticsBinding(),
    ),
    GetPage(
      name: _Paths.PASSWORD_SCREEN,
      page: () => PasswordScreenView(),
      binding: PasswordScreenBinding(),
    ),
    GetPage(
      name: _Paths.PLANNER,
      page: () => PlannerView(),
      binding: PlannerBinding(),
    ),
  ];
}
