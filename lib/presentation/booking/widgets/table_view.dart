import 'package:flutter/material.dart';
import 'package:hotel_app/config/theme/app_theme.dart';
import 'package:hotel_app/models/booking_model.dart';

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
          _TableCell(
            text: 'Вылет из',
            textStyle: AppTheme().textStyleGreyLetters,
          ),
          _TableCell(
              text: infoBooking!.departure!,
              textStyle: AppTheme().textStyleBlackLetters),
        ]),
        TableRow(children: [
          _TableCell(
              text: 'Страна, город',
              textStyle: AppTheme().textStyleGreyLetters),
          _TableCell(
              text: infoBooking!.arrivalCountry!,
              textStyle: AppTheme().textStyleBlackLetters),
        ]),
        TableRow(children: [
          _TableCell(text: 'Даты', textStyle: AppTheme().textStyleGreyLetters),
          _TableCell(
              text:
                  '${infoBooking!.tourDateStart} - ${infoBooking!.tourDateStop}',
              textStyle: AppTheme().textStyleBlackLetters),
        ]),
        TableRow(children: [
          _TableCell(
              text: 'Кол-во ночей', textStyle: AppTheme().textStyleGreyLetters),
          _TableCell(
              text: '${infoBooking!.numberOfNights} ночей',
              textStyle: AppTheme().textStyleBlackLetters)
        ]),
        TableRow(children: [
          _TableCell(text: 'Отель', textStyle: AppTheme().textStyleGreyLetters),
          _TableCell(
              text: infoBooking!.hotelName,
              textStyle: AppTheme().textStyleBlackLetters)
        ]),
        TableRow(children: [
          _TableCell(text: 'Номер', textStyle: AppTheme().textStyleGreyLetters),
          _TableCell(
              text: infoBooking!.room!,
              textStyle: AppTheme().textStyleBlackLetters)
        ]),
        TableRow(children: [
          _TableCell(
              text: 'Питание', textStyle: AppTheme().textStyleGreyLetters),
          _TableCell(
              text: infoBooking!.nutrition!,
              textStyle: AppTheme().textStyleBlackLetters)
        ]),
      ]),
    );
  }
}

class _TableCell extends StatelessWidget {
  final String text;
  final TextStyle? textStyle;
  const _TableCell({
    required this.text,
    this.textStyle,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: Text(text, style: textStyle),
    );
  }
}
