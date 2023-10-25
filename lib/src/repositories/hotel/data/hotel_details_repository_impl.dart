import 'package:hotel_choosing/src/repositories/hotel/data/hotel_details_repository.dart';
import 'package:hotel_choosing/src/repositories/hotel/data/remote/hotel_details_data_source.dart';
import 'package:hotel_choosing/src/repositories/hotel/data/remote/models/mappers/hotel_details_domain_mapper.dart';
import 'package:hotel_choosing/src/repositories/hotel/domain/models/hotel_details_domain.dart';

class HotelDetailsRepositoryImpl implements HotelDetailsRepository {
  HotelDetailsRepositoryImpl({
    required this.hotelDetailsDataSource,
  });

  final HotelDetailsDataSource hotelDetailsDataSource;

  @override
  Future<HotelDetailsDomain> getHotelDetails() {
    return hotelDetailsDataSource
        .getHotelDetails()
        .then((value) => value.toHotelDetailsDomain());
  }
}
