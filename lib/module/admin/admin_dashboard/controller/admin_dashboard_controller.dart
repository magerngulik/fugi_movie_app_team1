import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fugi_movie_app/module/admin/admin_video/view/admin_video_view.dart';
import 'package:fugi_movie_app/module/client/booking_detail/view/booking_detail_view.dart';
import 'package:fugi_movie_app/module/client/dashboard/view/dashboard_view.dart';
import 'package:fugi_movie_app/module/client/login/view/login_view.dart';
import 'package:fugi_movie_app/module/client/movie_list/view/movie_list_view.dart';
import 'package:fugi_movie_app/module/client/profile/view/profile_view.dart';
import 'package:fugi_movie_app/module/client/welcome/view/welcome_view.dart';
import 'package:fugi_movie_app/service/tmdb_service.dart';
import 'package:get/get.dart';
import '../../../client/booking_list/view/booking_list_view.dart';
import '../view/admin_dashboard_view.dart';
import '../../../client/movie_video_player/view/movie_video_player_view.dart';

class AdminDashboardController extends GetxController {
  AdminDashboardView? view;
  var loading = false.obs;

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

  List menus = [
    {
      "icon": Icons.developer_board,
      "label": "Get Trending\nMovies",
      "onTap": () {
        AdminDashboardController controller = Get.find();
        controller.getTrendingMovies();
      },
    },
    {
      "icon": Icons.developer_board,
      "label": "Get Lastest\nMovies",
      "onTap": () {
        AdminDashboardController controller = Get.find();
        controller.getLastestMovie();
      },
    },
    {
      "icon": Icons.developer_board,
      "label": "Search\nMovie",
      "onTap": () {
        AdminDashboardController controller = Get.find();
        controller.searchMovie(
          query: "spi",
        );
      },
    },
    {
      "icon": Icons.developer_board,
      "label": "Update Movies\nto\nFirestore",
      "onTap": () {
        AdminDashboardController controller = Get.find();
        controller.updateFirestore();
      },
    },
    {
      "icon": Icons.developer_board,
      "label": "Delete Movies\nin\nFirestore",
      "onTap": () {
        AdminDashboardController controller = Get.find();
        controller.deleteMoviesInFirestore();
      },
    },
  ];

  List appMenus = [
    {
      "icon": Icons.developer_board,
      "label": "Welcome",
      "onTap": () {
        Get.to(WelcomeView());
      },
    },
    {
      "icon": Icons.developer_board,
      "label": "Login",
      "onTap": () {
        Get.to(LoginView());
      },
    },
    {
      "icon": Icons.developer_board,
      "label": "Dashboard",
      "onTap": () {
        Get.to(DashboardView());
      },
    },
    {
      "icon": Icons.developer_board,
      "label": "Booking List",
      "onTap": () {
        Get.to(BookingListView());
      },
    },

    // {
    //   "icon": Icons.developer_board,
    //   "label": "Movie Detail",
    //   "onTap": () {
    //     Get.to(MovieDetailView());
    //   },
    // },
    {
      "icon": Icons.developer_board,
      "label": "Movie List",
      "onTap": () async {
        await Get.to(MovieListView());
        SystemChrome.setPreferredOrientations([
          DeviceOrientation.portraitUp,
          DeviceOrientation.portraitDown,
        ]);
      },
    },
    {
      "icon": Icons.developer_board,
      "label": "Booking Detail",
      "onTap": () async {
        await Get.to(BookingDetailView());
        SystemChrome.setPreferredOrientations([
          DeviceOrientation.portraitUp,
          DeviceOrientation.portraitDown,
        ]);
      },
    },

    {
      "icon": Icons.developer_board,
      "label": "Profile",
      "onTap": () async {
        await Get.to(ProfileView());
        SystemChrome.setPreferredOrientations([
          DeviceOrientation.portraitUp,
          DeviceOrientation.portraitDown,
        ]);
      },
    },
    {
      "icon": Icons.developer_board,
      "label": "Video Player",
      "onTap": () async {
        await Get.to(AdminVideoView());
        SystemChrome.setPreferredOrientations([
          DeviceOrientation.portraitUp,
          DeviceOrientation.portraitDown,
        ]);
      },
    },
    {
      "icon": Icons.developer_board,
      "label": "Movie Video Player",
      "onTap": () async {
        await Get.to(MovieVideoPlayerView());
        SystemChrome.setPreferredOrientations([
          DeviceOrientation.portraitUp,
          DeviceOrientation.portraitDown,
        ]);
      },
    },
  ];

