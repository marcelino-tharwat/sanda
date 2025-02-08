// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sign_up_req_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SignUpReqModel _$SignUpReqModelFromJson(Map<String, dynamic> json) =>
    SignUpReqModel(
      (json['id'] as num).toInt(),
      firstName: json['firstName'] as String,
      lastName: json['lastName'] as String,
      phoneNumber: json['phoneNumber'] as String,
      nationalId: json['nationalId'] as String,
      email: json['email'] as String,
      password: json['password'] as String,
      age: (json['age'] as num).toInt(),
      gender: json['gender'] as String,
      imagePath: json['imagePath'] as String,
    );

Map<String, dynamic> _$SignUpReqModelToJson(SignUpReqModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'firstName': instance.firstName,
      'lastName': instance.lastName,
      'phoneNumber': instance.phoneNumber,
      'nationalId': instance.nationalId,
      'email': instance.email,
      'password': instance.password,
      'age': instance.age,
      'gender': instance.gender,
      'imagePath': instance.imagePath,
    };
