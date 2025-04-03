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
  final TextEditingController addressControler = TextEditingController();
  final ValueNotifier<bool> isDisabledNotifier = ValueNotifier(false);
  String? selectedGender;
  XFile? _disabilityProofImage;
  bool? hasMobilityDisability;

  final TextEditingController egyptianNationalIDController =
      TextEditingController();

  final TextEditingController passwordConfirmationControlr =
      TextEditingController();
  final formKey = GlobalKey<FormState>();

  SignUpCubit(
    this.signUpRepo,
  ) : super(SignUpInitial());
  void setDisabilityProofImage(XFile image) {
    _disabilityProofImage = image;
  }

  Future<void> emitSignUp() async {
    if (!formKey.currentState!.validate()) return;

    emit(SignUpLoading());
    var response = await signUpRepo.signUp(
      signUpReqModel: SignUpReqModel(
        profilePicturePath: "",
        disabilityProofPath: _disabilityProofImage?.path ?? "",
        firstName: firstNameControlr.text,
        lastName: lastNameControlr.text,
        phoneNumber: phoneControlr.text,
        nationalId: egyptianNationalIDController.text,
        email: emialControlr.text,
        password: passwordControlr.text,
        gender: selectedGender ?? "Not Specified",
        age: int.tryParse(ageControlr.text) ?? 0,
        address: addressControler.text,
        hasMobilityDisability: isDisabledNotifier.value,
      ),
    );
    response.fold(
      (failure) => emit(SignUpFailed(error: failure.errorMessage)),
      (signupResModel) => emit(
        SignUpSuccess(),
      ),
    );
  }
}
