

import 'package:flutter/material.dart';
import 'package:flutter_cinema_app/model/seat_booking.dart';
import 'package:flutter_cinema_app/network/api_request.dart';

class SeatProvider extends ChangeNotifier {
  List<Seat> selectedSeats = [];
  int totalPrice = 0;
  List<String> selectingSeat = [];
  List<Seat> listSeat = [];
  List<String> listChairID = [];
  bool isLoading = false;
  String _id = '';

  String get id => _id;

  void getId(String id){
    _id = id;
    notifyListeners();
  }
  Future<void> getChair() async {
    isLoading = true;
    notifyListeners();
    listSeat.clear();
    final response = await ApiRequest.fetchDataChair(id);
    for (int i = 0; i < response.data['items'].length; i++) {
      Seat seat = Seat.fromJson(response.data['items'][i]);
      listSeat.add(seat);
    }
    isLoading = false;
    notifyListeners();
  }

  void selectSeat(Seat seat) {
    if (seat.status == 'UNBOOKED') {
      seat.status = 'SELECTED';
      selectedSeats.add(seat);
      notifyListeners();
    }
  }

  int calculateTotalPrice() {
    int price = 0;
    for (Seat seat in selectedSeats) {
      if (checkSeatType(seat)) {
        price += 140000;
      } else {
        price += seat.price!;
      }
    }
    return price;
  }

  void unSelectSeat(Seat seat) {
    if (seat.status == 'SELECTED') {
      seat.status = 'UNBOOKED';
      selectedSeats.remove(seat);
      notifyListeners();
    }
  }

  void resetSeat() {
    selectedSeats = [];
    totalPrice = 0;
  }
  void refreshData(bool shouldRefresh) {
    if (shouldRefresh) {
      getChair();
    }
  }

// Ham book ve
  void bookSeats() {
    totalPrice = calculateTotalPrice();
    selectingSeat = selectedSeats.map((seat) => seat.chairName.toString()).toList();
    listChairID = selectedSeats.map((seat) => seat.chairId.toString()).toList();

    notifyListeners();
  }

  void seatBooked() {
    for (Seat seat in selectedSeats) {
      seat.status = 'BOOKED';
    }
    notifyListeners();
  }

  bool checkSeatType(Seat seat) {
    if (seat.type == 'MANUAL') {
      return true;
    }
    return false;
  }

  Color getColor(Seat seat) {
    switch (seat.status) {
      case 'UNBOOKED':
        return Colors.grey;
      case 'SELECTED':
        return Colors.green;
      case 'BOOKED':
        return Colors.red;
      default:
        return Colors.grey;
    }
  }
}
