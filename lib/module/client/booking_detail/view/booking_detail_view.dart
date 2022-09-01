import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:fugi_movie_app/core/utils/time_extension.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import '../controller/booking_detail_controller.dart';
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
            controller: ScrollController(),
            child: Column(
              children: [
                const SizedBox(
                  height: 20.0,
                ),

                Image.network(
                  "https://i.ibb.co/vhvzm4m/gambar.jpg",
                  width: MediaQuery.of(context).size.width * 0.8,
                  height: 64.0,
                  fit: BoxFit.fitWidth,
                ),

                const SizedBox(
                  height: 30.0,
                ),

                /// List Seats Chair
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Wrap(
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
                ),

                SizedBox(
                  height: 24,
                ),

                /// Information List Seats Chair
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: controller.informationSelectSeats
                        .map<Widget>(
                          (data) => Padding(
                            padding: const EdgeInsets.only(right: 16.0),
                            child: Row(
                              children: [
                                CircleAvatar(
                                  backgroundColor: data == 'Available'
                                      ? Color(0xff363740)
                                      : data == 'Selected'
                                          ? Color(0xfffe5524)
                                          : Colors.white,
                                  radius: 4,
                                ),
                                SizedBox(
                                  width: 4.0,
                                ),
                                Text(
                                  data,
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 12,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        )
                        .toList(),
                  ),
                ),

                SizedBox(
                  height: 24,
                ),

                /// Select Date and Time
              ],
            ),
          ),
          bottomNavigationBar: Container(
            height: 310.0,
            padding: EdgeInsets.only(
              top: 16.0,
            ),
            decoration: BoxDecoration(
              color: Color(0xff2B2C34),
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(60),
                topRight: Radius.circular(60),
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  'Select Date and Time',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 12,
                  ),
                ),

                SizedBox(
                  height: 12,
                ),

                /// Select Date
                SizedBox(
                  height: 58,
                  child: ListView.builder(
                    itemCount: 30,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      var day = DateTime.now().add(Duration(days: index));

                      return Obx(() {
                        return InkWell(
                          onTap: () => controller.selectedDate.value = day,
                          child: Container(
                            margin: EdgeInsets.symmetric(horizontal: 8.0),
                            decoration: BoxDecoration(
                              color: (controller.selectedDate.value == null)
                                  ? Color(0xff38353D)
                                  : controller.selectedDate.value!
                                          .isAtSameMomentAs(day)
                                      ? Color(0xfffe5524)
                                      : Color(0xff38353D),
                              borderRadius: BorderRadius.circular(32),
                            ),
                            padding: const EdgeInsets.all(8.0),
                            child: Center(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    day.shortMonthName,
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 11.0,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 4,
                                  ),
                                  (controller.selectedDate.value == null)
                                      ? Text(
                                          "${day.day}",
                                          style: TextStyle(
                                            color: Colors.white,
                                          ),
                                        )
                                      : (controller.selectedDate.value!
                                              .isAtSameMomentAs(day))
                                          ? CircleAvatar(
                                              radius: 12,
                                              backgroundColor: Colors.white,
                                              child: Text(
                                                "${day.day}",
                                                style: TextStyle(
                                                  color: Colors.black,
                                                ),
                                              ),
                                            )
                                          : Text(
                                              "${day.day}",
                                              style: TextStyle(
                                                color: Colors.white,
                                              ),
                                            ),
                                ],
                              ),
                            ),
                          ),
                        );
                      });
                    },
                  ),
                ),

                SizedBox(
                  height: 16,
                ),

                /// Select Time
                SizedBox(
                  height: 28,
                  child: ListView.builder(
                    itemCount: controller.time.length,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      var data = controller.time[index];
                      return Obx(() {
                        return InkWell(
                          onTap: () => controller.selectedTime.value = data,
                          child: Container(
                            margin: EdgeInsets.symmetric(horizontal: 8.0),
                            padding: EdgeInsets.symmetric(
                                horizontal: 16, vertical: 4),
                            decoration: BoxDecoration(
                              color: Color(0xff38353D),
                              borderRadius: BorderRadius.circular(4),
                              border: (controller.selectedTime.value == null)
                                  ? null
                                  : (controller.selectedTime.value!
                                          .contains(data))
                                      ? Border.all(
                                          width: 2,
                                          color: Color(0xfffe5524),
                                        )
                                      : null,
                            ),
                            child: Center(
                              child: Text(
                                data,
                                style: TextStyle(
                                  color: (controller.selectedTime.value == null)
                                      ? Colors.white
                                      : (controller.selectedTime.value!
                                              .contains(data))
                                          ? Color(0xfffe5524)
                                          : Colors.white,
                                  fontSize: 11.0,
                                ),
                              ),
                            ),
                          ),
                        );
                      });
                    },
                  ),
                ),
                const SizedBox(
                  height: 20.0,
                ),

//select payment
                SizedBox(
                  height: 28,
                  child: ListView.builder(
                    itemCount: controller.paymentList.length,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      var data = controller.paymentList[index];
                      return Obx(() {
                        return InkWell(
                          onTap: () => controller.selectedPayment.value = data,
                          child: Container(
                            margin: EdgeInsets.symmetric(horizontal: 8.0),
                            padding: EdgeInsets.symmetric(
                                horizontal: 16, vertical: 4),
                            decoration: BoxDecoration(
                              color: Color(0xff38353D),
                              borderRadius: BorderRadius.circular(4),
                              border: (controller.selectedPayment.value == null)
                                  ? null
                                  : (controller.selectedPayment.value!
                                          .contains(data))
                                      ? Border.all(
                                          width: 2,
                                          color: Color(0xfffe5524),
                                        )
                                      : null,
                            ),
                            child: Center(
                              child: Text(
                                data,
                                style: TextStyle(
                                  color:
                                      (controller.selectedPayment.value == null)
                                          ? Colors.white
                                          : (controller.selectedPayment.value!
                                                  .contains(data))
                                              ? Color(0xfffe5524)
                                              : Colors.white,
                                  fontSize: 11.0,
                                ),
                              ),
                            ),
                          ),
                        );
                      });
                    },
                  ),
                ),

                SizedBox(
                  height: 16,
                ),
                Divider(
                  height: 16.0,
                ),
                const SizedBox(
                  height: 10.0,
                ),

                /// Total Price and Button Book Ticket
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 16.0,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Total Price',
                            style: TextStyle(
                              color: Colors.grey,
                              fontSize: 12.0,
                            ),
                          ),
                          const SizedBox(
                            height: 4,
                          ),
                          Obx(() {
                            return Text(
                              NumberFormat.currency(
                                      locale: 'id',
                                      symbol: 'Rp.',
                                      decimalDigits: 0)
                                  .format(controller.totalPrice.value),
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 16.0,
                              ),
                            );
                          }),
                        ],
                      ),
                      SizedBox(
                        width: 32,
                      ),
                      ElevatedButton(
                        onPressed: () => controller.bookTicket(),
                        style: ButtonStyle(
                          padding: MaterialStateProperty.all<EdgeInsets>(
                            EdgeInsets.symmetric(horizontal: 64, vertical: 16),
                          ),
                          backgroundColor: MaterialStateProperty.all<Color>(
                            Color(0xfffe5524),
                          ),
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(32),
                            ),
                          ),
                        ),
                        child: const Text(
                          'Book Ticket',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 20.0,
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
