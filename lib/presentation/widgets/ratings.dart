import 'package:flutter/material.dart';
import 'package:hotel_app/models/hotel_model_response.dart';

class Raiting extends StatelessWidget {
  const Raiting({
    super.key,
    required this.infoHotel,
  });

  final HotelResponse infoHotel;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 150,
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      decoration: BoxDecoration(
        color: const Color.fromRGBO(255, 199, 0, 0.2),
        borderRadius: BorderRadius.circular(5.0),
      ),
      child: Row(
        children: [
          const Icon(
            Icons.star,
            color: Color(0xffFFA800),
            size: 16,
          ),
          Text(
            ' ${infoHotel.rating}',
            style: const TextStyle(fontSize: 14, color: Color(0xffFFA800)),
          ),
          Text(' ${infoHotel.ratingName}',
              style: const TextStyle(
                fontSize: 14,
                color: Color(0xffFFA800),
              )),
        ],
      ),
    );
  }
}
