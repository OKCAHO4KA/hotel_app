import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:go_router/go_router.dart';
import 'package:hotel_app/config/theme/app_theme.dart';
import 'package:hotel_app/helpers/providers/hotel_info_provider.dart';
import 'package:hotel_app/models/hotel_model_response.dart';
import 'package:hotel_app/presentation/hotel/widgets/part_down.dart';
import 'package:hotel_app/presentation/hotel/widgets/part_up.dart';
import 'package:hotel_app/presentation/shared/widgets.dart';

class HotelScreen extends StatelessWidget {
  const HotelScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final infoHotelProvider = Provider.of<HotelInfoProvider>(context);
    return Scaffold(
      appBar: AppBar(title: Text('Отель', style: AppTheme().textStyleAppBar)),
      body: (!infoHotelProvider.isLoading)
          ? FotoHotelContainer(
              infoHotel: infoHotelProvider.infoHotel!,
            )
          : const Center(
              child: CircularProgressIndicator(
              strokeWidth: 4,
              color: Colors.grey,
            )),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: ButtonBlue(
        text: "К выбору номера",
        onPressed: () async {
          await infoHotelProvider.listHotelRooms();
          Future.microtask(() => context.push('/apartment'));
        },
      ),
    );
  }
}

class FotoHotelContainer extends StatelessWidget {
  final HotelResponse infoHotel;
  const FotoHotelContainer({super.key, required this.infoHotel});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: SizedBox(
          width: size.width,
          child: Column(children: [
            PartUp(size: size, infoHotel: infoHotel),
            const SizedBox(
              height: 8,
            ),
            PartDown(infoHotel: infoHotel),
            const SizedBox(
              height: 85,
            ),
          ]),
        ));
  }
}
