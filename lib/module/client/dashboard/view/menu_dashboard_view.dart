import 'dart:ui';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../model/movie_model.dart';
import '../../movie_detail/view/movie_detail_view.dart';
import '../controller/dashboard_controller.dart';

class MenuDashboardView extends GetView<DashboardController> {
  const MenuDashboardView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final CarouselController carouselController = CarouselController();

    return GetBuilder<DashboardController>(
      init: DashboardController(),
      builder: (controller) {
        return StreamBuilder<QuerySnapshot>(
          stream: FirebaseFirestore.instance
              .collection("movies")
              .where("title", isNotEqualTo: "null")
              .snapshots(),
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
                              onPressed: () => controller.changeTabBar(index),
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
                        var item =
                            (data.docs[index].data() as Map<String, dynamic>);

                        MovieModel itemMovie = MovieModel.fromJson(item);
                        return InkWell(
                          onTap: () => Get.to(MovieDetailView(
                            movie: itemMovie,
                          )),
                          child: Container(
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
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        /// Time Movie
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 2.0),
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
                          padding: const EdgeInsets.symmetric(
                            vertical: 2.0,
                            horizontal: 16.0,
                          ),
                          child: Text(
                            (dataMovie.title ?? "No Title"),
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Color(0xff000101),
                              fontSize: 24.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 20.0,
                        ),

                        Padding(
                          padding: const EdgeInsets.symmetric(
                            vertical: 2.0,
                            horizontal: 16.0,
                          ),
                          child: Wrap(
                            runSpacing: 10.0,
                            children:
                                List.generate(dataMovie.genre.length, (index) {
                              var data = dataMovie.genre[index];
                              return Container(
                                margin: EdgeInsets.symmetric(
                                  horizontal: 4.0,
                                ),
                                padding: EdgeInsets.all(8.0),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(16),
                                  border: Border.all(
                                    color: Colors.grey[400]!,
                                  ),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 8.0,
                                    vertical: 2,
                                  ),
                                  child: Text(data),
                                ),
                              );
                            }),
                          ),
                        ),

                        // /// List Genre
                        // Padding(
                        //   padding: const EdgeInsets.symmetric(
                        //     vertical: 2.0,
                        //     horizontal: 16.0,
                        //   ),
                        //   child: SizedBox(
                        //     height: 42,
                        //     child: ListView.builder(
                        //       itemCount: dataMovie.genre.length,
                        //       scrollDirection: Axis.horizontal,
                        //       itemBuilder: (context, index) {
                        //         var data = dataMovie.genre[index];
                        //         return Container(
                        //           margin: EdgeInsets.symmetric(
                        //             horizontal: 4.0,
                        //           ),
                        //           padding: EdgeInsets.all(8.0),
                        //           decoration: BoxDecoration(
                        //             borderRadius: BorderRadius.circular(16),
                        //             border: Border.all(
                        //               color: Color(0xffF1F1F1),
                        //             ),
                        //           ),
                        //           child: Padding(
                        //             padding: const EdgeInsets.symmetric(
                        //               horizontal: 8.0,
                        //               vertical: 2,
                        //             ),
                        //             child: Text(data),
                        //           ),
                        //         );
                        //       },
                        //     ),
                        //   ),
                        // ),
                      ],
                    ),
                  ),
                ),
              ],
            );
          },
        );
      },
    );
  }
}
