// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'category_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProductOrServiceModel _$ProductOrServiceModelFromJson(
        Map<String, dynamic> json) =>
    ProductOrServiceModel(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String,
      image: json['image'] as String?,
      description: json['description'] as String?,
      price: (json['price'] as num?)?.toInt(),
      category: json['category'] as String,
    );

Map<String, dynamic> _$ProductOrServiceModelToJson(
        ProductOrServiceModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'image': instance.image,
      'description': instance.description,
      'price': instance.price,
      'category': instance.category,
    };
