import 'dart:convert';

class AddressModel {
  final String fullName;
  final String address;
  final String city;
  final String zipCode;
  final String country;

  AddressModel({
    required this.fullName,
    required this.address,
    required this.city,
    required this.zipCode,
    required this.country,
  });

  Map<String, dynamic> toMap() {
    return {
      'fullName': fullName,
      'address': address,
      'city': city,
      'zipCode': zipCode,
      'country': country,
    };
  }

  factory AddressModel.fromMap(Map<String, dynamic> map) {
    return AddressModel(
      fullName: map['fullName'],
      address: map['address'],
      city: map['city'],
      zipCode: map['zipCode'],
      country: map['country'],
    );
  }

  String toJson() => json.encode(toMap());

  factory AddressModel.fromJson(String source) => AddressModel.fromMap(json.decode(source));
}
