import 'package:flutter/material.dart';
import 'package:hotel_app/config/theme/app_theme.dart';
import 'package:hotel_app/models/hotel_model_response.dart';
import 'package:hotel_app/presentation/hotel/widgets/list_tiles.dart';
import 'package:hotel_app/presentation/shared/widgets.dart';

class PartDown extends StatelessWidget {
  const PartDown({
    super.key,
    required this.infoHotel,
  });

  final HotelResponse infoHotel;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 15),
            child: Text('Об отеле', style: AppTheme().textStyleBigLetters),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 15),
            child: Peculiarities(
              peculiarities: infoHotel.aboutTheHotel!.peculiarities!,
            ),
          ),
          Text(infoHotel.aboutTheHotel!.description!,
              style:
                  const TextStyle(fontSize: 16, fontWeight: FontWeight.w400)),
          const SizedBox(
            height: 15,
          ),
          const ListTiles(),
          const SizedBox(
            height: 15,
          ),
        ],
      ),
    );
  }
}
