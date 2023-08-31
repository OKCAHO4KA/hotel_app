import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hotel_app/helpers/providers/hotel_info_provider.dart';
import 'package:hotel_app/presentation/apartments/widgets/room_widget.dart';
import 'package:hotel_app/presentation/shared/widgets.dart';
import 'package:provider/provider.dart';

class ListRooms extends StatelessWidget {
  const ListRooms({
    super.key,
    required this.size,
    required this.infoHotelProvider,
  });

  final Size size;
  final HotelInfoProvider infoHotelProvider;

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.only(top: 8),
        width: size.width,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12.0),
        ),
        child: SizedBox(
          child: ListView.separated(
            physics: const BouncingScrollPhysics(),
            itemBuilder: (BuildContext context, int index) {
              return Column(
                children: [
                  Room(
                      size: size,
                      infoHotelProvider: infoHotelProvider,
                      index: index),
                  ButtonBlue(
                      text: 'Выбрать номер',
                      onPressed: () async {
                        final hotelInfoProvider =
                            Provider.of<HotelInfoProvider>(context,
                                listen: false);
                        await hotelInfoProvider.infoBooking();

                        Future.microtask(() => context.push('/booking'));
                      }),
                ],
              );
            },
            separatorBuilder: (BuildContext context, int index) {
              return const SizedBox(
                height: 8,
              );
            },
            itemCount: infoHotelProvider.listRooms!.rooms.length,
          ),
        ));
  }
}
