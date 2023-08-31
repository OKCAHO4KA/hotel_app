// ignore_for_file: avoid_print

import 'package:dio/dio.dart';

class ApiClient {
  final _dio = Dio();

  Future aboutHotel() async {
    const String url =
        'https://run.mocky.io/v3/35e0d18e-2521-4f1b-a575-f0fe366f66e3';
    try {
      final response = await _dio.get(url);
      print(response.data);

      return response;
    } catch (e) {
      print(e);
      return;
    }
  }

  Future listHotelRooms() async {
    const String url =
        'https://run.mocky.io/v3/f9a38183-6f95-43aa-853a-9c83cbb05ecd';
    try {
      final response = await _dio.get(url);
      print(response.data);

      return response;
    } catch (e) {
      print(e);
      return;
    }
  }

  Future infoBooking() async {
    const String url =
        'https://run.mocky.io/v3/e8868481-743f-4eb2-a0d7-2bc4012275c8';
    try {
      final response = await _dio.get(url);
      print(response.data);

      return response;
    } catch (e) {
      print(e);
      return;
    }
  }
}
