import 'package:flutter/material.dart';
import 'package:hotel_app/presentation/shared/my_slider.dart';

class FotoContainer extends StatelessWidget {
  final List<String> listImagesUrl;

  const FotoContainer({
    super.key,
    required this.size,
    required this.listImagesUrl,
  });

  final Size size;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(15),
      child: Container(
          height: size.height * 0.35,
          margin: const EdgeInsets.only(bottom: 10),
          child: MySlider(
            imagesUrl: listImagesUrl,
          )),
    );
  }
}
