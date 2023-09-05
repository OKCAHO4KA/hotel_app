import 'package:flutter/material.dart';
import 'package:hotel_app/helpers/services/api_client.dart';
import 'package:hotel_app/models/booking_model.dart';
import 'package:hotel_app/models/hotel_model_response.dart';
import 'package:hotel_app/models/rooms_model.dart';

class HotelInfoProvider extends ChangeNotifier {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  bool _isEnebledExtendedTile = true;

  bool get isEnebledExtendedTile => _isEnebledExtendedTile;
  set isEnebledExtendedTile(value) {
    _isEnebledExtendedTile = value;
    notifyListeners();
  }

  bool isValidForm() {
    return formKey.currentState?.validate() ?? false;
  }

  HotelResponse? infoHotel;
  Booking? booking;
  Rooms? listRooms;
  bool _isLoading = true;
  bool get isLoading => _isLoading;
  int totalPay = 0;

  set isLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }

  Future aboutHotel() async {
    try {
      final resp = await ApiClient().aboutHotel();
      if (resp != null) {
        infoHotel = HotelResponse.fromJson(resp.data);
        isLoading = false;

        return infoHotel!;
      }
    } catch (e) {
      isLoading = true;
      return;
    }
    notifyListeners();
  }

  Future listHotelRooms() async {
    try {
      final resp = await ApiClient().listHotelRooms();
      if (resp != null) {
        listRooms = Rooms.fromJson(resp.data);
        isLoading = false;

        return listRooms!;
      }
    } catch (e) {
      isLoading = true;
      return;
    }
    notifyListeners();
  }

  Future infoBooking() async {
    try {
      final resp = await ApiClient().infoBooking();
      if (resp != null) {
        booking = Booking.fromJson(resp.data);
        isLoading = false;

        return booking!;
      }
    } catch (e) {
      isLoading = true;
      return;
    }
    notifyListeners();
  }

  int getTotalPay() {
    totalPay =
        booking!.tourPrice! + booking!.fuelCharge! + booking!.serviceCharge!;

    return totalPay;
  }
}
