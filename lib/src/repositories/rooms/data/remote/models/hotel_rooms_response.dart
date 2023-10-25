import 'package:json_annotation/json_annotation.dart';

part 'hotel_rooms_response.g.dart';

@JsonSerializable(createToJson: false)
class HotelRoomsResponse {
  HotelRoomsResponse({
    required this.rooms,
  });

  factory HotelRoomsResponse.fromJson(Map<String, dynamic> json) =>
      _$HotelRoomsResponseFromJson(json);

  @JsonKey(name: 'rooms')
  final List<HotelRoomResponse> rooms;
}

@JsonSerializable(createToJson: false)
class HotelRoomResponse {
  HotelRoomResponse({
    required this.id,
    required this.name,
    required this.price,
    required this.pricePeriod,
    required this.peculiarities,
    required this.images,
  });

  factory HotelRoomResponse.fromJson(Map<String, dynamic> json) =>
      _$HotelRoomResponseFromJson(json);

  @JsonKey(name: 'id')
  final int id;

  @JsonKey(name: 'name')
  final String name;

  @JsonKey(name: 'price')
  final int price;

  @JsonKey(name: 'price_per')
  final String pricePeriod;

  @JsonKey(name: 'peculiarities')
  final List<String> peculiarities;

  @JsonKey(name: 'image_urls')
  final List<String> images;
}
