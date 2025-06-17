// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_card_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProductCardModel _$ProductCardModelFromJson(Map<String, dynamic> json) =>
    ProductCardModel(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String,
      quantity: (json['quantity'] as num).toInt(),
      image: json['image'] as String?,
      description: json['description'] as String?,
      price: (json['price'] as num).toInt(),
      category: json['category'] as String,
    );

Map<String, dynamic> _$ProductCardModelToJson(ProductCardModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'image': instance.image,
      'description': instance.description,
      'price': instance.price,
      'quantity': instance.quantity,
      'category': instance.category,
    };
