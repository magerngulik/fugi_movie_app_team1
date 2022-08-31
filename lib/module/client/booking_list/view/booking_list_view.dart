import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import '../controller/booking_list_controller.dart';

import 'package:get/get.dart';

import '../widget/cart_booking.dart';

class BookingListView extends StatelessWidget {
  const BookingListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<BookingListController>(
      init: BookingListController(),
      builder: (controller) {
        controller.view = this;

        return Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            backgroundColor: Colors.white,
            iconTheme: IconThemeData(color: Colors.black),
            titleTextStyle: GoogleFonts.montserrat(
                color: Colors.black, fontWeight: FontWeight.bold),
            title: Center(
              child: Container(
                height: 45,
                width: 120,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/image/logo-fugi1.png'),
                    fit: BoxFit.fitWidth,
                  ),
                ),
              ),
            ),
            actions: const [
              Padding(
                padding: EdgeInsets.only(right: 10),
                child: Icon(
                  Icons.notifications_outlined,
                  color: Colors.black,
                  size: 35,
                ),
              ),
              SizedBox(
                height: 15.0,
              ),
            ],
          ),
          body: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                Expanded(
                  child: StreamBuilder<QuerySnapshot>(
                    stream: FirebaseFirestore.instance
                        .collection("orders")
                        .snapshots(),
                    builder: (context, snapshot) {
                      if (snapshot.hasError) return const Text("Error");
                      if (snapshot.data == null) return Container();
                      if (snapshot.data!.docs.isEmpty) {
                        return const Text("No Data");
                      }

                      final data = snapshot.data!;
                      return ListView.builder(
                        itemCount: data.docs.length,
                        itemBuilder: (context, index) {
                          var item = (data.docs[index].data() as Map);
                          item["id"] = data.docs[index].id;

                          var date = DateFormat("EEEE, d MMM y")
                              .format(item["date"].toDate());

                          return Column(
                            children: [
                              SizedBox(
                                height: 10,
                              ),
                              CartBooking(
                                url:
                                    "https://image.tmdb.org/t/p/w500${item["movie"]["photo"]}",
                                judul: item["movie"]["movie_name"],
                                alamat: item["cinema"],
                                tanggal: date,
                                jmlTiket: "Tiket (${item["chairs"].length})",
                                respon: 'Berhasil',
                              ),
                              Divider(
                                color: Colors.grey,
                              )
                            ],
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
