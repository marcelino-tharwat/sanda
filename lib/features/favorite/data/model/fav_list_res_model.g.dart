// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'fav_list_res_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FavListResModel _$FavListResModelFromJson(Map<String, dynamic> json) =>
    FavListResModel(
      id: (json['id'] as num).toInt(),
      serviceId: (json['serviceId'] as num).toInt(),
      serviceName: json['serviceName'] as String?,
      serviceImage: json['serviceImage'] as String?,
      serviceCategory: json['serviceCategory'] as String?,
      servicePrice: (json['servicePrice'] as num?)?.toInt(),
      addedDate: DateTime.parse(json['addedDate'] as String),
    );

Map<String, dynamic> _$FavListResModelToJson(FavListResModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'serviceId': instance.serviceId,
      'serviceName': instance.serviceName,
      'serviceImage': instance.serviceImage,
      'serviceCategory': instance.serviceCategory,
      'servicePrice': instance.servicePrice,
      'addedDate': instance.addedDate.toIso8601String(),
    };
