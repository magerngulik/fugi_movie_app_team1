import 'package:get/get.dart';
import '../view/booking_detail_view.dart';

class BookingDetailController extends GetxController {
  BookingDetailView? view;
  List selectedChairs = [].obs;
  List chairList = [];
  DateTime? selectedDate;
  String? selectedTime;

  @override
  void onInit() {
    super.onInit();
    addingChairList();
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

  List chairs = ['A', 'B', 'C', 'D', 'E'];

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

  void changeSelectedChairs({required String data}) {
    if (!selectedChairs.contains(data)) {
      selectedChairs.add(data);
    } else {
      selectedChairs.remove(data);
    }
  }
}
