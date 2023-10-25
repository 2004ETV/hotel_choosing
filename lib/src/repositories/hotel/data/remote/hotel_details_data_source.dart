import 'package:dio/dio.dart';
import 'package:hotel_choosing/src/repositories/hotel/data/remote/models/hotel_details_response.dart';
import 'package:retrofit/http.dart';

part 'hotel_details_data_source.g.dart';

@RestApi()
abstract class HotelDetailsDataSource {
  factory HotelDetailsDataSource(Dio dio, {String baseUrl}) =
      _HotelDetailsDataSource;

  @GET('35e0d18e-2521-4f1b-a575-f0fe366f66e3')
  Future<HotelDetailsResponse> getHotelDetails();
}
