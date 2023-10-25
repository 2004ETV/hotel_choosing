import 'package:hotel_choosing/src/repositories/hotel/data/remote/models/hotel_details_response.dart';
import 'package:hotel_choosing/src/repositories/hotel/domain/models/hotel_details_domain.dart';

extension AboutHotelDomainMapper on AboutHotelResponse {
  AboutHotelDomain toAboutHotelDomain() {
    return AboutHotelDomain(
      description: description,
      peculiarities: peculiarities,
    );
  }
}
