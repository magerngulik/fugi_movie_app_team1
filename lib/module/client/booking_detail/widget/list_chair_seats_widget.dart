import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/booking_detail_controller.dart';

class ListChairSeatsWidget extends GetView<BookingDetailController> {
  const ListChairSeatsWidget({
    Key? key,
    required this.data,
    required this.index,
  }) : super(key: key);

  final dynamic data;
  final int index;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
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
                : (controller.reservedSeats.contains(data))
                    ? Colors.white
                    : Color(0xff363740),
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
                    : controller.reservedSeats.contains(data)
                        ? Colors.black
                        : Colors.grey,
              ),
            ),
          ),
        );
      }),
    );
  }
}
