import 'package:json_annotation/json_annotation.dart';

part "category_model.g.dart";

@JsonSerializable()
class ProductOrServiceModel {
  final int id;
  final String name;
  final String? image;
  final String? description;
  final int? price;
  // final int quantity;
  final String category;

  ProductOrServiceModel(
      {required this.id,
      required this.name,
      required this.image,
      required this.description,
      required this.price,
      required this.category});
  factory ProductOrServiceModel.fromJson(Map<String, dynamic> json) =>
      _$ProductOrServiceModelFromJson(json);

  Map<String, dynamic> toJson() => _$ProductOrServiceModelToJson(this);
}
