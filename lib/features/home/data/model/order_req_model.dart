import 'package:json_annotation/json_annotation.dart';
part 'order_req_model.g.dart';

@JsonSerializable()
class OrderReqModel {
  final String name, comment, phoneNumber, location;
  final int userId;

  OrderReqModel(
      {required this.name,
      required this.comment,
      required this.phoneNumber,
      required this.location,
      required this.userId});
  factory OrderReqModel.fromJson(Map<String, dynamic> json) =>
      _$OrderReqModelFromJson(json);

  Map<String, dynamic> toJson() => _$OrderReqModelToJson(this);
}
