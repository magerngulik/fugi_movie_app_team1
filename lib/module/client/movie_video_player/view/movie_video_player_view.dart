import 'package:flutter/material.dart';
import 'package:fugi_movie_app/module/client/movie_video_player/controller/movie_video_player_controller.dart';
import 'package:get/get.dart';
import 'package:video_player/video_player.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';
import 'package:flutter_screen_wake/flutter_screen_wake.dart';

class MovieVideoPlayerView extends StatelessWidget {
//controller bawaan video player
  // VideoPlayerController? controller.videoPlayerController;
  // List videoList = ['butterfly.mp4', 'bee.mp4'];
  // int index = 0;

  // final String asset =
  //     "https://github.com/denyocrworld/test_upload_video/raw/main/video.mp4";

  // @override
  // void initState() {
  //   super.initState();
  //   //rotasi portait di matikan
  //   SystemChrome.setPreferredOrientations([
  //     DeviceOrientation.landscapeLeft,
  //     DeviceOrientation.landscapeRight,
  //   ]);
  //   controller.videoPlayerController = VideoPlayerController.network(asset)
  //     ..addListener(() {
  //       setState(() {});
  //     })
  //     ..setLooping(true)
  //     ..initialize().then((_) {
  //       controller.videoPlayerController!.play();
  //       setState(() {});
  //     });
  // }

  // @override
  // void dispose() {
  //   // TODO: implement dispose
  //   controller.videoPlayerController!.dispose();
  //   super.dispose();
  // }

