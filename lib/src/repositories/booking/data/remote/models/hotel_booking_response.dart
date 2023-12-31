import 'package:json_annotation/json_annotation.dart';

part 'hotel_booking_response.g.dart';

@JsonSerializable(createToJson: false)
class HotelBookingResponse {
  HotelBookingResponse({
    required this.id,
    required this.hotelName,
    required this.hotelAddress,
    required this.horating,
    required this.ratingName,
    required this.departure,
    required this.arrivalCountry,
    required this.tourDateStart,
    required this.tourDateStop,
    required this.numberOfNights,
    required this.room,
    required this.nutrition,
    required this.tourPrice,
    required this.fuelCharge,
    required this.serviceCharge,
  });

  factory HotelBookingResponse.fromJson(Map<String, dynamic> json) =>
      _$HotelBookingResponseFromJson(json);

  @JsonKey(name: 'id')
  final int id;

  @JsonKey(name: 'hotel_name')
  final String hotelName;

  @JsonKey(name: 'hotel_adress')
  final String hotelAddress;

  @JsonKey(name: 'horating')
  final int horating;

  @JsonKey(name: 'rating_name')
  final String ratingName;

  @JsonKey(name: 'departure')
  final String departure;

  @JsonKey(name: 'arrival_country')
  final String arrivalCountry;

  @JsonKey(name: 'tour_date_start')
  final String tourDateStart;

  @JsonKey(name: 'tour_date_stop')
  final String tourDateStop;

  @JsonKey(name: 'number_of_nights')
  final int numberOfNights;

  @JsonKey(name: 'room')
  final String room;

  @JsonKey(name: 'nutrition')
  final String nutrition;

  @JsonKey(name: 'tour_price')
  final int tourPrice;

  @JsonKey(name: 'fuel_charge')
  final int fuelCharge;

  @JsonKey(name: 'service_charge')
  final int serviceCharge;
}
