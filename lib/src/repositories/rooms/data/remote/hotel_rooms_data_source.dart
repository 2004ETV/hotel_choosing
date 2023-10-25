import 'package:dio/dio.dart';
import 'package:hotel_choosing/src/repositories/rooms/data/remote/models/hotel_rooms_response.dart';
import 'package:retrofit/http.dart';

part 'hotel_rooms_data_source.g.dart';

@RestApi()
abstract class HotelRoomsDataSource {
  factory HotelRoomsDataSource(Dio dio, {String baseUrl}) =
      _HotelRoomsDataSource;

  @GET('f9a38183-6f95-43aa-853a-9c83cbb05ecd')
  Future<HotelRoomsResponse> getHotelRooms();
}
