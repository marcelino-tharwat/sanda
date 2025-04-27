import 'package:json_annotation/json_annotation.dart';

part "product_card_model.g.dart";

@JsonSerializable()
class ProductCardModel {
  final int id;
  final String name;
  final String? image;
  final String? description;
  final int price;
   int quantity;
  final String category;

  ProductCardModel(
      {required this.id,
      required this.name,
      required this.quantity,
      required this.image,
      required this.description,
      required this.price,
      required this.category});
  factory ProductCardModel.fromJson(Map<String, dynamic> json) =>
      _$ProductCardModelFromJson(json);

  Map<String, dynamic> toJson() => _$ProductCardModelToJson(this);
}
