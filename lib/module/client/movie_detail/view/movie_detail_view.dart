// ignore_for_file: prefer_const_literals_to_create_immutables

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
            body: Stack(
              children: [
                Container(
                  height: MediaQuery.of(context).size.height * 0.8,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage(
                        "https://tse3.mm.bing.net/th?id=OIP.WT8tQIdjO63hzvjJMlwnegHaK-&pid=Api&P=0",
                      ),
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
                Container(
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 30.0,
                      ),
                      Container(
                        height: 50,
                        child: Container(
                          height: 100.0,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  CircleAvatar(
                                    backgroundColor:
                                        Colors.grey.withOpacity(0.3),
                                    radius: 20,
                                    child: Icon(
                                      Icons.highlight_off,
                                      color: Colors.white,
                                      size: 25.0,
                                    ),
                                  ),
                                ],
                              ),
                              Container(
                                height: 40,
                                width: 100,
                                child: Container(
                                  height: 50,
                                  decoration: BoxDecoration(
                                      color: Colors.grey.withOpacity(0.5),
                                      borderRadius: BorderRadius.circular(20)),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
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
                            ],
                          ),
                        ),
                      ),
                      Container(
                        height: 300,
                        child: Icon(
                          Icons.play_circle_rounded,
                          size: 65,
                          color: Colors.red.withOpacity(0.8),
                        ),
                      ),
                      Container(
                        height: MediaQuery.of(context).size.height * 0.55,
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
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(
                                  child: Column(
                                    children: [
                                      RichText(
                                        text: TextSpan(
                                          style: TextStyle(color: Colors.black),
                                          children: const [
                                            TextSpan(
                                              text: "6.8/",
                                              style: TextStyle(
                                                fontSize: 16,
                                                fontWeight: FontWeight.w600,
                                              ),
                                            ),
                                            TextSpan(text: "10\n"),
                                            TextSpan(
                                              text: "IMDb",
                                              style:
                                                  TextStyle(color: Colors.grey),
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
                                          style: TextStyle(color: Colors.black),
                                          children: const [
                                            TextSpan(
                                              text: "          63%\n",
                                              style: TextStyle(
                                                fontSize: 16,
                                                fontWeight: FontWeight.w600,
                                              ),
                                            ),
                                            TextSpan(
                                              text: "Rotten TerMatces",
                                              style:
                                                  TextStyle(color: Colors.grey),
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
                                          style: TextStyle(color: Colors.black),
                                          children: const [
                                            TextSpan(
                                              text: "4",
                                              style: TextStyle(
                                                fontSize: 16,
                                                fontWeight: FontWeight.w600,
                                              ),
                                            ),
                                            TextSpan(text: "10\n"),
                                            TextSpan(
                                              text: "ign",
                                              style:
                                                  TextStyle(color: Colors.grey),
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
                            Container(
                              child: Text(
                                "Fantastic Beasts: The\n Screts of Dumbledore",
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  height: 80.0,
                                  child: Row(
                                    children: [
                                      Container(
                                        width: 75.0,
                                        height: 30,
                                        decoration: BoxDecoration(
                                          border:
                                              Border.all(color: Colors.grey),
                                          borderRadius:
                                              BorderRadius.circular(30),
                                        ),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: const [
                                            Text(
                                              "fantasy",
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                fontSize: 14,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Container(
                                        width: 90.0,
                                        height: 30,
                                        decoration: BoxDecoration(
                                          border:
                                              Border.all(color: Colors.grey),
                                          borderRadius:
                                              BorderRadius.circular(30),
                                        ),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: const [
                                            Text(
                                              "Advanture",
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                fontSize: 14,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            Container(
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
                            SizedBox(height: 5),
                            Container(
                              height: 48,
                              margin: EdgeInsets.symmetric(
                                  vertical: 20, horizontal: 50),
                              child: Text(
                                "Professor Albus Dumbledore knows the powerful, dark wizard Gellert Grindelwald is moving to seize control of the wizarding worl. Unable to stop him..",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  height: 1.20,
                                  fontSize: 12,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                            SingleChildScrollView(
                              child: Column(
                                children: [
                                  Container(
                                    height: 100.0,
                                    margin: EdgeInsets.symmetric(
                                        vertical: 0, horizontal: 90),
                                    decoration: BoxDecoration(
                                      color: Color(0xffcbdad5),
                                    ),
                                  ),
                                ],
                              ),
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
        });
  }
}
