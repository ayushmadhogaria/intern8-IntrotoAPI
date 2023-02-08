class UserModel {
  int id;
  String name;
  String userName;
  String email;
  Address address;

  UserModel({
    required this.id,
    required this.name,
    required this.userName,
    required this.email,
    required this.address,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json["id"],
      name: json["name"],
      userName: json['username'],
      email: json['email'],
      address: Address.fromJson(json['address']),
    );
  }
}

class Address {
  String street;
  String suite;
  String city;
  String zipCode;
  Geo geo;

  Address({
    required this.street,
    required this.suite,
    required this.city,
    required this.zipCode,
    required this.geo,
  });

  factory Address.fromJson(Map<String, dynamic> json) {
    return Address(
      street: json["street"],
      suite: json['suite'],
      city: json['city'],
      zipCode: json['zipcode'],
      geo: Geo.fromJson(json['geo']),
    );
  }
}

class Geo {
  String lat;
  String lng;

  Geo({required this.lat, required this.lng});

  factory Geo.fromJson(Map<String, dynamic> json) {
    return Geo(
      lat: json['lat'],
      lng: json['lng'],
    );
  }
}
