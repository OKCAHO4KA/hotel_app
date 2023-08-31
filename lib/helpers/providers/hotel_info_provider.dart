import 'package:flutter/material.dart';
import 'package:hotel_app/helpers/services/api_client.dart';
import 'package:hotel_app/models/booking_model.dart';
import 'package:hotel_app/models/hotel_model_response.dart';
import 'package:hotel_app/models/rooms_model.dart';

class HotelInfoProvider extends ChangeNotifier {
  HotelResponse? infoHotel;
  Booking? booking;
  Rooms? listRooms;
  bool _isLoading = true;
  bool get isLoading => _isLoading;

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
}
