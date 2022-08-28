import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:fugi_movie_app/service/tmdb_service.dart';
import 'package:intl/intl.dart';
import '../../../../model/movie_model.dart';
import '../controller/movie_list_controller.dart';
import 'package:get/get.dart';

class MovieListView extends StatelessWidget {
  const MovieListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<MovieListController>(
      init: MovieListController(),
      builder: (controller) {
        controller.view = this;

        return Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            iconTheme: IconThemeData(color: Colors.black),
            backgroundColor: Colors.white,
            title: Center(
              child: const Text(
                "MOVIE",
                style:
                    TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
              ),
            ),
            actions: const [
              SizedBox(
                width: 50,
                height: 50,
              )
            ],
          ),
          body: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(
                    vertical: 4.0,
                    horizontal: 6.0,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.grey[200],
                    borderRadius: const BorderRadius.all(
                      Radius.circular(25),
                    ),
                    border: Border.all(
                      width: 0.4,
                      color: Colors.grey[400]!,
                    ),
                  ),
                  child: Row(
                    children: [
                      const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Icon(
                          Icons.search,
                          color: Colors.black,
                        ),
                      ),
                      Expanded(
                        child: TextField(
                          decoration: const InputDecoration.collapsed(
                            filled: true,
                            fillColor: Colors.transparent,
                            hintStyle: TextStyle(color: Colors.black),
                            hintText: "Search",
                          ),
                          onSubmitted: (value) {
                            controller.search = value;
                            controller.update();
                          },
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 25.0,
                ),
                Expanded(
                  child: StreamBuilder<QuerySnapshot>(
                    stream: FirebaseFirestore.instance
                        .collection("movies")
                        .where("title", isNotEqualTo: "null")
                        .snapshots(),
                    builder: (context, snapshot) {
                      if (snapshot.hasError) return Text("Error");
                      if (!snapshot.hasData) return Text("No Data");
                      final data = snapshot.data!;

                      return ListView.builder(
                        itemCount: data.docs.length,
                        itemBuilder: (context, index) {
                          var item = (data.docs[index].data() as Map);

                          if (controller.search.isNotEmpty) {
                            if (!item["title"]
                                .toString()
                                .toLowerCase()
                                .contains(controller.search.toLowerCase())) {
                              return Container();
                            }
                          }

                          MovieModel dataMovie = MovieModel.fromJson(
                              data.docs[index].data() as Map<String, dynamic>);
                          String rate = item["vote_average"].toString();
                          String showRate = rate.substring(0, 3);
                          DateTime dataTime =
                              DateTime.parse(item["release_date"]);
                          String formattedDate =
                              DateFormat.yMMMd().format(dataTime);

                          return Container(
                            margin: const EdgeInsets.only(bottom: 10.0),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Stack(
                                  children: [
                                    Container(
                                      width: 120,
                                      height: 180,
                                      decoration: BoxDecoration(
                                        image: DecorationImage(
                                          image: NetworkImage(
                                            TMDBService.url(
                                                item["poster_path"]),
                                          ),
                                          fit: BoxFit.cover,
                                        ),
                                        borderRadius: BorderRadius.all(
                                          Radius.circular(16.0),
                                        ),
                                      ),
                                    ),
                                    Positioned(
                                      bottom: 0,
                                      right: 0,
                                      child: Container(
                                        height: 60,
                                        width: 50,
                                        decoration: BoxDecoration(
                                          gradient: LinearGradient(
                                              begin: Alignment.topCenter,
                                              end: Alignment.bottomCenter,
                                              colors: const [
                                                Colors.orange,
                                                Colors.red
                                              ]),
                                          borderRadius: const BorderRadius.only(
                                            topLeft: Radius.circular(
                                              16.0,
                                            ),
                                            bottomRight: Radius.circular(
                                              16.0,
                                            ),
                                          ),
                                        ),
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Text(
                                              showRate,
                                              style: TextStyle(
                                                  fontSize: 23,
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.white),
                                            ),
                                            Text(
                                              "FUGI",
                                              style: TextStyle(
                                                  fontSize: 15.0,
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.white),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  width: 20.0,
                                ),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Text(
                                        "${item["title"]}",
                                        maxLines: 2,
                                        style: const TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 20,
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 20.0,
                                      ),
                                      Row(
                                        children: [
                                          Icon(
                                            Icons.my_library_books_outlined,
                                            color: Colors.black,
                                            size: 20,
                                          ),
                                          Row(
                                            children: [
                                              Wrap(
                                                direction: Axis.horizontal,
                                                children: dataMovie.genreIds
                                                    .map<Widget>(
                                                      (e) => Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                    .only(
                                                                left: 10.0),
                                                        child: Text(
                                                          e.toString(),
                                                          style: TextStyle(
                                                              fontSize: 12),
                                                        ),
                                                      ),
                                                    )
                                                    .toList(),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                      const SizedBox(
                                        height: 8,
                                      ),
                                      Row(
                                        children: [
                                          Icon(
                                            Icons.date_range,
                                            color: Colors.black,
                                            size: 20,
                                          ),
                                          const SizedBox(
                                            width: 10.0,
                                          ),
                                          Text(
                                            formattedDate,
                                            overflow: TextOverflow.ellipsis,
                                            maxLines: 3,
                                            style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 12.0,
                                            ),
                                          ),
                                        ],
                                      ),
                                      const SizedBox(
                                        height: 8,
                                      ),
                                      Row(
                                        children: const [
                                          Icon(
                                            Icons.timer,
                                            color: Colors.black,
                                            size: 20,
                                          ),
                                          SizedBox(
                                            width: 10.0,
                                          ),
                                          Text(
                                            "120 Minutes",
                                            overflow: TextOverflow.ellipsis,
                                            maxLines: 3,
                                            style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 12.0,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
