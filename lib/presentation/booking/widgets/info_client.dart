import 'package:flutter/material.dart';
import 'package:hotel_app/config/theme/app_theme.dart';
import 'package:hotel_app/presentation/booking/widgets/custom_text_field.dart';

class InfoClient extends StatelessWidget {
  const InfoClient({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 8),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15.0),
        color: Colors.white,
      ),
      child: Form(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 16),
              child: Text('Информация о покупателе',
                  style: AppTheme().textStyleBigLetters),
            ),
            const CustomTextField(
              inputFormatters: [],
              labelText: 'Номер телефона',
              hintText: '+7 (***) ***-**-**',
            ),
            const SizedBox(
              height: 8,
            ),
            const CustomTextField(
              labelText: "Почта",
              hintText: 'yandex@yandex.ru',
            ),
            const SizedBox(
              height: 8,
            ),
            Text.rich(TextSpan(
                text:
                    'Эти данные никому не передаются. После оплаты мы вышлим чек на указанный номер и почту.',
                style: AppTheme().textStyleGreyLetters))
          ],
        ),
      ),
    );
  }
}
