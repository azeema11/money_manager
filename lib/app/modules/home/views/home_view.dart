import 'package:custom_navigation_bar/custom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:money_manager/app/modules/backup_restore/views/backup_restore_view.dart';
import 'package:money_manager/app/modules/lendings/views/lendings_view.dart';
import 'package:money_manager/app/modules/planner/views/planner_view.dart';
import 'package:money_manager/app/modules/transactions/views/transactions_view.dart';
import 'package:money_manager/app/theme/mm_text_style.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(builder: (_) {
      return Scaffold(
        body: [
          TransactionsView(),
          PlannerView(),
          LendingsView(),
          BackupRestoreView()
        ][_.currentIndex],
        bottomNavigationBar: CustomNavigationBar(
          onTap: _.onNavTap,
          currentIndex: _.currentIndex,
          items: [
            CustomNavigationBarItem(
              title: Text(
                "Transactions",
                style: MMTextStyle.ts4.copyWith(
                  color: _.currentIndex == 0 ? Colors.blue : Colors.black,
                ),
              ),
              icon: Icon(Icons.money),
            ),
            CustomNavigationBarItem(
              title: Text(
                "Planner",
                style: MMTextStyle.ts4.copyWith(
                  color: _.currentIndex == 1 ? Colors.blue : Colors.black,
                ),
              ),
              icon: Icon(Icons.calendar_today_outlined),
            ),
            CustomNavigationBarItem(
              title: Text(
                "Lendings",
                style: MMTextStyle.ts4.copyWith(
                  color: _.currentIndex == 2 ? Colors.blue : Colors.black,
                ),
              ),
              icon: Icon(FontAwesomeIcons.moneyBillAlt),
            ),
            CustomNavigationBarItem(
              title: Text(
                "Database",
                style: MMTextStyle.ts4.copyWith(
                  color: _.currentIndex == 3 ? Colors.blue : Colors.black,
                ),
              ),
              icon: Icon(Icons.backup),
            ),
          ],
        ),
      );
    });
  }
}
