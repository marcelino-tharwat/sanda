// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_order_res_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserOrderResModel _$UserOrderResModelFromJson(Map<String, dynamic> json) =>
    UserOrderResModel(
      orderId: (json['orderId'] as num).toInt(),
      startDate: json['startDate'] == null
          ? null
          : DateTime.parse(json['startDate'] as String),
      inProgressDate: json['inProgressDate'] == null
          ? null
          : DateTime.parse(json['inProgressDate'] as String),
      completionDate: json['completionDate'] == null
          ? null
          : DateTime.parse(json['completionDate'] as String),
      name: json['name'] as String,
      userId: (json['userId'] as num?)?.toInt(),
      userName: json['userName'] as String,
      comment: json['comment'] as String,
      phoneNumber: json['phoneNumber'] as String,
      status: json['status'] as String,
      location: json['location'] as String,
      statusLastUpdated: json['statusLastUpdated'] == null
          ? null
          : DateTime.parse(json['statusLastUpdated'] as String),
      createdDate: DateTime.parse(json['createdDate'] as String),
      volunteerId: (json['volunteerId'] as num?)?.toInt(),
      user: json['user'],
    );

Map<String, dynamic> _$UserOrderResModelToJson(UserOrderResModel instance) =>
    <String, dynamic>{
      'orderId': instance.orderId,
      'startDate': instance.startDate?.toIso8601String(),
      'inProgressDate': instance.inProgressDate?.toIso8601String(),
      'completionDate': instance.completionDate?.toIso8601String(),
      'name': instance.name,
      'userId': instance.userId,
      'userName': instance.userName,
      'comment': instance.comment,
      'phoneNumber': instance.phoneNumber,
      'status': instance.status,
      'location': instance.location,
      'statusLastUpdated': instance.statusLastUpdated?.toIso8601String(),
      'createdDate': instance.createdDate.toIso8601String(),
      'volunteerId': instance.volunteerId,
      'user': instance.user,
    };
