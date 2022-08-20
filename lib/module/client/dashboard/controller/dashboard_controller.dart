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

  final tabBar = [
    'Now Showing',
    'Coming Soon',
  ];

  final selectedBottomNavigationBar = 0.obs;
  final selectedTabBar = 0.obs;
  final currentCarouselSlider = 0.obs;

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

  void changeIndexBottomNavigationBar(int index) {
    selectedBottomNavigationBar.value = index;
  }

  void changeTabBar(int index) {
    selectedTabBar.value = index;
  }
}
