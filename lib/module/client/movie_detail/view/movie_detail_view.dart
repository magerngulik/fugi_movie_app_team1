import 'package:flutter/material.dart';
import '../controller/movie_detail_controller.dart';

import 'package:get/get.dart';

class MovieDetailView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<MovieDetailController>(
      init: MovieDetailController(),
      builder: (controller) {
        controller.view = this;

        return Scaffold(
          appBar: AppBar(
            title: Text("MovieDetail"),
          ),
        );
      },
    );
  }
}