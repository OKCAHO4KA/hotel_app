import 'package:flutter/material.dart';
import 'package:hotel_app/config/theme/app_theme.dart';
import 'package:hotel_app/helpers/providers/hotel_info_provider.dart';
import 'package:hotel_app/models/hotel_model_response.dart';
import 'package:hotel_app/presentation/widgets/widgets.dart';
import 'package:iconsax/iconsax.dart';
import 'package:provider/provider.dart';

class HotelScreen extends StatelessWidget {
  const HotelScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final infoHotelProvider = Provider.of<HotelInfoProvider>(context);
    return Scaffold(
      appBar: AppBar(title: Text('Отель', style: AppTheme().textStyleAppBar)),
      body: (!infoHotelProvider.isLoading)
          ? FotoHotelContainer(
              infoHotel: infoHotelProvider.infoHotel!,
            )
          : const Center(
              child: CircularProgressIndicator(
              strokeWidth: 4,
              color: Colors.grey,
            )),
      floatingActionButtonLocation: FloatingActionButtonLocation
          .centerDocked, // floatingActionButton: Stack(
      floatingActionButton: const ButtonBlue(),
    );
  }
}

class FotoHotelContainer extends StatelessWidget {
  final HotelResponse infoHotel;
  const FotoHotelContainer({super.key, required this.infoHotel});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: SizedBox(
          width: size.width,
          child: Column(children: [
            PartUp(size: size, infoHotel: infoHotel),
            const SizedBox(
              height: 5,
            ),
            PartDown(infoHotel: infoHotel),
            const SizedBox(
              height: 90,
            ),
          ]),
        ));
  }
}

class PartUp extends StatelessWidget {
  const PartUp({
    super.key,
    required this.size,
    required this.infoHotel,
  });

  final Size size;
  final HotelResponse infoHotel;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(12), bottomRight: Radius.circular(12)),
        color: Colors.white,
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 15,
            ),
            FotoContainer(
              size: size,
              infoHotel: infoHotel,
            ),
            Raiting(infoHotel: infoHotel),
            HotelNameAdress(
              infoHotel: infoHotel,
            ),
          ],
        ),
      ),
    );
  }
}

class PartDown extends StatelessWidget {
  const PartDown({
    super.key,
    required this.infoHotel,
  });

  final HotelResponse infoHotel;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 15),
            child: Text('Об отеле', style: AppTheme().textStyleBigLetters),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 15),
            child: Peculiarities(
              infoHotel: infoHotel,
            ),
          ),
          Text(infoHotel.aboutTheHotel!.description!,
              style:
                  const TextStyle(fontSize: 16, fontWeight: FontWeight.w400)),
          const ListTiles(),
          const SizedBox(
            height: 15,
          ),
        ],
      ),
    );
  }
}

class ListTiles extends StatelessWidget {
  const ListTiles({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: const Color(0xffFBFBFC),
          borderRadius: BorderRadius.circular(15.0),
        ),
        child: const Column(
          children: [
            _ItemListTile(Iconsax.emoji_happy, 'Удобства', 'Самое необходимое'),
            Divider(
              height: 0,
              indent: 55,
              endIndent: 20,
            ),
            _ItemListTile(
                Iconsax.tick_square, 'Что включено', 'Самое необходимое'),
            Divider(
              height: 0,
              indent: 55,
              endIndent: 20,
            ),
            _ItemListTile(
                Iconsax.close_square, 'Что нк включено', 'Самое необходимое'),
          ],
        ));
  }
}

class _ItemListTile extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;
  const _ItemListTile(this.icon, this.title, this.subtitle);

  @override
  Widget build(BuildContext context) {
    return ListTile(
        title: Text(title),
        subtitle: Text(subtitle),
        leading: Icon(
          icon,
          size: 24,
        ),
        trailing: const Icon(Icons.arrow_forward_ios));
  }
}

class Peculiarities extends StatelessWidget {
  final HotelResponse infoHotel;

  const Peculiarities({
    super.key,
    required this.infoHotel,
  });

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 10,
      runSpacing: 5,
      alignment: WrapAlignment.start,
      direction: Axis.horizontal,
      children: infoHotel.aboutTheHotel!.peculiarities!
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

class HotelNameAdress extends StatelessWidget {
  final HotelResponse infoHotel;

  const HotelNameAdress({
    super.key,
    required this.infoHotel,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(infoHotel.name, style: AppTheme().textStyleBigLetters),
        const SizedBox(
          height: 5,
        ),
        Text(infoHotel.adress,
            style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w500,
                fontFamily: 'SF',
                color: Color(0xff0D72FF))),
        const SizedBox(
          height: 5,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text('от ${infoHotel.minimalPrice} ₽',
                style: const TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.w600,
                    fontFamily: 'SF')),
            const SizedBox(width: 10),
            Text(infoHotel.priceForIt!, style: AppTheme().textStyleGreyLetters),
          ],
        ),
        const SizedBox(height: 15),
      ],
    );
  }
}
