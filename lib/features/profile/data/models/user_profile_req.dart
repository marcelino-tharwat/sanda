import 'package:json_annotation/json_annotation.dart';

part 'user_profile_req.g.dart';

@JsonSerializable()
class DataProfileRequest {
  final int id;

  DataProfileRequest(this.id);

  factory DataProfileRequest.fromJson(Map<String, dynamic> json) =>
      _$DataProfileRequestFromJson(json);

  Map<String, dynamic> toJson() => _$DataProfileRequestToJson(this);
}