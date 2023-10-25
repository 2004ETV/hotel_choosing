import 'package:hotel_choosing/src/repositories/hotel/domain/models/hotel_details_domain.dart';

abstract class HotelDetailsRepository {
  HotelDetailsRepository._();

  Future<HotelDetailsDomain> getHotelDetails();
}
