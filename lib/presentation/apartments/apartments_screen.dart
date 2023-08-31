import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hotel_app/helpers/providers/hotel_info_provider.dart';
import 'package:provider/provider.dart';

import 'widgets/list_room_widget.dart';

class ApartmentsScreen extends StatelessWidget {
  const ApartmentsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final infoHotelProvider = Provider.of<HotelInfoProvider>(context);
    final size = MediaQuery.sizeOf(context);
    return Scaffold(
        appBar: AppBar(
            leading: IconButton(
              onPressed: () => context.pop(),
              icon: const Icon(
                Icons.arrow_back_ios,
                size: 18,
              ),
            ),
            title: Text(
              infoHotelProvider.infoHotel!.name,
            )),
        body: ListRooms(size: size, infoHotelProvider: infoHotelProvider));
  }
}
