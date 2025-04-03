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
      profilePicturePath,
      address,
      gender;

  final DateTime? dateOfBirth;

  UserResponse({
      this.id,
      this.firstName,
      this.email,
      this.phoneNumber,
      this.nationalId,
      this.gender,
      this.age,
      this.lastName,
      this.dateOfBirth, this.profilePicturePath, this.address});

  factory UserResponse.fromJson(Map<String, dynamic> json) =>
      _$UserResponseFromJson(json);

  Map<String, dynamic> toJson() => _$UserResponseToJson(this);
}
