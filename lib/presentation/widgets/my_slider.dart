import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MySlider extends StatelessWidget {
  final List<String> imagesUrl;
  final Color? colorActivo;
  final Color? colorDesactivo;
  final double? bulletActivo;
  final double? bulletDesactivo;

  const MySlider(
      {super.key,
      required this.imagesUrl,
      this.colorActivo = Colors.blue,
      this.colorDesactivo = Colors.grey,
      this.bulletActivo = 12,
      this.bulletDesactivo = 12});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => _SliderModel(),
      child: Center(child: Builder(builder: (context) {
        Provider.of<_SliderModel>(context).colorActivo = colorActivo!;

        Provider.of<_SliderModel>(context).colorDesactivo = colorDesactivo!;
        Provider.of<_SliderModel>(context).bulletActivo = bulletActivo!;
        Provider.of<_SliderModel>(context).bulletDesactivo = bulletDesactivo!;

        return _CrearEscructuraSlideshow(imagesUrl: imagesUrl);
      })),
    );
  }
}

class _CrearEscructuraSlideshow extends StatelessWidget {
  const _CrearEscructuraSlideshow({
    required this.imagesUrl,
  });

  final List<String> imagesUrl;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        _Slides(imagesUrl),
        Positioned(
          bottom: 10,
          child: _Dots(
            length: imagesUrl.length,
            colorActivo: Colors.black,
            colorDesactivo: Colors.black12,
          ),
        ),
      ],
    );
  }
}

class _Dots extends StatelessWidget {
  final int length;
  final Color? colorActivo;
  final Color? colorDesactivo;
  const _Dots({required this.length, this.colorActivo, this.colorDesactivo});
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 5),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5.0),
          color: const Color(0xffFFFFFF)),
      height: 17,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: List.generate(
            length, (index) => _Dot(colorActivo, colorDesactivo, index, 7, 7)),
      ),
    );
  }
}

class _Dot extends StatelessWidget {
  final int index;
  final Color? colorActivo;
  final Color? colorDesactivo;
  final double? bulletActivo;
  final double? bulletDesactivo;

  const _Dot(
    this.colorActivo,
    this.colorDesactivo,
    this.index,
    this.bulletActivo,
    this.bulletDesactivo,
  );

  @override
  Widget build(BuildContext context) {
    final provideSliderModel = Provider.of<_SliderModel>(context);
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 5),
      width: (provideSliderModel.currentImage.round() == index)
          ? bulletActivo
          : bulletDesactivo,
      height: (provideSliderModel.currentImage.round() == index)
          ? bulletActivo
          : bulletDesactivo,
      decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: (provideSliderModel.currentImage.round() == index)
              ? colorActivo
              : colorDesactivo),
    );
  }
}

class _Slides extends StatefulWidget {
  final List<String> imagesUrl;
  const _Slides(this.imagesUrl);

  @override
  State<_Slides> createState() => _SlidesState();
}

class _SlidesState extends State<_Slides> {
  final pageViewController = PageController();

  @override
  void initState() {
    super.initState();
    pageViewController.addListener(() {
      Provider.of<_SliderModel>(context, listen: false).currentImage =
          pageViewController.page!;
    });
  }

  @override
  void dispose() {
    pageViewController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return PageView(
        controller: pageViewController,
        children: widget.imagesUrl.map((imgUrl) => _Slide(imgUrl)).toList());
  }
}

class _Slide extends StatelessWidget {
  const _Slide(this.imageUrl);
  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(15.0),
      child: SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: FadeInImage.assetNetwork(
          placeholder: 'assets/gif2.gif',
          image: imageUrl,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}

class _SliderModel with ChangeNotifier {
  double _currentImage = 0;
  Color colorActivo = Colors.blue;
  Color colorDesactivo = Colors.grey;
  double bulletActivo = 7;
  double bulletDesactivo = 7;

  double get currentImage => _currentImage;

  set currentImage(double value) {
    _currentImage = value;

    notifyListeners();
  }
}
