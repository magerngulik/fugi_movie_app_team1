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
          bottomNavigationBar: SizedBox(
            height: 90.0,
            child: Center(
              child: Obx(() {
                return SizedBox(
                  width: MediaQuery.of(context).size.width,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      if (controller.loading.value == true)
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Transform.scale(
                              scale: 0.6,
                              child: CircularProgressIndicator(
                                color: Colors.red,
                                strokeWidth: 1.0,
                              ),
                            ),
                            SizedBox(
                              width: 10.0,
                            ),
                            Text(
                              "Loading...",
                              style: TextStyle(
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                    ],
                  ),
                );
              }),
            ),
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
                              textAlign: TextAlign.center,
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
