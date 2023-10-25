class HotelRoomsDomain {
  HotelRoomsDomain({
    required this.id,
    required this.name,
    required this.price,
    required this.pricePeriod,
    required this.peculiarities,
    required this.images,
  });

  final int id;
  final String name;
  final int price;
  final String pricePeriod;
  final List<String> peculiarities;
  final List<String> images;
}
