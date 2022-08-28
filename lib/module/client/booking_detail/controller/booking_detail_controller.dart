import 'dart:math';

import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import '../view/booking_detail_view.dart';

class BookingDetailController extends GetxController {
  BookingDetailView? view;
  List selectedChairs = [].obs;
  List reservedSeats = [];
  List chairList = [];
  DateTime? selectedDate;
  String? selectedTime;

  @override
  void onInit() {
    super.onInit();
    addingChairList();
    addingReservedSeats();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  List time = [
    "11:00",
    "11:30",
    "12:00",
    "14:05",
    "14:35",
    "15:05",
    "17:10",
    "18:10",
    "20:15",
    "21:15",
  ];

  List chairs = ['A', 'B', 'C', 'D', 'E'];
  List informationSelectSeats = ['Available', 'Selected', 'Reserved'];

  List generateListSeat({
    required int seat,
    required String chair,
  }) {
    return [for (var i = 1; i <= seat; i++) '$chair$i'];
  }

  addingChairList() {
    for (var element in chairs) {
      generateListSeat(seat: 8, chair: element).forEach((element) {
        chairList.add(element);
      });
    }
  }

  addingReservedSeats() {
    for (var element in chairs) {
      generateListSeat(seat: Random().nextInt(5) + 1, chair: element)
          .forEach((element) {
        reservedSeats.add(element);
      });
    }
  }

  void changeSelectedChairs({required String data}) {
    if (!selectedChairs.contains(data)) {
      if (!reservedSeats.contains(data)) {
        selectedChairs.add(data);
      } else {
        Fluttertoast.showToast(
          msg: 'The seat has been booked, please choose an available place',
        );
      }
    } else {
      selectedChairs.remove(data);
    }
  }
}
