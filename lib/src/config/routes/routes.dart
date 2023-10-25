import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hotel_choosing/src/screens/booking/presentation/booking_screen.dart';
import 'package:hotel_choosing/src/screens/hotel_details/presentation/hotel_details_screen.dart';
import 'package:hotel_choosing/src/screens/rooms/presentation/rooms_screen.dart';

part 'routes.g.dart';

abstract class Routes {
  Routes._();

  static final all = GoRouter(
    initialLocation: '/',
    routes: $appRoutes,
    debugLogDiagnostics: kDebugMode,
  );
}

@TypedGoRoute<HotelDetailsScreenRoute>(
  path: '/',
  routes: [
    TypedGoRoute<RoomsScreenRoute>(
      path: 'rooms',
      routes: [
        TypedGoRoute<BookingScreenRoute>(path: 'booking/:id'),
      ],
    ),
  ],
)
@immutable
class HotelDetailsScreenRoute extends GoRouteData {
  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const HotelDetailsScreen();
  }
}

@immutable
class RoomsScreenRoute extends GoRouteData {
  const RoomsScreenRoute({
    this.hotelName = 'Отель',
  });

  final String hotelName;

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return RoomsScreen(hotelName: hotelName);
  }
}

@immutable
class BookingScreenRoute extends GoRouteData {
  const BookingScreenRoute({
    this.id = 1,
  });

  final int id;

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const BookingScreen();
  }
}
