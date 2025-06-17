import 'package:json_annotation/json_annotation.dart';

part "order_model.g.dart";

@JsonSerializable()
class OrderModel {
  final int orderId;
  final DateTime startDate;
  final DateTime? inProgressDate;
  final DateTime? completionDate;
  final int userId;
  final String name;
  final String? comment;
  final int price;
  final String category;
  final String phoneNumber;
  final int status;
  final String location;
  final DateTime statusLastUpdated;
  final int volunteerId;

  OrderModel(
      this.startDate,
      this.inProgressDate,
      this.completionDate,
      this.phoneNumber,
      this.status,
      this.location,
      this.statusLastUpdated,
      this.volunteerId,
      {required this.orderId,
      required this.name,
      required this.userId,
      required this.comment,
      required this.price,
      required this.category});
  factory OrderModel.fromJson(Map<String, dynamic> json) =>
      _$OrderModelFromJson(json);

  Map<String, dynamic> toJson() => _$OrderModelToJson(this);
}
