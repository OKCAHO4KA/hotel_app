import 'package:flutter/material.dart';

class ButtonBlue extends StatelessWidget {
  const ButtonBlue({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 80,
      child: Stack(
        children: [
          Container(
            color: Colors.white,
          ),
          Container(
            margin: const EdgeInsets.only(left: 16, right: 16, top: 10),
            child: MaterialButton(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15)),
                color: const Color(0xff0D72FF),
                minWidth: double.infinity,
                height: 48,
                onPressed: () async {},
                child: const Text('К выбору номера',
                    style: TextStyle(
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
