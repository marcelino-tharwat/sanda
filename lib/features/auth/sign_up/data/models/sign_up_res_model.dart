import 'package:json_annotation/json_annotation.dart';

part 'sign_up_res_model.g.dart';

@JsonSerializable()
class SignUpResModel {
  final String message;

  SignUpResModel({required this.message});

  factory SignUpResModel.fromJson(Map<String, dynamic> json) =>
      _$SignUpResModelFromJson(json);

  Map<String, dynamic> toJson() => _$SignUpResModelToJson(this);
}
