import 'package:flutter/material.dart';
import 'package:hotel_app/models/hotel_model_response.dart';
import 'package:hotel_app/presentation/hotel/widgets/hotel_name_adress.dart';
import 'package:hotel_app/presentation/shared/widgets.dart';

class PartUp extends StatelessWidget {
  const PartUp({
    super.key,
    required this.size,
    required this.infoHotel,
  });

  final Size size;
  final HotelResponse infoHotel;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(12), bottomRight: Radius.circular(12)),
        color: Colors.white,
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 15,
            ),
            FotoContainer(
              size: size,
              listImagesUrl: infoHotel.imageUrls!,
            ),
            Raiting(
              colorText: const Color(0xffFFA800),
              color: const Color.fromRGBO(255, 199, 0, 0.2),
              ratingInt: infoHotel.rating!,
              ratingName: infoHotel.ratingName!,
            ),
            HotelNameAdress(
              infoHotel: infoHotel,
            ),
          ],
        ),
      ),
    );
  }
}
