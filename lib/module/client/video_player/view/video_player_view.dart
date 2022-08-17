import 'package:flutter/material.dart';
import '../controller/video_player_controller.dart';

import 'package:get/get.dart';

class VideoPlayerView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<VideoPlayerController>(
      init: VideoPlayerController(),
      builder: (controller) {
        controller.view = this;

        return Scaffold(
          appBar: AppBar(
            title: Text("VideoPlayer"),
          ),
        );
      },
    );
  }
}