import 'package:get/get.dart';
import '../view/booking_detail_view.dart';

class BookingDetailController extends GetxController {
  BookingDetailView? view;
  // List chairList = ["A1", "B2"];
  List selectedChairs = [];
  DateTime? selectedDate;
  String? selectedTime;

  @override
  void onInit() {
    super.onInit();
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
    "12:00",
    "13:00",
  ];

  List chairList = [
    "A1",
    "A2",
    "A3",
    "A4",
    "A5",
    "A6",
    "A7",
    "A8",
    "B1",
    "B2",
    "B3",
    "B4",
    "B5",
    "B6",
    "B7",
    "B8",
  ];
}
