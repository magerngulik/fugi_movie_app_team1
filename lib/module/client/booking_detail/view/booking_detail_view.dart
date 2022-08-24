import 'package:flutter/material.dart';
import '../controller/booking_detail_controller.dart';

import 'package:get/get.dart';

class BookingDetailView extends StatelessWidget {
  const BookingDetailView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<BookingDetailController>(
      init: BookingDetailController(),
      builder: (controller) {
        controller.view = this;

        return Scaffold(
          appBar: AppBar(
            title: const Text("BookingDetail"),
          ),
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                children: [
                  Wrap(
                    spacing: 10,
                    runSpacing: 10,
                    children:
                        List.generate(controller.chairList.length, (index) {
                      return InkWell(
                        onTap: () {},
                        child: Container(
                          height: 30.0,
                          width: 30.0,
                          decoration: BoxDecoration(
                            color: Colors.red[200],
                            borderRadius: const BorderRadius.all(
                              Radius.circular(
                                6.0,
                              ),
                            ),
                          ),
                        ),
                      );
                    }),
                  ),
                  //body
                  SizedBox(
                    height: 100.0,
                    child: ListView.builder(
                      itemCount: 10,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        var day = DateTime.now().add(Duration(days: index));

                        return InkWell(
                          onTap: () {},
                          child: Container(
                            padding: const EdgeInsets.all(20.0),
                            child: Column(
                              children: [
                                Text("Mar"),
                                Text("${day.day}"),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
