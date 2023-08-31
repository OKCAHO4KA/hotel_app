import 'package:flutter/material.dart';
import 'package:hotel_app/helpers/services/api_client.dart';
import 'package:hotel_app/models/hotel_model_response.dart';

class HotelInfoProvider extends ChangeNotifier {
  HotelResponse? infoHotel;
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
}
