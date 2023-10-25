import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:hotel_choosing/src/app.dart';
import 'package:hotel_choosing/src/common/api_client/api_client.dart';
import 'package:hotel_choosing/src/repositories/booking/data/hotel_booking_repository_impl.dart';
import 'package:hotel_choosing/src/repositories/booking/data/remote/hotel_booking_data_source.dart';
import 'package:hotel_choosing/src/repositories/hotel/data/hotel_details_repository_impl.dart';
import 'package:hotel_choosing/src/repositories/hotel/data/remote/hotel_details_data_source.dart';
import 'package:hotel_choosing/src/repositories/rooms/data/hotel_rooms_repository_impl.dart';
import 'package:hotel_choosing/src/repositories/rooms/data/remote/hotel_rooms_data_source.dart';

final _baseUrlProvider = Provider((ref) => dotenv.env['API_BASE_URL']!);

final _dioProvider = Provider((ref) {
  final baseUrl = ref.watch(_baseUrlProvider);
  return ApiClient(baseUrl: baseUrl);
});

final _hotelDetailsDataSourceProvider = Provider((ref) {
  final apiClient = ref.watch(_dioProvider);
  return HotelDetailsDataSource(apiClient.dio);
});

final _hotelRoomsDataSourceProvider = Provider((ref) {
  final apiClient = ref.watch(_dioProvider);
  return HotelRoomsDataSource(apiClient.dio);
});

final _hotelDataSourceProvider = Provider((ref) {
  final apiClient = ref.watch(_dioProvider);
  return HotelBookingDataSource(apiClient.dio);
});

final hotelDetailsRepositoryProvider = Provider((ref) {
  final hotelDetailsDataSource = ref.watch(_hotelDetailsDataSourceProvider);
  return HotelDetailsRepositoryImpl(
    hotelDetailsDataSource: hotelDetailsDataSource,
  );
});

final hotelRoomsRepositoryProvider = Provider((ref) {
  final hotelRoomsDataSource = ref.watch(_hotelRoomsDataSourceProvider);
  return HotelRoomsRepositoryImpl(
    hotelRoomsDataSource: hotelRoomsDataSource,
  );
});

final hotelBookingRepositoryProvider = Provider((ref) {
  final hotelBookingDataSource = ref.watch(_hotelDataSourceProvider);
  return HotelBookingRepositoryImpl(
    hotelBookingDataSource: hotelBookingDataSource,
  );
});

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await dotenv.load();

  runApp(
    const ProviderScope(
      child: HotelChoosingApp(),
    ),
  );
}
