import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:fugi_movie_app/module/client/dashboard/widgets/bottom_navigation_bar_widget.dart';
import '../../../../model/movie_model.dart';
import '../controller/dashboard_controller.dart';

import 'package:get/get.dart';

class DashboardView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<DashboardController>(
      init: DashboardController(),
      builder: (controller) {
        controller.view = this;

        return SafeArea(
          child: Scaffold(
            backgroundColor: Colors.white,
            body: StreamBuilder<QuerySnapshot>(
              stream:
                  FirebaseFirestore.instance.collection("movies").snapshots(),
              builder: (context, snapshot) {
                if (snapshot.hasError) return Text("Error");
                if (!snapshot.hasData) return Text("No Data");
                final data = snapshot.data!;

                List dataListMovieWithIndex =
                    Iterable<int>.generate(data.docs.length).toList();

                return Stack(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          stops: [
                            Get.height * 0.00001,
                            Get.height * 0.0005,
                          ],
                          colors: const [
                            Color(0xff58534b),
                            Colors.white,
                          ],
                        ),
                      ),
                    ),
                    Positioned(
                      top: Get.height * 0.02,
                      left: 0,
                      right: 0,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: controller.tabBar.map<Widget>(
                          (e) {
                            int index = controller.tabBar.indexOf(e);
                            return Padding(
                              padding: EdgeInsets.symmetric(horizontal: 8.0),
                              child: Obx(() {
                                return OutlinedButton(
                                  style: OutlinedButton.styleFrom(
                                    backgroundColor:
                                        controller.selectedTabBar.value == index
                                            ? Color(0xfffe5422)
                                            : Colors.transparent,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(16),
                                    ),
                                  ),
                                  onPressed: () =>
                                      controller.changeTabBar(index),
                                  child: Text(
                                    e,
                                    style: TextStyle(
                                      color: Colors.white,
                                    ),
                                  ),
                                );
                              }),
                            );
                          },
                        ).toList(),
                      ),
                    ),
                    Positioned(
                      top: Get.height * 0.12,
                      left: 0,
                      right: 0,
                      child: CarouselSlider(
                        options: CarouselOptions(
                          aspectRatio: 1.0,
                          enlargeCenterPage: true,
                        ),
                        items: dataListMovieWithIndex.map(
                          (index) {
                            var item = (data.docs[index].data()
                                as Map<String, dynamic>);

                            MovieModel itemMovie = MovieModel.fromJson(item);
                            return Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(
                                  24.0,
                                ),
                                image: DecorationImage(
                                  image: CachedNetworkImageProvider(
                                    itemMovie.posterPath != ''
                                        ? 'https://image.tmdb.org/t/p/w500${itemMovie.posterPath}'
                                        : 'https://i.ibb.co/S32HNjD/no-image.jpg',
                                  ),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            );
                          },
                        ).toList(),
                      ),
                    ),
                  ],
                );
              },
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
                      children:
                          controller.allMenuBottomNavigationBar.map<Widget>(
                        (e) {
                          int index =
                              controller.allMenuBottomNavigationBar.indexOf(e);
                          return BottomNavigationBarWidget(
                            text: e,
                            tooltip: e,
                            isSelected:
                                controller.selectedBottomNavigationBar.value ==
                                    index,
                            onPressed: () => controller
                                .changeIndexBottomNavigationBar(index),
                          );
                        },
                      ).toList(),
                    );
                  }),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
