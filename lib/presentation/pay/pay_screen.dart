import 'package:flutter/material.dart';

class PayScreen extends StatelessWidget {
  const PayScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Заказ оплачен'),
      ),
      body: Center(
        child: Text('PayScreen'),
      ),
    );
  }
}
