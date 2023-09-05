import 'dart:math';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hotel_app/config/theme/app_theme.dart';
import 'package:hotel_app/presentation/shared/button_blue.dart';

class PayScreen extends StatelessWidget {
  const PayScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final random = Random();
    final size = MediaQuery.sizeOf(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Заказ оплачен'),
      ),
      body: Column(
        children: [
          Expanded(
            child: Container(
              color: Colors.white,
              width: size.width,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset('assets/fiesta.png'),
                  const SizedBox(
                    height: 32,
                  ),
                  Text('Ваш заказ принят в работу',
                      style: AppTheme().textStyleBigLetters),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 23, vertical: 20),
                    child: Text(
                        'Подтверждение заказа N${random.nextInt(999999)} может занять некоторое время (от 1 часа до суток). Как только мы получим ответ от туроператора, вам на почту придёт уведомление.',
                        textAlign: TextAlign.center,
                        style: AppTheme().textStyleGreyLetters),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(
            height: 8,
          ),
          ButtonBlue(
              text: "Супер!",
              onPressed: () async {
                await Future.delayed(const Duration(milliseconds: 1200));
                Future.microtask(
                    () => Router.neglect(context, () => context.go('/')));
              }),
        ],
      ),
    );
  }
}
