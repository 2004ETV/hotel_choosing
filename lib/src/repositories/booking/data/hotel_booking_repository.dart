import 'package:hotel_choosing/src/repositories/booking/domain/models/hotel_booking_domain.dart';

abstract class HotelBookingRepository {
  HotelBookingRepository._();

  Future<HotelBookingDomain> getHotelBookingDomainData();
}
