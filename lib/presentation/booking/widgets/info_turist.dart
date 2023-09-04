import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hotel_app/config/theme/app_theme.dart';
import 'package:hotel_app/presentation/booking/widgets/custom_text_field.dart';

// ignore: must_be_immutable
class InfoTourist extends StatelessWidget {
  final String text;
  bool isExpanded;
  final Widget trailing;
  final Widget trailing2;

  InfoTourist(
      {super.key,
      required this.text,
      required this.isExpanded,
      required this.trailing,
      required this.trailing2});

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15.0),
          color: Colors.white,
        ),
        margin: const EdgeInsets.only(top: 8),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Padding(
              padding: const EdgeInsets.all(12),
              child: _ItemExpandedTile(
                  isExpanded: isExpanded,
                  text: text,
                  trailing: trailing,
                  trailing2: trailing2)),
        ]));
  }
}

// ignore: must_be_immutable
class _ItemExpandedTile extends StatefulWidget {
  bool isExpanded;
  final String text;
  final Widget? trailing;
  final Widget? trailing2;
  _ItemExpandedTile(
      {required this.isExpanded,
      required this.text,
      this.trailing,
      this.trailing2});

  @override
  State<_ItemExpandedTile> createState() => _ItemExpandedTileState();
}

class _ItemExpandedTileState extends State<_ItemExpandedTile> {
  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
        shape: const Border(),
        tilePadding: const EdgeInsets.all(0),
        maintainState: true,
        onExpansionChanged: (value) {
          widget.isExpanded = !widget.isExpanded;
          setState(() {});
        },
        trailing: widget.isExpanded ? widget.trailing : widget.trailing2,
        initiallyExpanded: widget.isExpanded,
        title: Text(widget.text, style: AppTheme().textStyleBigLetters),
        children: [
          CustomTextField(
              typeInput: TextInputType.name,
              validator: (value) {
                if (value!.isEmpty) {
                  return '*Поле "Имя" обязательно для заполнения';
                }
                return null;
              },
              labelText: "Имя",
              hintText: "Иван"),
          const SizedBox(height: 8),
          CustomTextField(
              typeInput: TextInputType.name,
              labelText: "Фамилия",
              hintText: "Иванов",
              validator: (value) {
                if (value!.isEmpty) {
                  return '*Поле "Фамилия" обязательно для заполнения';
                }
                return null;
              }),
          const SizedBox(height: 8),
          CustomTextField(
              typeInput: TextInputType.datetime,
              labelText: "Дата рождения",
              validator: (value) {
                if (value!.isEmpty) {
                  return '*Поле "Дата рождения" обязательно для заполнения';
                }
                return null;
              }),
          const SizedBox(height: 8),
          CustomTextField(
              labelText: "Гражданство",
              validator: (value) {
                if (value!.isEmpty) {
                  return '*Поле "Гражданство" обязательно для заполнения';
                }
                return null;
              }),
          const SizedBox(height: 8),
          CustomTextField(
              labelText: "Номер загранпаспорта",
              validator: (value) {
                if (value!.isEmpty) {
                  return '*Поле "Номер загранпаспорта" обязательно для заполнения';
                }
                return null;
              }),
          const SizedBox(height: 8),
          CustomTextField(
              typeInput: TextInputType.datetime,
              labelText: "Срок действия загранпаспорта",
              validator: (value) {
                if (value!.isEmpty) {
                  return '*Поле "Срок действия загранпаспорта" обязательно для заполнения';
                }
                return null;
              }),
          const SizedBox(height: 8),
        ]);
  }
}

class IconExpandedTile extends StatelessWidget {
  const IconExpandedTile({super.key, required this.svg});
  final String svg;

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.fromLTRB(10, 12, 10, 12),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(6.0),
            color: const Color.fromRGBO(13, 114, 255, 0.1)),
        child: SvgPicture.asset(
          svg,
        ));
  }
}
