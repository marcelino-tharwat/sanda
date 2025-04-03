import 'package:json_annotation/json_annotation.dart';

part 'email_forget_pass_res_model.g.dart';

@JsonSerializable()
class EmailForgetPassResModel {
  final String OTPcode;
  EmailForgetPassResModel({required this.OTPcode});

  factory EmailForgetPassResModel.fromJson(Map<String, dynamic> json) =>
      _$EmailForgetPassResModelFromJson(json);

  Map<String, dynamic> toJson() => _$EmailForgetPassResModelToJson(this);
}
