import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hotel_app/config/routes/app_router.dart';
import 'package:hotel_app/config/theme/app_theme.dart';
import 'package:flutter/rendering.dart' show debugPaintSizeEnabled;
import 'package:hotel_app/helpers/providers/hotel_info_provider.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
  debugPaintSizeEnabled = false;
  SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(statusBarColor: Colors.transparent));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
            lazy: false, create: (context) => HotelInfoProvider()..aboutHotel())
      ],
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        title: 'Hotel App',
        routerConfig: appRouter,
        theme: AppTheme().getTheme(),
      ),
    );
  }
}
