import 'package:flutter/material.dart';
import 'package:hotel_app/config/method_get_price.dart';
import 'package:hotel_app/config/theme/app_theme.dart';
import 'package:hotel_app/models/booking_model.dart';
import 'package:hotel_app/presentation/booking/widgets/table_cell.dart';

class Subtotal extends StatelessWidget {
  final Booking infoBooking;
  const Subtotal({
    super.key,
    required this.infoBooking,
  });

  @override
  Widget build(BuildContext context) {
    final int totalPrice = infoBooking.tourPrice! +
        infoBooking.fuelCharge! +
        infoBooking.serviceCharge!;

    final List<String> priceTour = getPrice(infoBooking.tourPrice!);

    final List<String> fuelCharge = getPrice(infoBooking.fuelCharge!);
    final List<String> serviceChrge = getPrice(infoBooking.serviceCharge!);
    final List<String> totalPay = getPrice(totalPrice);

    return Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15.0),
          color: Colors.white,
        ),
        margin: const EdgeInsets.only(top: 8),
        child: Table(columnWidths: const {
          0: FlexColumnWidth(.6),
          1: FlexColumnWidth(.4),
        }, children: [
          TableRow(children: [
            CustomTableCell(
              text: 'Тур',
              textStyle: AppTheme().textStyleGreyLetters,
            ),
            CustomTableCell(
              alignment: Alignment.centerRight,
              text: '${priceTour[0]} ${priceTour[1]} ₽',
              textStyle: AppTheme().textStyleBlackLetters,
            )
          ]),
          TableRow(children: [
            CustomTableCell(
              text: 'Топливный сбор',
              textStyle: AppTheme().textStyleGreyLetters,
            ),
            CustomTableCell(
              alignment: Alignment.centerRight,
              text: ('${fuelCharge[0]} ${fuelCharge[1]} ₽'),
              textStyle: AppTheme().textStyleBlackLetters,
            )
          ]),
          TableRow(children: [
            CustomTableCell(
              text: 'Сервисный сбор',
              textStyle: AppTheme().textStyleGreyLetters,
            ),
            CustomTableCell(
              alignment: Alignment.centerRight,
              text: ('${serviceChrge[0]} ${fuelCharge[1]} ₽'),
              textStyle: AppTheme().textStyleBlackLetters,
            )
          ]),
          TableRow(children: [
            CustomTableCell(
              text: 'К оплате',
              textStyle: AppTheme().textStyleGreyLetters,
            ),
            CustomTableCell(
              alignment: Alignment.centerRight,
              text: ('${totalPay[0]} ${totalPay[1]} ₽'),
              textStyle: AppTheme().textStyleBlackLetters.copyWith(
                  color: const Color(0xff0D72FF), fontWeight: FontWeight.w600),
            )
          ]),
        ]));
  }
}
