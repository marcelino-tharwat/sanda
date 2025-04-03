import 'package:json_annotation/json_annotation.dart';

part 'email_forget_pass_req_model.g.dart';

@JsonSerializable()
class EmailForgetPassReqModel {
  final String email;

  EmailForgetPassReqModel({
    required this.email,
  });

  factory EmailForgetPassReqModel.fromJson(Map<String, dynamic> json) =>
      _$EmailForgetPassReqModelFromJson(json);

  Map<String, dynamic> toJson() => _$EmailForgetPassReqModelToJson(this);
}
