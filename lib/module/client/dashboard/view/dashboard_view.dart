import 'package:flutter/material.dart';
import '../controller/dashboard_controller.dart';

import 'package:get/get.dart';

import '../widgets/bottom_navigation_bar_widget.dart';

class DashboardView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<DashboardController>(
      init: DashboardController(),
      builder: (controller) {
        controller.view = this;

        return SafeArea(
          child: Obx(() {
            return Scaffold(
              backgroundColor: Colors.white,

              /// Body for view with selectedBottomNavigationBar
              body: controller
                  .allMenuScreens[controller.selectedBottomNavigationBar.value],

              /// BottomNavigationBar
              bottomNavigationBar: BottomAppBar(
                color: Colors.white,
                elevation: 0,
                child: SizedBox(
                  height: Get.height * 0.1,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 4.0),
                    child: Obx(() {
                      return Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children:
                            controller.allMenuBottomNavigationBar.map<Widget>(
                          (e) {
                            int index = controller.allMenuBottomNavigationBar
                                .indexOf(e);
                            return BottomNavigationBarWidget(
                              text: e,
                              tooltip: e,
                              isSelected: controller
                                      .selectedBottomNavigationBar.value ==
                                  index,
                              onPressed: () => controller
                                  .changeIndexBottomNavigationBar(index),
                            );
                          },
                        ).toList(),
                      );
                    }),
                  ),
                ),
              ),
            );
          }),
        );
      },
    );
  }
}
