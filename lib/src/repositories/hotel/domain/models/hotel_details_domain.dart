class HotelDetailsDomain {
  HotelDetailsDomain({
    required this.id,
    required this.name,
    required this.address,
    required this.minimalPrice,
    required this.priceForIt,
    required this.rating,
    required this.ratingName,
    required this.images,
    required this.aboutHotelDomain,
  });

  final int id;
  final String name;
  final String address;
  final int minimalPrice;
  final String priceForIt;
  final int rating;
  final String ratingName;
  final List<String> images;
  final AboutHotelDomain aboutHotelDomain;
}

class AboutHotelDomain {
  AboutHotelDomain({
    required this.description,
    required this.peculiarities,
  });

  final String description;
  final List<String> peculiarities;
}
