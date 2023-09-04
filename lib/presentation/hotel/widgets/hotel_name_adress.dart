import 'package:flutter/material.dart';
import 'package:hotel_app/config/method_get_price.dart';
import 'package:hotel_app/config/theme/app_theme.dart';
import 'package:hotel_app/models/hotel_model_response.dart';

class HotelNameAdress extends StatelessWidget {
  final HotelResponse infoHotel;

  const HotelNameAdress({
    super.key,
    required this.infoHotel,
  });

  @override
  Widget build(BuildContext context) {
    final List<String> price = getPrice(infoHotel.minimalPrice!);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(infoHotel.name, style: AppTheme().textStyleBigLetters),
        const SizedBox(
          height: 5,
        ),
        Text(infoHotel.adress,
            style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w500,
                fontFamily: 'SF',
                color: Color(0xff0D72FF))),
        const SizedBox(
          height: 5,
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text('от ${price[0]} ${price[1]} ₽', style: AppTheme().nameOfHotel),
            const SizedBox(width: 10),
            Padding(
              padding: const EdgeInsets.only(top: 13.0),
              child: Text(infoHotel.priceForIt!,
                  style: AppTheme().textStyleGreyLetters),
            ),
          ],
        ),
        const SizedBox(height: 15),
      ],
    );
  }
}