  // bool display = false;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<MovieVideoPlayerController>(
      init: MovieVideoPlayerController(),
      builder: (controller) {
        controller.view = this;

        return Scaffold(
          body: SafeArea(
            child: SizedBox(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              // decoration: BoxDecoration(
              //   color: Colors.grey,
              // ),
              child: Stack(
                children: [
                  InkWell(
                    onTap: () {
                      //untuk memunculkan grub button
                      controller.display = !controller.display;
                      controller.update();
                    },
                    child: SizedBox(
                      height: MediaQuery.of(context).size.height,
                      width: MediaQuery.of(context).size.width,
                      //inisialisasi value dari controller
                      child:
                          controller.videoPlayerController!.value.isInitialized
                              ? AspectRatio(
                                  //mengatur aspek ratio dari video yang akan di puter
                                  aspectRatio: 16 / 9,
                                  child: VideoPlayer(
                                      controller.videoPlayerController!),
                                )
                              : Container(
                                  //yang tampil kalau video masih di load
                                  color: Colors.black,
                                  child: Center(
                                    child: CircularProgressIndicator(
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                    ),
                  ),
                  controller.display
                      ? Container(
                          height: MediaQuery.of(context).size.height,
                          width: MediaQuery.of(context).size.width,
                          color: Colors.black.withOpacity(0.5),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Container(
                                height: 50,
                                decoration: BoxDecoration(
                                  color: Colors.transparent,
                                  borderRadius: const BorderRadius.all(
                                    Radius.circular(
                                      16.0,
                                    ),
                                  ),
                                ),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    IconButton(
                                        onPressed: () {
                                          Navigator.pop(context);
                                        },
                                        icon: Icon(
                                          Icons.arrow_back,
                                          color: Colors.white,
                                        )),
                                    Text(
                                      "Judul Video",
                                      style: TextStyle(
                                          fontSize: 20.0,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white),
                                    ),
                                    Container(
                                      child: IconButton(
                                          onPressed: () {
                                            //untuk menyembunyikan grub button
                                            controller.display =
                                                !controller.display;
                                            controller.update();
                                          },
                                          icon: Icon(
                                            Icons.close,
                                            color: Colors.white,
                                          )),
                                    )
                                  ],
                                ),
                              ),
                              Expanded(
                                child: Container(
                                  height: 100.0,
                                  decoration: BoxDecoration(
                                    color: Colors.transparent,
                                    borderRadius: const BorderRadius.all(
                                      Radius.circular(
                                        16.0,
                                      ),
                                    ),
                                  ),
                                  child: Row(
                                    children: [
                                      Expanded(
                                        child: SizedBox(
                                          width: 30,
                                          height: 250,
                                          child: Column(
                                            children: [
                                              Expanded(
                                                child: SfSlider.vertical(
                                                    value:
                                                        controller.brightness,
                                                    onChanged: (value) {
                                                      controller.brightness =
                                                          value;

                                                      FlutterScreenWake
                                                          .setBrightness(
                                                              controller
                                                                  .brightness);
                                                      controller.update();
                                                    }),
                                              ),
                                              SizedBox(
                                                height: 30,
                                                child: Icon(
                                                  Icons.brightness_5,
                                                  color: Colors.white,
                                                ),
                                              )
                                            ],
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                          child: IconButton(
                                              onPressed: () {},
                                              icon: FaIcon(FontAwesomeIcons
                                                  .arrowRotateLeft),
                                              iconSize: 50)),
                                      Expanded(
                                          child: IconButton(
                                        onPressed: () {
                                          controller.videoPlayerController!
                                                  .value.isPlaying
                                              ? controller
                                                  .videoPlayerController!
                                                  .pause()
                                              : controller
                                                  .videoPlayerController!
                                                  .play();
                                        },
                                        icon: Icon(controller
                                                .videoPlayerController!
                                                .value
                                                .isPlaying
                                            ? Icons.pause
                                            : Icons.play_arrow),
                                        iconSize: 120,
                                      )),
                                      Expanded(
                                        child: IconButton(
                                            onPressed: () async {
                                              await controller
                                                  .videoPlayerController!
                                                  .seekTo(Duration(seconds: 4));
                                              await controller
                                                  .videoPlayerController!
                                                  .play();
                                              controller.display =
                                                  !controller.display;
                                              controller.update();
                                            },
                                            icon: FaIcon(FontAwesomeIcons
                                                .arrowRotateRight),
                                            iconSize: 50),
                                      ),
                                      Expanded(
                                        child: Container(),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 100.0,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    SizedBox(
                                      width: 150,
                                      child: Row(
                                        children: const [
                                          Icon(
                                            Icons.speed,
                                            color: Colors.white,
                                          ),
                                          Text(
                                            "Speed",
                                            style: TextStyle(
                                                fontSize: 15.0,
                                                color: Colors.white),
                                          ),
                                        ],
                                      ),
                                    ),
                                    InkWell(
                                      onTap: () {
                                        //menganti logo lock
                                        controller.lock = !controller.lock;
                                        controller.update();
                                      },
                                      child: SizedBox(
                                        width: 150,
                                        child: Row(
                                          children: [
                                            Icon(
                                              controller.lock
                                                  ? Icons.lock_open
                                                  : Icons.lock,
                                              color: Colors.white,
                                            ),
                                            Text(
                                              "Lock",
                                              style: TextStyle(
                                                  fontSize: 15.0,
                                                  color: Colors.white),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      width: 150,
                                      child: Row(
                                        children: const [
                                          Icon(
                                            Icons.list_alt,
                                            color: Colors.white,
                                          ),
                                          Text(
                                            "Episode",
                                            style: TextStyle(
                                                fontSize: 15.0,
                                                color: Colors.white),
                                          ),
                                        ],
                                      ),
                                    ),
                                    SizedBox(
                                      width: 150,
                                      child: Row(
                                        children: const [
                                          Icon(
                                            Icons.chat,
                                            color: Colors.white,
                                          ),
                                          Text(
                                            "Audio & Subtitle",
                                            style: TextStyle(
                                                fontSize: 12,
                                                color: Colors.white),
                                          ),
                                        ],
                                      ),
                                    ),
                                    InkWell(
                                      onTap: () {
                                        if (controller.index <= 1) {
                                          controller.index += 1;
                                          controller.update();
                                        }
                                      },
                                      child: SizedBox(
                                        width: 150,
                                        child: Row(
                                          children: const [
                                            Icon(
                                              Icons.skip_next,
                                              color: Colors.white,
                                            ),
                                            Text(
                                              "Next Episode",
                                              style: TextStyle(
                                                  fontSize: 12,
                                                  color: Colors.white),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        )
                      :
                      //container kosong yang di tampilkan ketika grub button disembunyikan
                      Container()
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
