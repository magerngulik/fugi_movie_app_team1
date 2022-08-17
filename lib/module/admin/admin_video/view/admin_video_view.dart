import 'package:flutter/material.dart';
import '../controller/admin_video_controller.dart';
import 'package:get/get.dart';
import 'package:video_player/video_player.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class AdminVideoView extends StatefulWidget {
  @override
  State<AdminVideoView> createState() => _AdminVideoViewState();
}

class _AdminVideoViewState extends State<AdminVideoView> {
  //controller bawaan video player
  VideoPlayerController? _controller;
  @override
  void initState() {
    super.initState();
    //rotasi portait di matikan
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.landscapeRight,
    ]);
    _controller = VideoPlayerController.network(
        'https://flutter.github.io/assets-for-api-docs/assets/videos/butterfly.mp4')
      ..initialize().then((_) {
        setState(() {});
      });
  }

  //untuk mengatur disply dari grub button
  bool display = false;
  //untuk mengatur icon lock
  bool lock = true;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AdminVideoController>(
      init: AdminVideoController(),
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
                      color: Colors.red,
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
                              child: Text(
                                "Loading Video",
                                style: TextStyle(
                                  fontSize: 20.0,
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
                                        onPressed: () {},
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
                                            onPressed: () {},
                                            icon: FaIcon(FontAwesomeIcons
                                                .arrowRotateRight),
                                            iconSize: 50),
                                      ),
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
                                    Container(
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
