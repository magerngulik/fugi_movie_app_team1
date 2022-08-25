import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:fugi_movie_app/service/tmdb_service.dart';
import '../controller/admin_movie_list_controller.dart';

import 'package:get/get.dart';

class AdminMovieListView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<AdminMovieListController>(
      init: AdminMovieListController(),
      builder: (controller) {
        controller.view = this;

        return Scaffold(
          appBar: AppBar(
            title: Text("AdminMovieList"),
          ),
          body: Padding(
            padding: const EdgeInsets.all(20.0),
            child: StreamBuilder<QuerySnapshot>(
              stream:
                  FirebaseFirestore.instance.collection("movies").snapshots(),
              builder: (context, snapshot) {
                if (snapshot.hasError) return Text("Error");
                if (!snapshot.hasData) return Text("No Data");
                final data = snapshot.data!;

                return ListView.builder(
                  itemCount: data.docs.length,
                  itemBuilder: (context, index) {
                    var item = (data.docs[index].data() as Map);

                    return Container(
                      margin: const EdgeInsets.only(bottom: 10.0),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(
                            width: 80.0,
                            height: 120.0,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: NetworkImage(
                                  TMDBService.url(item["poster_path"]),
                                ),
                                fit: BoxFit.cover,
                              ),
                              borderRadius: BorderRadius.all(
                                Radius.circular(16.0),
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 20.0,
                          ),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text("${item["genre_ids"]}"),
                                Text(
                                  "${item["original_title"]}",
                                  style: const TextStyle(
                                    color: Colors.white,
                                  ),
                                ),
                                SizedBox(
                                  height: 10.0,
                                ),
                                Text(
                                  "${item["overview"]}",
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 3,
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 10.0,
                                  ),
                                ),
                                const SizedBox(
                                  height: 6.0,
                                ),
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Icon(
                                      Icons.star,
                                      color: Colors.orange,
                                      size: 20.0,
                                    ),
                                    const SizedBox(
                                      width: 6.0,
                                    ),
                                    Text(
                                      "${item["vote_average"]}",
                                      style: const TextStyle(
                                        fontSize: 10.0,
                                        color: Colors.white,
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
        );
      },
    );
  }
}
