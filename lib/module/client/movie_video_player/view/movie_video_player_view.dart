import 'package:flutter/material.dart';
import '../controller/movie_video_player_controller.dart';
import 'package:get/get.dart';
import 'package:video_player/video_player.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';
import 'package:flutter_screen_wake/flutter_screen_wake.dart';

class MovieVideoPlayerView extends StatefulWidget {
  @override
  State<MovieVideoPlayerView> createState() => _MovieVideoPlayerViewState();
}

class _MovieVideoPlayerViewState extends State<MovieVideoPlayerView> {
//controller bawaan video player
  VideoPlayerController? _controller;
  List videoList = ['butterfly.mp4', 'bee.mp4'];
  int index = 0;

  @override
  void initState() {
    super.initState();
    //rotasi portait di matikan
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.landscapeRight,
    ]);
    _controller = VideoPlayerController.network(
        'https://flutter.github.io/assets-for-api-docs/assets/videos/${videoList[index]}')
      ..initialize().then((_) {
        setState(() {});
      });
    _controller!.play();
  }

  //untuk mengatur disply dari grub button
  bool display = false;
  //untuk mengatur icon lock
  bool lock = true;
  double _brightness = 0;
  bool toggle = false;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<MovieVideoPlayerController>(
      init: MovieVideoPlayerController(),
      builder: (controller) {
        controller.view = widget;

        return Scaffold(
          body: SafeArea(
            child: Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                color: Colors.grey,
              ),
              child: Stack(
                children: [
                  InkWell(
                    onTap: () {
                      //untuk memunculkan grub button
                      setState(() {
                        display = !display;
                      });
                    },
                    child: Container(
                      color: Colors.grey,
                      height: MediaQuery.of(context).size.height,
                      width: MediaQuery.of(context).size.width,
                      //inisialisasi value dari controller
                      child: _controller!.value.isInitialized
                          ? AspectRatio(
                              //mengatur aspek ratio dari video yang akan di puter
                              aspectRatio: 16 / 9,
                              child: VideoPlayer(_controller!),
                            )
                          : Container(
                              //yang tampil kalau video masih di load
                              child: Center(
                                child: Text(
                                  "Loading Video",
                                  style: TextStyle(
                                    fontSize: 50,
                                  ),
                                ),
                              ),
                            ),
                    ),
                  ),
                  display
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
                                            setState(() {
                                              display = !display;
                                            });
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
                                        child: Container(
                                          width: 30,
                                          height: 250,
                                          child: Column(
                                            children: [
                                              Expanded(
                                                child: SfSlider.vertical(
                                                    value: _brightness,
                                                    onChanged: (value) {
                                                      setState(() {
                                                        _brightness = value;
                                                        FlutterScreenWake
                                                            .setBrightness(
                                                                _brightness);
                                                      });
                                                    }),
                                              ),
                                              Container(
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
                                          setState(() {
                                            //variable bawaan controller untuk memulai dan memberhentikan video
                                            _controller!.value.isPlaying
                                                ? _controller!.pause()
                                                : _controller!.play();
                                          });
                                        },
                                        icon: Icon(_controller!.value.isPlaying
                                            ? Icons.pause
                                            : Icons.play_arrow),
                                        iconSize: 120,
                                      )),
                                      Expanded(
                                        child: IconButton(
                                            onPressed: () async {
                                              await _controller!
                                                  .seekTo(Duration(seconds: 4));
                                              await _controller!.play();
                                              display = !display;
                                              setState(() {});
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
                              Container(
                                height: 100.0,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Container(
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
                                        setState(() {
                                          lock = !lock;
                                        });
                                      },
                                      child: Container(
                                        width: 150,
                                        child: Row(
                                          children: [
                                            Icon(
                                              lock
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
                                    Container(
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
                                    Container(
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
                                        if (index <= 1) {
                                          setState(() {
                                            index += 1;
                                          });
                                        }
                                      },
                                      child: Container(
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
