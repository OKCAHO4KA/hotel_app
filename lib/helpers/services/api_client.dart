import 'package:dio/dio.dart';
import 'package:hotel_app/models/hotel_model_response.dart';

class ApiClient {
  final _dio = Dio();
  HotelResponse? infoHotel;

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
}
