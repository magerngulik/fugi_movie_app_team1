// ignore_for_file: prefer_const_literals_to_create_immutables

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fugi_movie_app/model/movie_model.dart';
import 'package:fugi_movie_app/module/client/dashboard/view/dashboard_view.dart';
import 'package:fugi_movie_app/module/client/login/view/login_view.dart';
import 'package:fugi_movie_app/module/client/movie_video_player/controller/movie_video_player_controller.dart';
import 'package:fugi_movie_app/module/client/movie_video_player/view/movie_video_player_view.dart';
import '../../booking_detail/view/booking_detail_view.dart';
import '../controller/movie_detail_controller.dart';
import '../../../../model/movie_model.dart';

import 'package:get/get.dart';

class MovieDetailView extends StatelessWidget {
  final MovieModel movie;
  const MovieDetailView({
    required this.movie,
  });

  @override
  Widget build(BuildContext context) {
    return GetBuilder<MovieDetailController>(
      init: MovieDetailController(),
      builder: (controller) {
        controller.view = this;

        String vote = movie.voteAverage.toString();
        String showRate = vote.substring(0, 3);

        return Scaffold(
          body: Stack(
            children: [
              SingleChildScrollView(
                child: Stack(
                  children: [
                    Container(
                      height: MediaQuery.of(context).size.height * 0.8,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: NetworkImage(
                            'https://image.tmdb.org/t/p/w500${movie.posterPath}',
                            // "https://tse3.mm.bing.net/th?id=OIP.WT8tQIdjO63hzvjJMlwnegHaK-&pid=Api&P=0",
                          ),
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      child: Column(
                        children: [
                          const SizedBox(
                            height: 30.0,
                          ),
                          SizedBox(
                            height: 50,
                            child: SizedBox(
                              height: 100.0,
                              child: Row(
                                children: [
                                  const SizedBox(
                                    width: 30.0,
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      CircleAvatar(
                                        backgroundColor:
                                            Colors.grey.withOpacity(0.3),
                                        radius: 20,
                                        child: InkWell(
                                          onTap: () => Get.to(DashboardView()),
                                          child: Icon(
                                            Icons.highlight_off,
                                            color: Colors.white,
                                            size: 25.0,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Spacer(),
                                  SizedBox(
                                    height: 40,
                                    width: 100,
                                    child: Container(
                                      height: 50,
                                      decoration: BoxDecoration(
                                          color: Colors.grey.withOpacity(0.5),
                                          borderRadius:
                                              BorderRadius.circular(20)),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Icon(
                                            Icons.timer_sharp,
                                            color: Colors.white,
                                          ),
                                          Text(
                                            "1h 30m",
                                            style: TextStyle(
                                              fontSize: 15,
                                              color: Colors.white,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 30.0,
                                  ),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 300,
                            child: InkWell(
                              onTap: () async {
                                if (FirebaseAuth.instance.currentUser == null) {
                                  await Get.to(LoginView());
                                  return;
                                }
                                await Get.delete<MovieVideoPlayerController>();
                                await Get.to(MovieVideoPlayerView());
                                await SystemChrome.setPreferredOrientations([
                                  DeviceOrientation.portraitUp,
                                  DeviceOrientation.portraitDown,
                                ]);
                              },
                              child: Icon(
                                Icons.play_circle_rounded,
                                size: 65,
                                color: Colors.red.withOpacity(0.8),
                              ),
                            ),
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: const BorderRadius.all(
                                Radius.circular(
                                  25,
                                ),
                              ),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                SizedBox(
                                  height: 25,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Expanded(
                                      child: Column(
                                        children: [
                                          Column(
                                            children: [
                                              RichText(
                                                textAlign: TextAlign.center,
                                                text: TextSpan(
                                                  style: TextStyle(
                                                      color: Colors.black),
                                                  children: [
                                                    TextSpan(
                                                      text: movie.popularity!
                                                          .toStringAsFixed(2),
                                                      style: TextStyle(
                                                        fontSize: 16,
                                                        fontWeight:
                                                            FontWeight.w600,
                                                      ),
                                                    ),
                                                    TextSpan(text: "\n"),
                                                    TextSpan(
                                                      text: "Popularity",
                                                      style: TextStyle(
                                                          color: Colors.grey),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                    Expanded(
                                      child: Column(
                                        children: [
                                          RichText(
                                            textAlign: TextAlign.center,
                                            text: TextSpan(
                                              style: TextStyle(
                                                  color: Colors.black),
                                              children: const [
                                                TextSpan(
                                                  text: "63%\n",
                                                  style: TextStyle(
                                                    fontSize: 16,
                                                    fontWeight: FontWeight.w600,
                                                  ),
                                                ),
                                                TextSpan(
                                                  text: "Rotten Tomatoes",
                                                  style: TextStyle(
                                                      color: Colors.grey),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Expanded(
                                      child: Column(
                                        children: [
                                          RichText(
                                            text: TextSpan(
                                              style: TextStyle(
                                                  color: Colors.black),
                                              children: [
                                                TextSpan(
                                                  text: showRate,
                                                  style: TextStyle(
                                                    fontSize: 16,
                                                    fontWeight: FontWeight.w600,
                                                  ),
                                                ),
                                                TextSpan(text: "/10\n"),
                                                TextSpan(
                                                  text: "Rating",
                                                  style: TextStyle(
                                                      color: Colors.grey),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                SizedBox(
                                  height: 20,
                                ),

                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                    vertical: 2.0,
                                    horizontal: 20.0,
                                  ),
                                  child: Text(
                                    (movie.title ?? "no title"),
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      color: Color(0xff000101),
                                      fontSize: 24.0,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                                // Text("${movie.cast}"),
                                const SizedBox(
                                  height: 10.0,
                                ),

                                const SizedBox(
                                  height: 8.0,
                                ),

                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                    vertical: 2.0,
                                    horizontal: 16.0,
                                  ),
                                  child: Wrap(
                                    runSpacing: 10.0,
                                    children: List.generate(movie.genre.length,
                                        (index) {
                                      var data = movie.genre[index];
                                      return Container(
                                        margin: EdgeInsets.symmetric(
                                          horizontal: 4.0,
                                        ),
                                        padding: EdgeInsets.all(8.0),
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(16),
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

                                const SizedBox(
                                  height: 20.0,
                                ),

                                SingleChildScrollView(
                                  scrollDirection: Axis.horizontal,
                                  child: SizedBox(
                                    height: 50.0,
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      children: [
                                        CircleAvatar(
                                          backgroundImage: NetworkImage(
                                              'https://m.media-amazon.com/images/M/MV5BMTU0MjEyNzQyM15BMl5BanBnXkFtZTcwMTc4ODUxOQ@@._V1_UX214_CR0,0,214,317_AL_.jpg'),
                                          radius: 40,
                                        ),
                                        CircleAvatar(
                                          backgroundImage: NetworkImage(
                                              'https://m.media-amazon.com/images/M/MV5BMTcyMTU5MzgxMF5BMl5BanBnXkFtZTYwMDI0NjI1._V1_UX214_CR0,0,214,317_AL_.jpg'),
                                          radius: 40,
                                        ),
                                        CircleAvatar(
                                          backgroundImage: NetworkImage(
                                              'https://m.media-amazon.com/images/M/MV5BMTU0OTIzNTY1OV5BMl5BanBnXkFtZTgwNjk4MzE2MDI@._V1_UX214_CR0,0,214,317_AL_.jpg'),
                                          radius: 40,
                                        ),
                                        CircleAvatar(
                                          backgroundImage: NetworkImage(
                                              'https://m.media-amazon.com/images/M/MV5BZmVlNGExOGMtYzA2Mi00MDFjLThiYzEtMTE3N2RkNDQwMzRkXkEyXkFqcGdeQXVyOTAyMDgxODQ@._V1_UY317_CR131,0,214,317_AL_.jpg'),
                                          radius: 40,
                                        ),
                                        CircleAvatar(
                                          backgroundImage: NetworkImage(
                                              'https://m.media-amazon.com/images/M/MV5BYWM2ZDFkMDYtYzNhZC00ODhmLTgwMmUtYjUxNTAzYjM1ODBlXkEyXkFqcGdeQXVyMTI1NjU4MDIx._V1_UY317_CR20,0,214,317_AL_.jpg'),
                                          radius: 40,
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                SizedBox(height: 5),
                                Container(
                                  margin: EdgeInsets.symmetric(
                                      vertical: 20, horizontal: 50),
                                  child: Text(
                                    (movie.overview ?? ""),
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      height: 1.20,
                                      fontSize: 12,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 45.0,
                                  width:
                                      MediaQuery.of(context).size.width * 0.7,
                                  child: ElevatedButton.icon(
                                    icon: const Icon(Icons.movie),
                                    label: const Text("Book"),
                                    style: ElevatedButton.styleFrom(
                                      primary: Colors.red.withOpacity(0.8),
                                      shape: const StadiumBorder(),
                                    ),
                                    onPressed: () =>
                                        Get.to(BookingDetailView()),
                                  ),
                                ),
                                const SizedBox(
                                  height: 30.0,
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(
                            height: 30.0,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
