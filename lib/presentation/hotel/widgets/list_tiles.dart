import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

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
                Iconsax.close_square, 'Что не включено', 'Самое необходимое'),
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
        title: Text(title,
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500)),
        subtitle: Text(subtitle,
            style: const TextStyle(
                color: Color(0xff828796),
                fontSize: 14,
                fontWeight: FontWeight.w500)),
        leading: Icon(
          icon,
          size: 24,
        ),
        trailing: const Icon(Icons.arrow_forward_ios));
  }
}
