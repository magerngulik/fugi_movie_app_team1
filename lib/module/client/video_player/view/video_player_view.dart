import 'package:flutter/material.dart';
import '../controller/video_player_controller.dart';
import 'package:get/get.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class VideoPlayerView extends StatefulWidget {
  @override
  State<VideoPlayerView> createState() => _VideoPlayerViewState();
}

class _VideoPlayerViewState extends State<VideoPlayerView> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<VideoPlayerController>(
      init: VideoPlayerController(),
      builder: (controller) {
        controller.view = widget;

        return Scaffold(
          appBar: AppBar(
            title: Text("VideoPlayer"),
          ),
        );
      },
    );
  }
}
