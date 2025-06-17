import 'package:json_annotation/json_annotation.dart';
part 'user_order_res_model.g.dart';
@JsonSerializable()

class UserOrderResModel {
  final int orderId;
  final DateTime? startDate;
  final DateTime? inProgressDate;
  final DateTime? completionDate;
  final String name;
  final int? userId;
  final String userName;
  final String comment;
  final String phoneNumber;
  final String status;
  final String location;
  final DateTime? statusLastUpdated;
  final DateTime createdDate;
  final int? volunteerId;
  final dynamic? user; 

  UserOrderResModel({
    required this.orderId,
    required this.startDate,
    this.inProgressDate,
    this.completionDate,
    required this.name,
    required this.userId,
    required this.userName,
    required this.comment,
    required this.phoneNumber,
    required this.status,
    required this.location,
    required this.statusLastUpdated,
    required this.createdDate,
     this.volunteerId,
    this.user,
  });
    factory UserOrderResModel.fromJson(Map<String, dynamic> json) =>
      _$UserOrderResModelFromJson(json);

  Map<String, dynamic> toJson() => _$UserOrderResModelToJson(this);
}