import 'package:flutter/material.dart';
import 'package:hotel_app/config/theme/app_theme.dart';
import 'package:hotel_app/helpers/providers/hotel_info_provider.dart';
import 'package:hotel_app/presentation/booking/widgets/custom_text_field.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:provider/provider.dart';

class InfoClient extends StatefulWidget {
  const InfoClient({
    super.key,
  });

  @override
  State<InfoClient> createState() => _InfoClientState();
}

class _InfoClientState extends State<InfoClient> {
  var maskFormatter = MaskTextInputFormatter(
      mask: '+7(###)###-##-##',
      filter: {"#": RegExp(r'[0-9]')},
      type: MaskAutoCompletionType.lazy);

  @override
  Widget build(BuildContext context) {
    final hotelInfoProvider = Provider.of<HotelInfoProvider>(context);
    return Container(
      margin: const EdgeInsets.only(top: 8),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15.0),
        color: Colors.white,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 16),
            child: Text('Информация о покупателе',
                style: AppTheme().textStyleBigLetters),
          ),
          CustomTextField(
            onChanged: (value) {
              hotelInfoProvider.isValidForm();
              return null;
            },
            typeInput: TextInputType.phone,
            validator: (value) {
              if (value!.isEmpty) {
                return '*Поле "Номер телефона" обязательно к заполнению';
              } else if (!value.isValidPhone) {
                return '*Введите корректный номер телефона';
              }
              return null;
            },
            inputFormatters: [maskFormatter],
            labelText: 'Номер телефона',
            hintText: '+7(***)***-**-**',
          ),
          const SizedBox(
            height: 8,
          ),
          CustomTextField(
            onChanged: (value) {
              hotelInfoProvider.isValidForm();
              return null;
            },
            typeInput: TextInputType.emailAddress,
            labelText: "Почта",
            hintText: 'yandex@yandex.ru',
            validator: (value) {
              if (!value!.isValidEmail) return '*Проверьте правильность почты';
              return null;
            },
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
    );
  }
}
