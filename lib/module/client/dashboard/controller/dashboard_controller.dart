import 'package:get/get.dart';
import '../view/dashboard_view.dart';

class DashboardController extends GetxController {
  DashboardView? view;

  String condition = "Now Showing";

  final allMenuBottomNavigationBar = [
    'Dashboard',
    'Search',
    'Ticket',
    'Profile',
  ];

  final selectedBottomNavigationBar = 0.obs;

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

  void changeIndexBottomNavigationBar(int index) {
    selectedBottomNavigationBar.value = index;
  }
}
