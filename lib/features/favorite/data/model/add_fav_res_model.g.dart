// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'add_fav_res_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AddFavResModel _$AddFavResModelFromJson(Map<String, dynamic> json) =>
    AddFavResModel(
      favoriteId: (json['favoriteId'] as num).toInt(),
      message: json['message'] as String,
    );

Map<String, dynamic> _$AddFavResModelToJson(AddFavResModel instance) =>
    <String, dynamic>{
      'message': instance.message,
      'favoriteId': instance.favoriteId,
    };
