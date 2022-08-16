import 'dart:developer';

import 'package:flutter/material.dart';
import '../controller/admin_dashboard_controller.dart';

import 'package:get/get.dart';

class AdminDashboardView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<AdminDashboardController>(
      init: AdminDashboardController(),
      builder: (controller) {
        controller.view = this;

        return Scaffold(
          appBar: AppBar(
            title: Text("AdminDashboard"),
          ),
          body: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                Wrap(
                  children: List.generate(controller.menus.length, (index) {
                    var item = controller.menus[index];
                    return InkWell(
                      onTap: () {
                        item["onTap"]();
                      },
                      child: SizedBox(
                        width: (MediaQuery.of(context).size.width - 40) / 4,
                        height: (MediaQuery.of(context).size.width - 40) / 4,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              item["icon"],
                              color: Colors.white,
                            ),
                            const SizedBox(
                              height: 10.0,
                            ),
                            Text(
                              item["label"],
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 10.0,
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  }),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
