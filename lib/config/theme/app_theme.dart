import 'package:flutter/material.dart';

class AppTheme {
  ThemeData getTheme() => ThemeData(
      scaffoldBackgroundColor: const Color(0xffE8E9EC),
      useMaterial3: true,
      colorSchemeSeed: const Color(0xff0D72FF),
      appBarTheme: const AppBarTheme(centerTitle: true, elevation: 0),
      fontFamily: 'SF');

  final textStyleAppBar = const TextStyle(
      fontSize: 18, fontWeight: FontWeight.w500, fontFamily: 'SF');

  final textStyleBigLetters = const TextStyle(
      fontSize: 22, fontWeight: FontWeight.w500, fontFamily: 'SF');
  final textStyleGreyLetters = const TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.w400,
      fontFamily: 'SF',
      color: Color(0xff828796));
}
