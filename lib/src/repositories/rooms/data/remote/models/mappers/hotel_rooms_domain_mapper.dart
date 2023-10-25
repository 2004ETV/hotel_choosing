import 'package:hotel_choosing/src/repositories/rooms/data/remote/models/hotel_rooms_response.dart';
import 'package:hotel_choosing/src/repositories/rooms/domain/models/hotel_room_domain.dart';

extension HotelRoomsDomainMapper on HotelRoomResponse {
  HotelRoomsDomain toHotelRoomsDomain() {
    return HotelRoomsDomain(
      id: id,
      name: name,
      price: price,
      pricePeriod: pricePeriod,
      peculiarities: peculiarities,
      images: images,
    );
  }
}
