// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sign_up_req_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SignUpReqModel _$SignUpReqModelFromJson(Map<String, dynamic> json) =>
    SignUpReqModel(
      profilePicturePath: json['profilePicturePath'] as String?,
      disabilityProofPath: json['disabilityProofPath'] as String?,
      firstName: json['firstName'] as String,
      lastName: json['lastName'] as String,
      phoneNumber: json['phoneNumber'] as String,
      nationalId: json['nationalId'] as String,
      email: json['email'] as String,
      password: json['password'] as String,
      age: (json['age'] as num).toInt(),
      gender: json['gender'] as String,
      address: json['address'] as String,
      hasMobilityDisability: json['hasMobilityDisability'] as bool,
    );

Map<String, dynamic> _$SignUpReqModelToJson(SignUpReqModel instance) =>
    <String, dynamic>{
      'firstName': instance.firstName,
      'lastName': instance.lastName,
      'phoneNumber': instance.phoneNumber,
      'nationalId': instance.nationalId,
      'email': instance.email,
      'password': instance.password,
      'age': instance.age,
      'address': instance.address,
      'gender': instance.gender,
      'profilePicturePath': instance.profilePicturePath,
      'hasMobilityDisability': instance.hasMobilityDisability,
      'disabilityProofPath': instance.disabilityProofPath,
    };
