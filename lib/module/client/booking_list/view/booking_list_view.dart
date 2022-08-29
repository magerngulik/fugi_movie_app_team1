import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
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
          body: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.all(15),
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                color: Colors.white,
                child: ListView.builder(
                  itemCount: 3,
                  itemBuilder: (BuildContext context, int index) {
                    return Column(
                      children: const [
                        SizedBox(
                          height: 10,
                        ),
                        CartBooking(
                          url:
                              'https://encrypted-tbn1.gstatic.com/images?q=tbn:ANd9GcRHXV5at6mvLIF852fvIA5jeUi6bVYs8swuCPUCRWdRxWp0sr5Q',
                          judul: 'THOR LOVE AND THUNDER',
                          alamat: 'SKA XXI - CINEMA 21',
                          tanggal: 'Sabtu, 09 Juli 2022',
                          jmlTiket: "Tiket(1)",
                          respon: 'Berhasil',
                        ),
                        Divider(
                          color: Colors.grey,
                        )
                      ],
                    );
                  },
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
