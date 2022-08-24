import 'package:flutter/material.dart';
import '../controller/booking_list_controller.dart';

import 'package:get/get.dart';

class BookingListView extends StatelessWidget {
  const BookingListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<BookingListController>(
      init: BookingListController(),
      builder: (controller) {
        controller.view = this;

        return Scaffold(
          appBar: AppBar(
            title: const Text("BookingList"),
          ),
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                children: const [
                  //body
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}