import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:money_manager/app/controllers/floating_action_controller.dart';
import 'package:money_manager/app/theme/mm_text_style.dart';
import 'package:money_manager/app/widgets/loading.dart';
import 'package:money_manager/app/widgets/month_list.dart';
import 'package:money_manager/app/widgets/plan_card.dart';
import 'package:money_manager/app/widgets/planner_floating_action.dart';

import '../controllers/planner_controller.dart';

class PlannerView extends GetView<PlannerController> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<PlannerController>(builder: (_) {
      return Scaffold(
        appBar: AppBar(
          title: Text('Planner'),
        ),
        body: Column(
          children: [
            MonthList(
              onPressed: (index, selectedDate) {
                _.selectedDate = selectedDate;
                _.update();
              },
              selectedDate: _.selectedDate,
            ),
            Expanded(
              child: StreamBuilder(
                stream: _.getPlansAndSpends(),
                builder: (context, AsyncSnapshot snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Container(
                      alignment: Alignment.center,
                      child: Loading(),
                    );
                  } else {
                    _.sort(snapshot.data);
                    if (_.plans.length == 0) {
                      return Container(
                        alignment: Alignment.center,
                        child: Text(
                          "No data",
                          style: MMTextStyle.ts3,
                        ),
                      );
                    } else {
                      return ListView.builder(
                        itemCount: _.plans.length,
                        itemBuilder: (context, index) {
                          return PlanCard(
                            balance: (_.balances[_.plans[index].title])!,
                            spends: _.planSpends
                                .where(
                                  (element) =>
                                      element.plan == _.plans[index].title,
                                )
                                .toList(),
                            onPlanDelete: (plan) async {
                              await _.database
                                  .groupDeletePlanSpends(plan.title);
                              await _.database.deletePlan(plan);
                              _.update();
                            },
                            onPlanEdit: (plan) {},
                            onSpendDelete: (spend) async {
                              await _.database.deletePlanSpends(spend);
                              _.update();
                            },
                            onSpendEdit: (plan) {},
                            plan: _.plans[index],
                          );
                        },
                      );
                    }
                  }
                },
              ),
            ),
          ],
        ),
        floatingActionButton: GetBuilder<FloatingActionController>(
          builder: (_) {
            return AnimatedOpacity(
              opacity: _.showFloatingAction ? 1 : 0,
              duration: Duration(milliseconds: 150),
              child: PlannerFloatingAction(),
            );
          },
        ),
      );
    });
  }
}
