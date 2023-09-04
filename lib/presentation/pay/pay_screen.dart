import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hotel_app/config/theme/app_theme.dart';
import 'package:hotel_app/presentation/shared/button_blue.dart';

class PayScreen extends StatelessWidget {
  const PayScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Заказ оплачен'),
      ),
      body: Container(
        child: Column(
          //   mainAxisSize: MainAxisSize.min,
          //   mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: Container(
                color: Colors.white,
                width: size.width,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset('assets/fiesta.png'),
                    SizedBox(
                      height: 32,
                    ),
                    Text('Ваш заказ принят в работу',
                        style: AppTheme().textStyleBigLetters),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 23, vertical: 20),
                      child: Text(
                          'Подтверждение заказа N104583 может занять некоторое время (от 1 часа до суток). Как только мы получим ответ от туроператора, вам на почту придёт уведомление.',
                          textAlign: TextAlign.center,
                          style: AppTheme().textStyleGreyLetters),
                    ),
                  ],
                ),
              ),
            ),
            //     SizedBox(
            //       height: size.height * 0.25,
            //     ),
            //     Container(
            //         decoration: const BoxDecoration(color: Color(0xffFFFFFC)),
            //         width: 94,
            //         child: Column(children: [
            //           Image.asset('assets/fiesta.png'),
            //
            SizedBox(
              height: 8,
            ),
            ButtonBlue(
                text: "Супер!",
                onPressed: () => Router.neglect(context, () => context.go('/'))
                // context.pushReplacement('/', context.go('/')))
                )
            //         ]))
          ],
        ),
      ),
    );
  }
}