  getTrendingMovies() async {
    loading.value = true;

    for (var page = 1; page <= 10; page++) {
      log("Load data...");
      var response = await TMDBService().getTrendingMovies(page: page);
      log("$response");
      log("Page: ${response["page"]}");
      log("Total Pages: ${response["total_pages"]}");
      log("Results Length: ${response["results"].length}");
      log("Total Results: ${response["total_results"]}");
      log("Done!");
    }

    loading.value = false;
  }

  getLastestMovie() async {
    loading.value = true;

    log("Load data...");
    var response = await TMDBService().getLastestMovie();
    log("$response");
    log("Done!");

    loading.value = false;
  }

  searchMovie({
    required String query,
  }) async {
    loading.value = true;

    log("Load data...");
    var response = await TMDBService().searchMovieByKeyword(
      query: query,
      page: 1,
    );
    log("$response");
    log("Done!");

    loading.value = false;
  }

  var genres = [
    {"id": 28, "name": "Action"},
    {"id": 12, "name": "Adventure"},
    {"id": 16, "name": "Animation"},
    {"id": 35, "name": "Comedy"},
    {"id": 80, "name": "Crime"},
    {"id": 99, "name": "Documentary"},
    {"id": 18, "name": "Drama"},
    {"id": 10751, "name": "Family"},
    {"id": 14, "name": "Fantasy"},
    {"id": 36, "name": "History"},
    {"id": 27, "name": "Horror"},
    {"id": 10402, "name": "Music"},
    {"id": 9648, "name": "Mystery"},
    {"id": 10749, "name": "Romance"},
    {"id": 878, "name": "Science Fiction"},
    {"id": 10770, "name": "TV Movie"},
    {"id": 53, "name": "Thriller"},
    {"id": 10752, "name": "War"},
    {"id": 37, "name": "Western"}
  ];

  updateFirestore() async {
    loading.value = true;

    var snapshot = await FirebaseFirestore.instance.collection("movies").get();
    for (var i = 0; i < snapshot.docs.length; i++) {
      var doc = snapshot.docs[i];
      await FirebaseFirestore.instance
          .collection("movies")
          .doc(doc.id)
          .delete();
    }

    var maximumPages = 1;
    for (var page = 1; page <= maximumPages; page++) {
      log("Load data...");
      var response = await TMDBService().getTrendingMovies(page: page);
      log("$response");
      log("Page: ${response["page"]}");
      log("Total Pages: ${response["total_pages"]}");
      log("Results Length: ${response["results"].length}");
      log("Total Results: ${response["total_results"]}");
      log("Done!");

      List results = response["results"];
      for (var i = 0; i < results.length; i++) {
        var movie = results[i];

        var genreIds = [];
        var genreIdsBase = (movie["genre_ids"] as List);
        for (var i = 0; i < genreIdsBase.length; i++) {
          var genreId = genreIdsBase[i];
          var genre = "";
          var search = genres.where((i) => i["id"] == genreId).toList();
          if (search.isEmpty) {
            genre = "General";
          } else {
            Map item = search.first;
            genre = item["name"];
          }
          genreIds.add(genre);
        }
        movie["genre_ids"] = genreIds;

        movie["cast"] = [
          "https://images.unsplash.com/photo-1506794778202-cad84cf45f1d?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=387&q=80",
          "https://images.unsplash.com/photo-1508341591423-4347099e1f19?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=387&q=80",
          "https://images.unsplash.com/photo-1594744803329-e58b31de8bf5?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=387&q=80",
          "https://images.unsplash.com/photo-1488426862026-3ee34a7d66df?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=387&q=80",
          "https://images.unsplash.com/photo-1488716820095-cbe80883c496?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=386&q=80",
        ];

        await FirebaseFirestore.instance.collection("movies").add(movie);
      }
    }

    loading.value = false;
  }

  deleteMoviesInFirestore() async {
    loading.value = true;

    var snapshot = await FirebaseFirestore.instance.collection("movies").get();
    for (var i = 0; i < snapshot.docs.length; i++) {
      var doc = snapshot.docs[i];
      await FirebaseFirestore.instance
          .collection("movies")
          .doc(doc.id)
          .delete();
    }

    loading.value = false;
  }
}
