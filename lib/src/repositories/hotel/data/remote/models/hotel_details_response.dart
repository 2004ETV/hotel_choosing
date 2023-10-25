import 'package:json_annotation/json_annotation.dart';

part 'hotel_details_response.g.dart';

@JsonSerializable(createToJson: false)
class HotelDetailsResponse {
  HotelDetailsResponse({
    required this.id,
    required this.name,
    required this.address,
    required this.minimalPrice,
    required this.priceForIt,
    required this.rating,
    required this.ratingName,
    required this.images,
    required this.aboutHotelResponse,
  });

  factory HotelDetailsResponse.fromJson(Map<String, dynamic> json) =>
      _$HotelDetailsResponseFromJson(json);

  @JsonKey(name: 'id')
  final int id;

  @JsonKey(name: 'name')
  final String name;

  @JsonKey(name: 'adress')
  final String address;

  @JsonKey(name: 'minimal_price')
  final int minimalPrice;

  @JsonKey(name: 'price_for_it')
  final String priceForIt;

  @JsonKey(name: 'rating')
  final int rating;

  @JsonKey(name: 'rating_name')
  final String ratingName;

  @JsonKey(name: 'image_urls')
  final List<String> images;

  @JsonKey(name: 'about_the_hotel')
  final AboutHotelResponse aboutHotelResponse;
}

@JsonSerializable(createToJson: false)
class AboutHotelResponse {
  AboutHotelResponse({
    required this.description,
    required this.peculiarities,
  });

  factory AboutHotelResponse.fromJson(Map<String, dynamic> json) =>
      _$AboutHotelResponseFromJson(json);

  @JsonKey(name: 'description')
  final String description;

  @JsonKey(name: 'peculiarities')
  final List<String> peculiarities;
}
