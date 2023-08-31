import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hotel_app/config/theme/app_theme.dart';
import 'package:hotel_app/helpers/providers/hotel_info_provider.dart';
import 'package:hotel_app/presentation/booking/widgets/custom_text_field.dart';
import 'package:hotel_app/presentation/booking/widgets/hotel_name_adress.dart';
import 'package:hotel_app/presentation/booking/widgets/info_cclient.dart';
import 'package:hotel_app/presentation/booking/widgets/table_view.dart';
import 'package:provider/provider.dart';

class BookingScreen extends StatelessWidget {
  const BookingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final infoBooking = Provider.of<HotelInfoProvider>(context).booking;
    return Scaffold(
        appBar: AppBar(
            leading: IconButton(
              onPressed: () => context.pop(),
              icon: const Icon(
                Icons.arrow_back_ios,
                size: 18,
              ),
            ),
            title: const Text('Бронирование')),
        body: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(children: [
            HotelNameAdress(
              infoBooking: infoBooking,
            ),
            TableView(infoBooking: infoBooking),
            const InfoClient(),
            const InfoTourist()
          ]),
        ));
  }
}

class InfoTourist extends StatelessWidget {
  const InfoTourist({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15.0),
          color: Colors.white,
        ),
        margin: const EdgeInsets.only(top: 8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 16),
              child:
                  Text("Первый турист", style: AppTheme().textStyleBigLetters),
            ),
            const CustomTextField(labelText: "Имя", hintText: "Иван"),
            const SizedBox(height: 8),
            const CustomTextField(labelText: "Фамилия", hintText: "Иванов"),
            const SizedBox(height: 8),
            const CustomTextField(labelText: "Дата рождения"),
            const SizedBox(height: 8),
            const CustomTextField(labelText: "Гражданство"),
            const SizedBox(height: 8),
            const CustomTextField(labelText: "Номер загранпаспорта"),
            const SizedBox(height: 8),
            const CustomTextField(labelText: "Срок действия загранпаспорта"),
            const SizedBox(height: 8),
          ],
        ));
  }
}
