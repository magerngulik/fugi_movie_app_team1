import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:fugi_movie_app/module/client/booking_list/view/booking_list_view.dart';
import 'package:fugi_movie_app/module/client/dashboard/view/menu_dashboard_view.dart';
import 'package:fugi_movie_app/module/client/profile/view/profile_view.dart';
import 'package:get/get.dart';
import '../../movie_list/view/movie_list_view.dart';
import '../view/dashboard_view.dart';

class DashboardController extends GetxController {
  DashboardView? view;

  String condition = "Now Showing";

  /// List Widget for Menu Screens
  final allMenuScreens = <Widget>[
    MenuDashboardView(),
    MovieListView(),
    BookingListView(),
    ProfileView(),
  ];

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

  void showToastForExitApp() async {
    const message = 'Press again to exit app';
    await Fluttertoast.showToast(
      msg: message,
      fontSize: 12,
      backgroundColor: Colors.black.withOpacity(0.7),
      gravity: ToastGravity.CENTER,
    );
  }
}
