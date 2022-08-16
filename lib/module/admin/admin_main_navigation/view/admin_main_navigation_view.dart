import 'package:flutter/material.dart';
import 'package:fugi_movie_app/module/admin/admin_dashboard/view/admin_dashboard_view.dart';
import 'package:fugi_movie_app/module/admin/admin_movie_list/view/admin_movie_list_view.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import '../controller/admin_main_navigation_controller.dart';

import 'package:get/get.dart';

class AdminMainNavigationView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<AdminMainNavigationController>(
      init: AdminMainNavigationController(),
      builder: (controller) {
        controller.view = this;
        return DefaultTabController(
          length: 3,
          initialIndex: controller.selectedIndex,
          child: Scaffold(
            body: IndexedStack(
              index: controller.selectedIndex,
              children: [
                AdminDashboardView(),
                AdminMovieListView(),
                Container(
                  color: Colors.blue[100],
                ),
              ],
            ),
            bottomNavigationBar: BottomNavigationBar(
              currentIndex: controller.selectedIndex,
              onTap: (index) {
                controller.selectedIndex = index;
                controller.update();
              },
              items: const [
                BottomNavigationBarItem(
                  label: "Dashboard",
                  icon: Icon(
                    MdiIcons.home,
                  ),
                ),
                BottomNavigationBarItem(
                  label: "Movies",
                  icon: Icon(
                    MdiIcons.featureSearch,
                  ),
                ),
                BottomNavigationBarItem(
                  label: "Profile",
                  icon: Icon(
                    Icons.person,
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
