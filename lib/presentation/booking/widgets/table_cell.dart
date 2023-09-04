import 'package:flutter/material.dart';

class CustomTableCell extends StatelessWidget {
  final String text;
  final TextStyle? textStyle;
  final AlignmentGeometry? alignment;
  const CustomTableCell({
    super.key,
    required this.text,
    this.textStyle,
    this.alignment = Alignment.centerLeft,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: Align(alignment: alignment!, child: Text(text, style: textStyle)),
    );
  }
}
