import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
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
                      return ListChairSeats(
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

class ListChairSeats extends GetView<BookingDetailController> {
  const ListChairSeats({
    Key? key,
    required this.data,
    required this.index,
  }) : super(key: key);

  final dynamic data;
  final int index;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        controller.changeSelectedChairs(data: data);
      },
      child: Obx(() {
        return Container(
          margin: EdgeInsets.only(
            right: (index % 2 == 0) ? 8 : 0,
            left: (index % 1 == 1) ? 4 : 0,
          ),
          height: 30.0,
          width: 30.0,
          decoration: BoxDecoration(
            color: controller.selectedChairs.contains(data)
                ? Color(0xfffe5524)
                : Colors.white,
            borderRadius: const BorderRadius.all(
              Radius.circular(
                6.0,
              ),
            ),
          ),
          child: Center(
            child: Text(
              data,
              style: TextStyle(
                color: controller.selectedChairs.contains(data)
                    ? Colors.white
                    : Colors.black,
              ),
            ),
          ),
        );
      }),
    );
  }
}
