import 'package:flutter/services.dart';
import 'package:get/get.dart';
import '../view/movie_video_player_view.dart';
import 'package:video_player/video_player.dart';

class MovieVideoPlayerController extends GetxController {
  MovieVideoPlayerView? view;
  VideoPlayerController? videoPlayerController;
  int index = 0;
  String asset =
      // "https://github.com/denyocrworld/test_upload_video/raw/main/video.mp4";
      // "https://flutter.github.io/assets-for-api-docs/assets/videos/butterfly.mp4";
      "https://magerngulik.my.id/pasarmoderen/DC%20LEAGUE%20OF%20SUPER-PETS%20%E2%80%93%20Official%20Trailer.mp4";

  bool display = false;
  bool lock = true;
  double brightness = 0;
  bool toggle = false;

  @override
  void onInit() {
    super.onInit();
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.landscapeRight,
    ]);

    videoPlayerController = VideoPlayerController.network(asset)
      ..addListener(() {
        update();
      })
      ..setLooping(true)
      ..initialize().then((_) async {
        await videoPlayerController!.play();
        update();
      });
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
    videoPlayerController!.dispose();
  }
}
