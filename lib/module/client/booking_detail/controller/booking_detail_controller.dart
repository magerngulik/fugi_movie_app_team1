import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:fugi_movie_app/module/client/dashboard/view/dashboard_view.dart';
import 'package:fugi_movie_app/module/client/movie_detail/controller/movie_detail_controller.dart';
import 'package:get/get.dart';
import '../view/booking_detail_view.dart';

class BookingDetailController extends GetxController {
  BookingDetailView? view;
  List reservedSeats = [];
  List chairList = [];

  List selectedChairs = [].obs;
  Rxn<DateTime> selectedDate = Rxn<DateTime>();
  Rxn<String> selectedTime = Rxn<String>();
  Rxn<String> selectedPayment = Rxn<String>();

  final totalPrice = 0.0.obs;
  final priceTicket = 125000.0;

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
  List paymentList = ['Debit', 'OVO', 'Gopay', 'Dana'];

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
    changeTotalPrice();
  }

  changeTotalPrice() {
    totalPrice.value = (selectedChairs.length * priceTicket).toDouble();
  }

  bookTicket() async {
    // List selectedChairs = [].obs;
    // Rxn<DateTime> selectedDate = Rxn<DateTime>();
    // Rxn<String> selectedTime = Rxn<String>();
    // Rxn<String> selectedPayment = Rxn<String>();

    MovieDetailController movieDetailController = Get.find();
    movieDetailController.view!.movie;

    await FirebaseFirestore.instance.collection("orders").add({
      "created_at": Timestamp.now(),
      "date": selectedDate.value,
      "time": selectedTime.value,
      "payment_method": selectedPayment.value,
      "chairs": selectedChairs,
      "movie": {
        "movie_name": movieDetailController.view!.movie.title,
        "photo": movieDetailController.view!.movie.posterPath,
      },
      "cinema": "Fugi Cinema XXI",
      "payment_status": "Done",
    });

    Get.offAll(DashboardView());
  }
}
