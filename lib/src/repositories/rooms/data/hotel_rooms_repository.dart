import 'package:hotel_choosing/src/repositories/rooms/domain/models/hotel_room_domain.dart';

abstract class HotelRoomsRepository {
  HotelRoomsRepository._();

  Future<List<HotelRoomsDomain>> getHotelRooms();
}
