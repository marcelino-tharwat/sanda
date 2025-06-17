
import 'package:json_annotation/json_annotation.dart';
part 'order_res_model.g.dart';
@JsonSerializable()
class OrderResModel {
  final bool flag;
  final String message;

  OrderResModel({
    required this.flag,
    required this.message,
  });

  factory OrderResModel.fromJson(Map<String, dynamic> json) =>
      _$OrderResModelFromJson(json);

  Map<String, dynamic> toJson() => _$OrderResModelToJson(this);
}