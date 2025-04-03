import 'package:json_annotation/json_annotation.dart';

part "category_model.g.dart";

@JsonSerializable()
class CategoryModel {
  final int id;
  final String name;
  final String? image;
  final String? description;
  final int price;
  final String category;

  CategoryModel(
      {required this.id,
      required this.name,
      required this.image,
      required this.description,
      required this.price,
      required this.category});
  factory CategoryModel.fromJson(Map<String, dynamic> json) =>
      _$CategoryModelFromJson(json);

  Map<String, dynamic> toJson() => _$CategoryModelToJson(this);
}
