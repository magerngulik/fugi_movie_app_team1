import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:fugi_movie_app/service/tmdb_service.dart';
import 'package:get/get.dart';
import '../view/admin_dashboard_view.dart';

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
