import 'package:flutter/material.dart';
import 'package:hotel_app/config/theme/app_theme.dart';

class Peculiarities extends StatelessWidget {
  final List<String> peculiarities;

  const Peculiarities({
    super.key,
    required this.peculiarities,
  });

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 10,
      runSpacing: 5,
      alignment: WrapAlignment.start,
      direction: Axis.horizontal,
      children: peculiarities
          .map((i) => Container(
              padding: const EdgeInsets.all(3),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5.0),
                  color: const Color(0xffFBFBFC)),
              child: Text(i, style: AppTheme().textStyleGreyLetters)))
          .toList(),
    );
  }
}
