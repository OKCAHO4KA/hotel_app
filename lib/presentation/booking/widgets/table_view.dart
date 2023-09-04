import 'package:flutter/material.dart';
import 'package:hotel_app/config/theme/app_theme.dart';
import 'package:hotel_app/models/booking_model.dart';
import 'package:hotel_app/presentation/booking/widgets/table_cell.dart';

class TableView extends StatelessWidget {
  const TableView({
    super.key,
    required this.infoBooking,
  });

  final Booking? infoBooking;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15.0),
        color: Colors.white,
      ),
      margin: const EdgeInsets.only(top: 8),
      child: Table(columnWidths: const {
        0: FlexColumnWidth(.4),
        1: FlexColumnWidth(.6),
      }, children: [
        TableRow(children: [
          Align(
            child: CustomTableCell(
              text: 'Вылет из',
              textStyle: AppTheme().textStyleGreyLetters,
            ),
          ),
          CustomTableCell(
              text: infoBooking!.departure!,
              textStyle: AppTheme().textStyleBlackLetters),
        ]),
        TableRow(children: [
          CustomTableCell(
              text: 'Страна, город',
              textStyle: AppTheme().textStyleGreyLetters),
          CustomTableCell(
              text: infoBooking!.arrivalCountry!,
              textStyle: AppTheme().textStyleBlackLetters),
        ]),
        TableRow(children: [
          CustomTableCell(
              text: 'Даты', textStyle: AppTheme().textStyleGreyLetters),
          CustomTableCell(
              text:
                  '${infoBooking!.tourDateStart} - ${infoBooking!.tourDateStop}',
              textStyle: AppTheme().textStyleBlackLetters),
        ]),
        TableRow(children: [
          CustomTableCell(
              text: 'Кол-во ночей', textStyle: AppTheme().textStyleGreyLetters),
          CustomTableCell(
              text: '${infoBooking!.numberOfNights} ночей',
              textStyle: AppTheme().textStyleBlackLetters)
        ]),
        TableRow(children: [
          CustomTableCell(
              text: 'Отель', textStyle: AppTheme().textStyleGreyLetters),
          CustomTableCell(
              text: infoBooking!.hotelName,
              textStyle: AppTheme().textStyleBlackLetters)
        ]),
        TableRow(children: [
          CustomTableCell(
              text: 'Номер', textStyle: AppTheme().textStyleGreyLetters),
          CustomTableCell(
              text: infoBooking!.room!,
              textStyle: AppTheme().textStyleBlackLetters)
        ]),
        TableRow(children: [
          CustomTableCell(
              text: 'Питание', textStyle: AppTheme().textStyleGreyLetters),
          CustomTableCell(
              text: infoBooking!.nutrition!,
              textStyle: AppTheme().textStyleBlackLetters)
        ]),
      ]),
    );
  }
}
