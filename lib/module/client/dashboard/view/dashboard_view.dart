import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:fugi_movie_app/module/client/dashboard/widgets/bottom_navigation_bar_widget.dart';
import '../controller/dashboard_controller.dart';

import 'package:get/get.dart';

class DashboardView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<DashboardController>(
      init: DashboardController(),
      builder: (controller) {
        controller.view = this;

        return Scaffold(
          backgroundColor: Colors.white,
          body: Column(
            children: [
              SizedBox(
                height: 140.0,
                child: StreamBuilder<QuerySnapshot>(
                  stream: FirebaseFirestore.instance
                      .collection("movies")
                      .snapshots(),
                  builder: (context, snapshot) {
                    if (snapshot.hasError) return Text("Error");
                    if (!snapshot.hasData) return Text("No Data");
                    final data = snapshot.data!;

                    return ListView.builder(
                      itemCount: data.docs.length,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        var item = (data.docs[index].data() as Map);

                        return Container(
                          width: 200.0,
                          child: Row(
                            children: [
                              Image.network(
                                "https://i.ibb.co/S32HNjD/no-image.jpg",
                                width: 60.0,
                              ),
                              const SizedBox(
                                width: 10.0,
                              ),
                              Expanded(
                                child: Text(item["original_title"] ?? ""),
                              ),
                            ],
                          ),
                        );
                      },
                    );
                  },
                ),
              ),
            ],
          ),
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
                    children: controller.allMenuBottomNavigationBar.map<Widget>(
                      (e) {
                        int index =
                            controller.allMenuBottomNavigationBar.indexOf(e);
                        return BottomNavigationBarWidget(
                          text: e,
                          tooltip: e,
                          isSelected:
                              controller.selectedBottomNavigationBar.value ==
                                  index,
                          onPressed: () =>
                              controller.changeIndexBottomNavigationBar(index),
                        );
                      },
                    ).toList(),
                  );
                }),
              ),
            ),
          ),
        );
      },
    );
  }
}
