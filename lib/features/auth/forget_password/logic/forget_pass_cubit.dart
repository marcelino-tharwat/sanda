import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sanda/features/auth/forget_password/data/models/email_forget_pass_req_model.dart';
import 'package:sanda/features/auth/forget_password/data/models/email_forget_pass_res_model.dart';
import 'package:sanda/features/auth/forget_password/data/repos/email_forget_pass_repo.dart';

part 'forget_pass_state.dart';

class ForgetPassCubit extends Cubit<ForgetPassState> {
  final EmailForgetPassRepo emailForgetPassRepo;
  TextEditingController emailForgetPassController = TextEditingController();

  ForgetPassCubit(this.emailForgetPassRepo) : super(ForgetPassInitial());

  void emailSent() async {
    emit(ForgetPassLoading());
    var response = await emailForgetPassRepo.emailForgetPass(
        emailForgetPassReqModel:
            EmailForgetPassReqModel(email: emailForgetPassController.text));
    response.fold(
      (falier) {
        emit(ForgetPassFalled(errorMessage: falier.errorMessage));
      },
      (emailForgetPassResModel) {
        emit(ForgetPassSuccess(
            emailForgetPassResModel: emailForgetPassResModel));
      },
    );
  }
}
