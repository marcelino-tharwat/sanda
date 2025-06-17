// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order_req_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OrderReqModel _$OrderReqModelFromJson(Map<String, dynamic> json) =>
    OrderReqModel(
      name: json['name'] as String,
      comment: json['comment'] as String,
      phoneNumber: json['phoneNumber'] as String,
      location: json['location'] as String,
      userId: (json['userId'] as num).toInt(),
    );

Map<String, dynamic> _$OrderReqModelToJson(OrderReqModel instance) =>
    <String, dynamic>{
      'name': instance.name,
      'comment': instance.comment,
      'phoneNumber': instance.phoneNumber,
      'location': instance.location,
      'userId': instance.userId,
    };
