import 'package:json_annotation/json_annotation.dart';

part 'sign_up_req_model.g.dart';

@JsonSerializable()
class SignUpReqModel {
  final String firstName;
  final String lastName;
  final String phoneNumber;
  final String nationalId;
  final String email;
  final String password;
  final int age;
  final String address;
  final String gender;
  final String? profilePicturePath;
  final bool hasMobilityDisability;
  final String? disabilityProofPath;

  SignUpReqModel(
   { this.profilePicturePath,
    this.disabilityProofPath, 
    required this.firstName,
    required this.lastName,
    required this.phoneNumber,
    required this.nationalId,
    required this.email,
    required this.password,
    required this.age,
    required this.gender,
    required this.address,
    required this.hasMobilityDisability,
  });
  factory SignUpReqModel.fromJson(Map<String, dynamic> json) =>
      _$SignUpReqModelFromJson(json);

  Map<String, dynamic> toJson() => _$SignUpReqModelToJson(this);
}
