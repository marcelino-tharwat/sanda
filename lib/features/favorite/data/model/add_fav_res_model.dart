import 'package:json_annotation/json_annotation.dart';

part 'add_fav_res_model.g.dart';

@JsonSerializable()
class AddFavResModel {
  final String message;
  final int favoriteId;
  AddFavResModel({
    required this.favoriteId,
    required this.message,
  });

  factory AddFavResModel.fromJson(Map<String, dynamic> json) =>
      _$AddFavResModelFromJson(json);

  Map<String, dynamic> toJson() => _$AddFavResModelToJson(this);
}
