import 'package:json_annotation/json_annotation.dart';

part 'fav_list_res_model.g.dart';

@JsonSerializable()
class FavListResModel {
  final int id;
  final int serviceId; // افترضت أن هذا ID الخدمة الأصلي
  final String? serviceName;
  final String? serviceImage;
  final String? serviceCategory;
  final int? servicePrice; // جعلته اختيارياً لمرونة أكبر
  final DateTime addedDate;

  // --- هذا هو الـ Constructor الجديد والمحسّن ---
  FavListResModel({
    required this.id,
    required this.serviceId,
    this.serviceName, // اختياري
    this.serviceImage, // اختياري
    this.serviceCategory, // اختياري
    this.servicePrice, // اختياري
    required this.addedDate,
  });

  // دوال الـ json_serializable لا تحتاج لتغيير
  factory FavListResModel.fromJson(Map<String, dynamic> json) =>
      _$FavListResModelFromJson(json);

  Map<String, dynamic> toJson() => _$FavListResModelToJson(this);
}