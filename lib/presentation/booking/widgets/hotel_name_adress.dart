import 'package:flutter/material.dart';
import 'package:hotel_app/config/theme/app_theme.dart';
import 'package:hotel_app/models/booking_model.dart';
import 'package:hotel_app/presentation/shared/ratings.dart';

class HotelNameAdress extends StatelessWidget {
  const HotelNameAdress({
    super.key,
    required this.infoBooking,
  });

  final Booking? infoBooking;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      margin: const EdgeInsets.only(top: 8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(
          15.0,
        ),
      ),
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Raiting(
            ratingName: infoBooking!.ratingName!,
            ratingInt: infoBooking!.horating,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8),
            child: Text(infoBooking!.hotelName,
                style: AppTheme().textStyleBigLetters),
          ),
          Text(infoBooking!.hotelAdress,
              style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: Color(0xff0D72FF)))
        ],
      ),
    );
  }
}
