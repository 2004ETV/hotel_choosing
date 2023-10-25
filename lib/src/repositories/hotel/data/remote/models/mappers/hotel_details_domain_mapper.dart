import 'package:hotel_choosing/src/repositories/hotel/data/remote/models/hotel_details_response.dart';
import 'package:hotel_choosing/src/repositories/hotel/data/remote/models/mappers/about_hotel_domain_mapper.dart';
import 'package:hotel_choosing/src/repositories/hotel/domain/models/hotel_details_domain.dart';

extension HotelDetailsDomainMapper on HotelDetailsResponse {
  HotelDetailsDomain toHotelDetailsDomain() {
    return HotelDetailsDomain(
      id: id,
      name: name,
      address: address,
      minimalPrice: minimalPrice,
      priceForIt: priceForIt,
      rating: rating,
      ratingName: ratingName,
      images: images,
      aboutHotelDomain: aboutHotelResponse.toAboutHotelDomain(),
    );
  }
}
