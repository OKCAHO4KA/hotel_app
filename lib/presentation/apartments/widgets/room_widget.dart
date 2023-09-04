import 'package:flutter/material.dart';
import 'package:hotel_app/config/method_get_price.dart';
import 'package:hotel_app/config/theme/app_theme.dart';
import 'package:hotel_app/helpers/providers/hotel_info_provider.dart';
import 'package:hotel_app/presentation/shared/widgets.dart';

class Room extends StatelessWidget {
  const Room({
    super.key,
    required this.size,
    required this.infoHotelProvider,
    required this.index,
  });
  final int index;
  final Size size;
  final HotelInfoProvider infoHotelProvider;

  @override
  Widget build(BuildContext context) {
    final List<String> price =
        getPrice(infoHotelProvider.listRooms!.rooms[index].price);
    return Container(
      padding: const EdgeInsets.only(left: 16, right: 16, top: 16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12.0),
        color: Colors.white,
      ),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        FotoContainer(
            size: size,
            listImagesUrl:
                infoHotelProvider.listRooms!.rooms[index].imageUrls!),
        Text(infoHotelProvider.listRooms!.rooms[index].name,
            style: AppTheme().textStyleBigLetters),
        Peculiarities(
            peculiarities:
                infoHotelProvider.listRooms!.rooms[index].peculiarities!),
        Container(
            margin: const EdgeInsets.symmetric(vertical: 10),
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            decoration: BoxDecoration(
              color: const Color.fromRGBO(13, 114, 255, 0.1),
              borderRadius: BorderRadius.circular(5.0),
            ),
            child: const Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text('Подробнее о номере ',
                    style: TextStyle(
                        fontSize: 16,
                        color: Color(0xff0D72FF),
                        fontWeight: FontWeight.w500)),
                Icon(Icons.arrow_forward_ios,
                    size: 12, color: Color(0xff0D72FF)),
              ],
            )),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 6),
          child: Row(
            children: [
              Text('${price[0]} ${price[1]} ₽',
                  style: const TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.w600,
                  )),
              const SizedBox(
                width: 10,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 13),
                child: Text(
                  infoHotelProvider.listRooms!.rooms[0].pricePer!,
                  style: AppTheme().textStyleGreyLetters,
                ),
              )
            ],
          ),
        ),
      ]),
    );
  }
}
