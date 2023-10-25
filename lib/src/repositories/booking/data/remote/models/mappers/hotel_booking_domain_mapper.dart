import 'package:hotel_choosing/src/repositories/booking/data/remote/models/hotel_booking_response.dart';
import 'package:hotel_choosing/src/repositories/booking/domain/models/hotel_booking_domain.dart';

extension HotelBookingDomainMapper on HotelBookingResponse {
  HotelBookingDomain toHotelBookingDomain() {
    return HotelBookingDomain(
      id: id,
      hotelName: hotelName,
      hotelAddress: hotelAddress,
      horating: horating,
      ratingName: ratingName,
      departure: departure,
      arrivalCountry: arrivalCountry,
      tourDateStart: tourDateStart,
      tourDateStop: tourDateStop,
      numberOfNights: numberOfNights,
      room: room,
      nutrition: nutrition,
      tourPrice: tourPrice,
      fuelCharge: fuelCharge,
      serviceCharge: serviceCharge,
    );
  }
}
