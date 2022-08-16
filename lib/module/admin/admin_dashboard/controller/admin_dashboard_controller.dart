import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:fugi_movie_app/service/tmdb_service.dart';
import 'package:get/get.dart';
import '../view/admin_dashboard_view.dart';

class AdminDashboardController extends GetxController {
  AdminDashboardView? view;

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  List menus = [
    {
      "icon": Icons.developer_board,
      "label": "Resets",
      "onTap": () {
        AdminDashboardController controller = Get.find();
        controller.resetData();
      },
    }
  ];

  resetData() async {
    log("Load data...");
    var response = await TMDBService().getTrendingMovie(page: 1);
    log("$response");
    log("Page: ${response["page"]}");
    log("Total Pages: ${response["total_pages"]}");
    log("Results Length: ${response["results"].length}");
    log("Total Results: ${response["total_results"]}");
    log("Done!");
  }
}
