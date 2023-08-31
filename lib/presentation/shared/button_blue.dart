import 'package:flutter/material.dart';

class ButtonBlue extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;

  const ButtonBlue({
    super.key,
    required this.text,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 76,
      child: Stack(
        children: [
          Container(
            color: Colors.white,
          ),
          Container(
            margin: const EdgeInsets.only(top: 10, left: 16, right: 16),
            child: MaterialButton(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15)),
                color: const Color(0xff0D72FF),
                minWidth: double.infinity,
                height: 50,
                onPressed: () => onPressed(),
                child: Text(text,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: Colors.white,
                    ))),
          ),
        ],
      ),
    );
  }
}
