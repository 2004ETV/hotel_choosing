import 'package:hotel_choosing/src/repositories/rooms/data/hotel_rooms_repository.dart';
import 'package:hotel_choosing/src/repositories/rooms/data/remote/hotel_rooms_data_source.dart';
import 'package:hotel_choosing/src/repositories/rooms/data/remote/models/mappers/hotel_rooms_domain_mapper.dart';
import 'package:hotel_choosing/src/repositories/rooms/domain/models/hotel_room_domain.dart';

class HotelRoomsRepositoryImpl implements HotelRoomsRepository {
  HotelRoomsRepositoryImpl({
    required this.hotelRoomsDataSource,
  });

  final HotelRoomsDataSource hotelRoomsDataSource;

  @override
  Future<List<HotelRoomsDomain>> getHotelRooms() {
    return hotelRoomsDataSource.getHotelRooms().then(
          (value) => value.rooms.map((e) => e.toHotelRoomsDomain()).toList(),
        );
  }
}
