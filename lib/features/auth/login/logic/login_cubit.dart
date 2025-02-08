import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:sanda/features/auth/login/data/models/login_req_model.dart';
import 'package:sanda/features/auth/login/data/repo/login_repo.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  final LoginRepo loginRepo;
  final formKey = GlobalKey<FormState>();

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  LoginCubit(this.loginRepo) : super(LoginInitial());
  Future<void> emitlogin() async {
    emit(LoginLoading());

    final response = await loginRepo.login(
        loginReqModel: LoginReqModel(
            email: emailController.text, password: passwordController.text));
    response.fold((failure) => emit(LoginError(failure.errorMessage)),
        (loginResModel) => emit(LoginSuccess()));
  }
}
