import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

import 'package:sanda/features/auth/sign_up/data/models/sign_up_req_model.dart';
import 'package:sanda/features/auth/sign_up/data/repo/sign_up_repo.dart';

part 'sign_up_state.dart';

class SignUpCubit extends Cubit<SignUpState> {
  final SignUpRepo signUpRepo;
  final TextEditingController emialControlr = TextEditingController();
  final TextEditingController passwordControlr = TextEditingController();
  final TextEditingController phoneControlr = TextEditingController();
  final TextEditingController firstNameControlr = TextEditingController();
  final TextEditingController lastNameControlr = TextEditingController();
  final TextEditingController ageControlr = TextEditingController();
  String? selectedGender;
  XFile? image;

  final TextEditingController egyptianNationalIDController =
      TextEditingController();

  final TextEditingController passwordConfirmationControlr =
      TextEditingController();
  final formKey = GlobalKey<FormState>();

  SignUpCubit(
    this.signUpRepo,
  ) : super(SignUpInitial());
  Future<void> emitSignUp() async {
    emit(SignUpLoading());
    var response = await signUpRepo.signUp(
        signUpReqModel: SignUpReqModel(0,
            firstName: firstNameControlr.text,
            lastName: lastNameControlr.text,
            phoneNumber: phoneControlr.text,
            nationalId: egyptianNationalIDController.text,
            email: emialControlr.text,
            password: passwordControlr.text,
            gender: selectedGender ?? "Not Specified",
            imagePath: image?.path ?? "",
            age: int.tryParse(ageControlr.text) ?? 0));
    response.fold((failure) => emit(SignUpFailed(error: failure.errorMessage)),
        (signupResModel) => emit(SignUpSuccess()));
  }
}
