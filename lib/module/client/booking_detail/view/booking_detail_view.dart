import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../controller/booking_detail_controller.dart';

import 'package:get/get.dart';

import '../widget/list_chair_seats_widget.dart';

class BookingDetailView extends StatelessWidget {
  const BookingDetailView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<BookingDetailController>(
      init: BookingDetailController(),
      builder: (controller) {
        controller.view = this;

        return Scaffold(
          backgroundColor: const Color(0xff1C1C27),
          appBar: AppBar(
            backgroundColor: const Color(0xff1C1C27),
            leading: IconButton(
              icon: Icon(FontAwesomeIcons.angleLeft),
              onPressed: () => Get.back(),
            ),
            centerTitle: true,
            title: const Text(
              "Select Seats",
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  /// List Seats Chair
                  Wrap(
                    spacing: 8,
                    runSpacing: 8,
                    children:
                        List.generate(controller.chairList.length, (index) {
                      var data = controller.chairList[index];
                      return ListChairSeatsWidget(
                        data: data,
                        index: index,
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
