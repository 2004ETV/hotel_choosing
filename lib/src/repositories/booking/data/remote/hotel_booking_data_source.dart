import 'package:dio/dio.dart';
import 'package:hotel_choosing/src/repositories/booking/data/remote/models/hotel_booking_response.dart';
import 'package:retrofit/http.dart';

part 'hotel_booking_data_source.g.dart';

@RestApi()
abstract class HotelBookingDataSource {
  factory HotelBookingDataSource(Dio dio, {String baseUrl}) =
      _HotelBookingDataSource;
  
  @GET('e8868481-743f-4eb2-a0d7-2bc4012275c8')
  Future<HotelBookingResponse> getHotelBookingData();
}
