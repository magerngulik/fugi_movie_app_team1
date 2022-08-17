import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
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
          appBar: AppBar(
            title: Text("Dashboard"),
          ),
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
        );
      },
    );
  }
}
