import 'package:flutter/material.dart';

class Raiting extends StatelessWidget {
  final Color? color;
  final Color? colorText;
  final Widget? widget;

  final int? ratingInt;
  final String ratingName;

  const Raiting(
      {super.key,
      this.color = const Color.fromRGBO(255, 199, 0, 0.2),
      this.ratingInt,
      required this.ratingName,
      this.colorText = const Color(0xffFFA800),
      this.widget});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(5.0),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            Icons.star,
            color: colorText,
            size: 16,
          ),
          if (ratingInt != null)
            Text(
              ' $ratingInt',
              style: TextStyle(
                  fontSize: 16, fontWeight: FontWeight.w500, color: colorText),
            ),
          Text(' $ratingName',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color: colorText,
              )),
        ],
      ),
    );
  }
}
