import 'package:get/get.dart';
import '../view/dashboard_view.dart';

class DashboardController extends GetxController {
  DashboardView? view;

  String condition = "Now Showing";

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

  updateCondition() {
    condition = condition == "Now Showing" ? "Coming Soon" : "Now Showing";
    update();
  }
}
