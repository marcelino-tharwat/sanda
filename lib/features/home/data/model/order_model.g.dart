// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OrderModel _$OrderModelFromJson(Map<String, dynamic> json) => OrderModel(
      DateTime.parse(json['startDate'] as String),
      json['inProgressDate'] == null
          ? null
          : DateTime.parse(json['inProgressDate'] as String),
      json['completionDate'] == null
          ? null
          : DateTime.parse(json['completionDate'] as String),
      json['phoneNumber'] as String,
      (json['status'] as num).toInt(),
      json['location'] as String,
      DateTime.parse(json['statusLastUpdated'] as String),
      (json['volunteerId'] as num).toInt(),
      orderId: (json['orderId'] as num).toInt(),
      name: json['name'] as String,
      userId: (json['userId'] as num).toInt(),
      comment: json['comment'] as String?,
      price: (json['price'] as num).toInt(),
      category: json['category'] as String,
    );

Map<String, dynamic> _$OrderModelToJson(OrderModel instance) =>
    <String, dynamic>{
      'orderId': instance.orderId,
      'startDate': instance.startDate.toIso8601String(),
      'inProgressDate': instance.inProgressDate?.toIso8601String(),
      'completionDate': instance.completionDate?.toIso8601String(),
      'userId': instance.userId,
      'name': instance.name,
      'comment': instance.comment,
      'price': instance.price,
      'category': instance.category,
      'phoneNumber': instance.phoneNumber,
      'status': instance.status,
      'location': instance.location,
      'statusLastUpdated': instance.statusLastUpdated.toIso8601String(),
      'volunteerId': instance.volunteerId,
    };
