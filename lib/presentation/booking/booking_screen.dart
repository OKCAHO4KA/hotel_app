import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hotel_app/config/method_get_price.dart';
import 'package:hotel_app/helpers/providers/hotel_info_provider.dart';
import 'package:hotel_app/presentation/booking/widgets/hotel_name_adress.dart';
import 'package:hotel_app/presentation/booking/widgets/info_client.dart';
import 'package:hotel_app/presentation/booking/widgets/info_turist.dart';
import 'package:hotel_app/presentation/booking/widgets/subtotal.dart';
import 'package:hotel_app/presentation/booking/widgets/table_view.dart';
import 'package:hotel_app/presentation/shared/button_blue.dart';
import 'package:provider/provider.dart';

class BookingScreen extends StatelessWidget {
  BookingScreen({super.key});
  // final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    final infoBooking = Provider.of<HotelInfoProvider>(context);
    final List<String> totalPay = getPrice(infoBooking.getTotalPay());

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
          child: Form(
            key: infoBooking.formKey,
            child: Column(children: [
              HotelNameAdress(
                infoBooking: infoBooking.booking,
              ),
              TableView(
                infoBooking: infoBooking.booking,
              ),
              InfoClient(),
              InfoTourist(
                trailing: const IconExpandedTile(svg: 'assets/vector_55.svg'),
                trailing2: const IconExpandedTile(svg: 'assets/vector_551.svg'),
                text: "Первый турист",
                isExpanded: true,
              ),
              InfoTourist(
                trailing: const IconExpandedTile(svg: 'assets/vector_55.svg'),
                trailing2: const IconExpandedTile(svg: 'assets/vector_551.svg'),
                text: "Второй турист",
                isExpanded: false,
              ),
              InfoTourist(
                trailing: const _IconOpenTourist(),
                trailing2: const _IconCloseTourist(),
                text: "Добавить туриста",
                isExpanded: false,
              ),
              Subtotal(
                infoBooking: infoBooking.booking!,
              ),
              const SizedBox(height: 8),
              ButtonBlue(
                text: "Оплатить ${totalPay[0]} ${totalPay[1]} ₽",
                onPressed: () {
                  if (infoBooking.isValidForm())
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('OK')),
                    );
                  // context.push('/pay');
                  // }
                  // null;
                },

                //   if (_formKey.currentState!.validate()) {
                //     ScaffoldMessenger.of(context).showSnackBar(
                //       const SnackBar(content: Text('Processing Data')),
                //     );
                //     context.push('/pay');
                //   }
                //   null;
                // },
              )
            ]),
          ),
        ));
  }
}

class _IconCloseTourist extends StatelessWidget {
  const _IconCloseTourist();

  @override
  Widget build(BuildContext context) {
    return Container(
        width: 34,
        height: 34,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(6.0),
            color: const Color.fromRGBO(13, 114, 255, 0.1)),
        child: const Icon(Icons.add, color: Color(0xff0D72FF)));
  }
}

class _IconOpenTourist extends StatelessWidget {
  const _IconOpenTourist();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 34,
      height: 34,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(6.0),
          color: const Color.fromRGBO(13, 114, 255, 0.1)),
      child: const Icon(
        Icons.remove,
        color: Color(0xff0D72FF),
      ),
    );
  }
}
