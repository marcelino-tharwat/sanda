import 'package:json_annotation/json_annotation.dart';

part 'user_res.g.dart';

@JsonSerializable()
class UserResponse {
  final int? id, age;
  final String? firstName,
      lastName,
      email,
      phoneNumber,
      nationalId,
      address,
      gender;
  @JsonKey(name: 'profilePicturePath')
  final String? profilePicturePath;
  final DateTime? dateOfBirth;

  UserResponse({
    this.id,
    this.firstName,
    this.lastName,
    this.email,
    this.phoneNumber,
    this.nationalId,
    this.gender,
    this.age,
    this.dateOfBirth,
    this.profilePicturePath,
    this.address,
  });

  factory UserResponse.fromJson(Map<String, dynamic> json) =>
      _$UserResponseFromJson(json);

  Map<String, dynamic> toJson() => _$UserResponseToJson(this);

  UserResponse copyWith({String? profilePicturePath}) {
    return UserResponse(
      id: id,
      firstName: firstName,
      lastName: lastName,
      email: email,
      phoneNumber: phoneNumber,
      nationalId: nationalId,
      gender: gender,
      age: age,
      dateOfBirth: dateOfBirth,
      address: address,
      profilePicturePath: profilePicturePath ?? this.profilePicturePath,
    );
  }
}
