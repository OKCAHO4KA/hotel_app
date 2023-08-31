import 'dart:convert';

class HotelResponse {
  final int id;
  final String name;
  final String adress;
  final int? minimalPrice;
  final String? priceForIt;
  final int? rating;
  final String? ratingName;
  final List<String>? imageUrls;
  final AboutTheHotel? aboutTheHotel;

  HotelResponse({
    required this.id,
    required this.name,
    required this.adress,
    this.minimalPrice = 0,
    this.priceForIt,
    this.rating = 0,
    this.ratingName,
    this.imageUrls,
    this.aboutTheHotel,
  });

  factory HotelResponse.fromRawJson(String str) =>
      HotelResponse.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory HotelResponse.fromJson(Map<String, dynamic> json) => HotelResponse(
        id: json["id"],
        name: json["name"],
        adress: json["adress"],
        minimalPrice: json["minimal_price"],
        priceForIt: json["price_for_it"],
        rating: json["rating"],
        ratingName: json["rating_name"],
        imageUrls: List<String>.from(json["image_urls"].map((x) => x)),
        aboutTheHotel: AboutTheHotel.fromJson(json["about_the_hotel"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "adress": adress,
        "minimal_price": minimalPrice,
        "price_for_it": priceForIt,
        "rating": rating,
        "rating_name": ratingName,
        "image_urls": List<dynamic>.from(imageUrls!.map((x) => x)),
        "about_the_hotel": aboutTheHotel!.toJson(),
      };
}

class AboutTheHotel {
  final String? description;
  final List<String>? peculiarities;

  AboutTheHotel({
    this.description,
    this.peculiarities,
  });

  factory AboutTheHotel.fromRawJson(String str) =>
      AboutTheHotel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory AboutTheHotel.fromJson(Map<String, dynamic> json) => AboutTheHotel(
        description: json["description"],
        peculiarities: List<String>.from(json["peculiarities"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "description": description,
        "peculiarities": List<dynamic>.from(peculiarities!.map((x) => x)),
      };
}
