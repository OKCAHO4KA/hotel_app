import 'dart:convert';

class Rooms {
  final List<Room> rooms;

  Rooms({
    required this.rooms,
  });

  factory Rooms.fromRawJson(String str) => Rooms.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Rooms.fromJson(Map<String, dynamic> json) => Rooms(
        rooms: List<Room>.from(json["rooms"].map((x) => Room.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "rooms": List<dynamic>.from(rooms.map((x) => x.toJson())),
      };
}

class Room {
  final int id;
  final String name;
  final int price;
  final String? pricePer;
  final List<String>? peculiarities;
  final List<String>? imageUrls;

  Room({
    required this.id,
    required this.name,
    required this.price,
    this.pricePer,
    this.peculiarities,
    this.imageUrls,
  });

  factory Room.fromRawJson(String str) => Room.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Room.fromJson(Map<String, dynamic> json) => Room(
        id: json["id"],
        name: json["name"],
        price: json["price"],
        pricePer: json["price_per"],
        peculiarities: List<String>.from(json["peculiarities"].map((x) => x)),
        imageUrls: List<String>.from(json["image_urls"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "price": price,
        "price_per": pricePer,
        "peculiarities": List<dynamic>.from(peculiarities!.map((x) => x)),
        "image_urls": List<dynamic>.from(imageUrls!.map((x) => x)),
      };
}
