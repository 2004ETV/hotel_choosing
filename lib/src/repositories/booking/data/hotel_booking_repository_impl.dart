import 'package:hotel_choosing/src/repositories/booking/data/hotel_booking_repository.dart';
import 'package:hotel_choosing/src/repositories/booking/data/remote/hotel_booking_data_source.dart';
import 'package:hotel_choosing/src/repositories/booking/data/remote/models/mappers/hotel_booking_domain_mapper.dart';
import 'package:hotel_choosing/src/repositories/booking/domain/models/hotel_booking_domain.dart';

class HotelBookingRepositoryImpl implements HotelBookingRepository {
  HotelBookingRepositoryImpl({
    required this.hotelBookingDataSource,
  });

  final HotelBookingDataSource hotelBookingDataSource;

  @override
  Future<HotelBookingDomain> getHotelBookingDomainData() {
    return hotelBookingDataSource
        .getHotelBookingData()
        .then((value) => value.toHotelBookingDomain());
  }
}
