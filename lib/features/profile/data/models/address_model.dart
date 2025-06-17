
import 'dart:convert';

class AddressModel {
  final String address;
  final String city;
  final String zipCode;

  AddressModel({
    required this.address,
    required this.city,
    required this.zipCode,
  });

  Map<String, dynamic> toMap() {
    return {
      'address': address,
      'city': city,
      'zipCode': zipCode,
    };
  }

  factory AddressModel.fromMap(Map<String, dynamic> map) {
    return AddressModel(
      address: map['address'],
      city: map['city'],
      zipCode: map['zipCode'],
    );
  }

  String toJson() => json.encode(toMap());

  factory AddressModel.fromJson(String source) => AddressModel.fromMap(json.decode(source));
}
