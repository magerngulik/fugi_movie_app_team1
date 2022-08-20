import 'dart:ui';

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
    final CarouselController carouselController = CarouselController();

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

                MovieModel dataMovie = MovieModel.fromJson(
                    data.docs[controller.currentCarouselSlider.value].data()
                        as Map<String, dynamic>);

                return Stack(
                  alignment: Alignment.center,
                  children: [
                    /// Background
                    Column(
                      children: [
                        Stack(
                          children: [
                            AspectRatio(
                              aspectRatio: 16 / 9,
                              child: Image.network(
                                'https://image.tmdb.org/t/p/w500${dataMovie.posterPath}',
                                fit: BoxFit.cover,
                              ),
                            ),
                            Positioned.fill(
                              child: BackdropFilter(
                                filter: ImageFilter.blur(
                                  sigmaX: 10,
                                  sigmaY: 10,
                                ),
                                child: Container(
                                  color: Colors.white.withOpacity(0.1),
                                ),
                              ),
                            ),
                          ],
                        ),
                        Container(
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                              stops: [
                                Get.height * 0.2,
                                Get.height * 0.5,
                              ],
                              colors: const [
                                Color(0xff58534b),
                                Colors.white,
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    /// TabBar View [Not Showing, Coming Soon]
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
                    /// Carousel Poster
                    Positioned(
                      top: Get.height * 0.12,
                      left: 0,
                      right: 0,
                      child: CarouselSlider(
                        carouselController: carouselController,
                        options: CarouselOptions(
                          height: Get.height * 0.5,
                          aspectRatio: 1.0,
                          enlargeCenterPage: true,
                          onPageChanged: (index, _) {
                            controller.currentCarouselSlider.value = index;
                            controller.update();
                          },
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
                    /// Data Movie
                    Positioned(
                      top: Get.height * 0.63,
                      left: 0,
                      right: 0,
                      child: Container(
                        padding: EdgeInsets.all(4.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            /// Time Movie
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(vertical: 2.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: const [
                                  Icon(
                                    Icons.timelapse_outlined,
                                    color: Color(0xffBFBFBF),
                                  ),
                                  SizedBox(
                                    width: 5.0,
                                  ),
                                  Text(
                                    '2h 23m',
                                    style: TextStyle(
                                      color: Color(0xff6C6C6C),
                                      fontSize: 12.0,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                            ),

                            /// Original Title
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(vertical: 2.0),
                              child: Text(
                                (dataMovie.originalTitle != null)
                                    ? (dataMovie.originalTitle!.isNotEmpty)
                                        ? dataMovie.originalTitle!
                                        : 'No Title'
                                    : '-',
                                style: TextStyle(
                                  color: Color(0xff000101),
                                  fontSize: 24.0,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),

                            /// List Genre
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(vertical: 2.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: dataMovie.genreIds
                                    .map<Widget>(
                                      (e) => Container(
                                        margin: EdgeInsets.symmetric(
                                            horizontal: 4.0),
                                        padding: EdgeInsets.all(8.0),
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(16),
                                          border: Border.all(
                                            color: Color(0xffF1F1F1),
                                          ),
                                        ),
                                        child: Padding(
                                          padding: const EdgeInsets.symmetric(
                                            horizontal: 8.0,
                                            vertical: 2,
                                          ),
                                          child: Text(e.toString()),
                                        ),
                                      ),
                                    )
                                    .toList(),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                );
              },
            ),
            /// BottomNavigationBar
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
