import 'package:flutter/material.dart';
import 'package:hotel_app/models/hotel_model_response.dart';
import 'package:hotel_app/presentation/widgets/my_slider.dart';

class FotoContainer extends StatelessWidget {
  final HotelResponse infoHotel;

  const FotoContainer({
    super.key,
    required this.size,
    required this.infoHotel,
  });

  final Size size;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(15),
      child: Container(
          height: size.height * 0.35,
          margin: const EdgeInsets.only(bottom: 16),
          child: MySlider(
            imagesUrl: infoHotel.imageUrls!,
          )),
    );
  }
}
