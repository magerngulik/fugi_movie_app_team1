import 'package:flutter/material.dart';
import '../controller/admin_main_navigation_controller.dart';

import 'package:get/get.dart';

class AdminMainNavigationView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<AdminMainNavigationController>(
      init: AdminMainNavigationController(),
      builder: (controller) {
        controller.view = this;

        return Scaffold(
          appBar: AppBar(
            title: Text("AdminMainNavigation"),
          ),
        );
      },
    );
  }
}