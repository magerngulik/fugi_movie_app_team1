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
        );
      },
    );
  }
}