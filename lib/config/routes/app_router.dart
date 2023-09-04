import 'package:go_router/go_router.dart';
import 'package:hotel_app/presentation/screens.dart';

final appRouter = GoRouter(initialLocation: '/', routes: [
  GoRoute(
    path: '/',
    builder: (context, state) => const HotelScreen(),
  ),
  GoRoute(
    path: '/apartment',
    builder: (context, state) => const ApartmentsScreen(),
  ),
  GoRoute(
    path: '/booking',
    builder: (context, state) => BookingScreen(),
  ),
  GoRoute(
    path: '/pay',
    builder: (context, state) => const PayScreen(),
  ),
]);
