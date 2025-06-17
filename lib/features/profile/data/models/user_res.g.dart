// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_res.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserResponse _$UserResponseFromJson(Map<String, dynamic> json) => UserResponse(
      id: (json['id'] as num?)?.toInt(),
      firstName: json['firstName'] as String?,
      lastName: json['lastName'] as String?,
      email: json['email'] as String?,
      phoneNumber: json['phoneNumber'] as String?,
      nationalId: json['nationalId'] as String?,
      gender: json['gender'] as String?,
      age: (json['age'] as num?)?.toInt(),
      dateOfBirth: json['dateOfBirth'] == null
          ? null
          : DateTime.parse(json['dateOfBirth'] as String),
      profilePicturePath: json['profilePicturePath'] as String?,
      address: json['address'] as String?,
    );

Map<String, dynamic> _$UserResponseToJson(UserResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'age': instance.age,
      'firstName': instance.firstName,
      'lastName': instance.lastName,
      'email': instance.email,
      'phoneNumber': instance.phoneNumber,
      'nationalId': instance.nationalId,
      'address': instance.address,
      'gender': instance.gender,
      'profilePicturePath': instance.profilePicturePath,
      'dateOfBirth': instance.dateOfBirth?.toIso8601String(),
    };
